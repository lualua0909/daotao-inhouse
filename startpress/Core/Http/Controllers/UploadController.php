<?php

namespace StartPress\Core\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Config\Repository;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Response;
use StartPress\Core\Helpers\UserRole;
use StartPress\Core\Models\Attachment;

class UploadController extends Controller
{
    /**
     * @var Repository
     */
    protected $config;

    /**
     * @var string
     */
    protected $guard = 'admin';

    /**
     * @var string
     */
    protected $uploads_path;

    /**
     * @var false|string
     */
    protected $year;

    /**
     * @var false|string
     */
    protected $month;

    /**
     * @var int
     */
    protected $order;

    /**
     * @var Attachment
     */
    protected $attachment;

    /**
     * @var array
     */
    protected $image_sizes = [];


    /**
     * @var string
     */
    protected $postType = '';

    /**
     * @var UserRole
     */
    protected $userRole;

    public function __construct(Attachment $attachment, Repository $config, UserRole $userRole)
    {
        $this->config = $config->get('core');
        $this->image_sizes = $this->config['image_sizes'];
        $this->attachment = $attachment;
        $this->month = date('m');
        $this->year = date('Y');
        $this->order = 1;
        $this->uploads_path = public_path('/contents/uploads/' . $this->year . '/' . $this->month);
        $this->postType = 'attachment';
        $this->userRole = $userRole;
    }

    public function media()
    {
        /**
         * Check role
         */
        $this->userRole->authorizeRoles(Auth::guard($this->guard)->user(), 'edit_files');
        return view('upload.media');
    }

    public function mediaAjax()
    {
        /**
         * Check role
         */
        $this->userRole->authorizeRoles(Auth::guard($this->guard)->user(), 'edit_files');
        $attachments = $this->attachment->type($this->postType)->orderBy('ID', 'DESC')->paginate(100);
        $media = [];
        if ($attachments):
            foreach ($attachments as $attachment):
                $attachment_metadata = unserialize($attachment->meta->attachment_metadata);
                $timestamp = strtotime($attachment->post_date);
                $file_url = asset('contents/uploads/' . $attachment->meta->attached_file);
                $headers = get_headers($file_url, true);
                $media[] = [
                    'ID' => $attachment->ID,
                    'url' => $file_url,
                    'file_size' => $this->formatSizeUnits($headers['Content-Length']),
                    'name' => $attachment->post_title,
                    'type' => $attachment->post_mime_type,
                    'uploaded' => date('d M, Y', $timestamp),
                    'dimensions' => $attachment_metadata['width'] . 'x' . $attachment_metadata['height'],
                    'author' => $attachment->author->display_name,
                    'alt' => $attachment->meta->attachment_image_alt,
                    'description' => $attachment->post_content,
                    'caption' => $attachment->post_excerpt,
                ];
            endforeach;
        endif;
        return response()->json(['data' => $media, 'success' => true]);
    }

    public function attachmentDetails(Request $request)
    {
        /**
         * Check role
         */
        $this->userRole->authorizeRoles(Auth::guard($this->guard)->user(), 'edit_files');

        $attachment_id = $request->attachment_id;
        $attachment = $this->attachment->find($attachment_id);
        $attachment_metadata = unserialize($attachment->meta->attachment_metadata);
        $timestamp = strtotime($attachment->post_date);
        $file_url = asset('contents/uploads/' . $attachment->meta->attached_file);
        $headers = get_headers($file_url, true);
        $attachmentDetails = array(
            'link' => $file_url,
            'file_size' => $this->formatSizeUnits($headers['Content-Length']),
            'name' => $attachment->post_title,
            'type' => $attachment->post_mime_type,
            'uploaded' => date('d M, Y', $timestamp),
            'dimensions' => $attachment_metadata['width'] . 'x' . $attachment_metadata['height'],
            'author' => $attachment->author->display_name,
            'alt' => $attachment->meta->attachment_image_alt,
            'description' => $attachment->post_content,
            'caption' => $attachment->post_excerpt,
        );
        if ($attachment):
            return Response::json($attachmentDetails);
        else:
            return Response::json(array('error' => true));
        endif;
    }

    public function editAttachment(Request $request)
    {
        /**
         * Check role
         */
        $this->userRole->authorizeRoles(Auth::guard($this->guard)->user(), 'edit_files');

        $attachment_id = $request->attachment_id;
        $attachment = $this->attachment->find($attachment_id);
        $alt = $request->alt;
        $title = $request->title;
        $caption = $request->caption;
        $description = $request->description;

        $attachment->post_title = $title;
        $attachment->post_content = $description;
        $attachment->post_excerpt = $caption;
        $attachment->saveMeta('attachment_image_alt', $alt);
        if ($attachment->save()):
            return Response::json(array('success' => true));
        else:
            return Response::json(array('error' => true));
        endif;
    }

    public function deleteAttachment(Request $request)
    {
        /**
         * Check role
         */
        $this->userRole->authorizeRoles(Auth::guard($this->guard)->user(), 'edit_files');
        $attachment_id = $request->attachment_id;
        $attachment = $this->attachment->find($attachment_id);
        $attachment_path = base_path('public/contents/uploads/' . $attachment->meta->attached_file);
        if ($attachment->meta()->delete() && $attachment->delete()):
            if (file_exists($attachment_path)) {
                unlink($attachment_path);
            }
            return Response::json(array('success' => true));
        else:
            return Response::json(array('error' => true));
        endif;
    }

    public function new(Request $request)
    {
        /**
         * Check role
         */
        $this->userRole->authorizeRoles(Auth::guard($this->guard)->user(), 'upload_files');

        if ($request->getMethod() == 'GET'):
            return view('upload.new');
        endif;

        $files = $request->file('file');

        if (!is_array($files)) {
            $files = [$files];
        }

        if (!is_dir($this->uploads_path)) {
            mkdir($this->uploads_path, 0777, true);
        }

        /**
         *
         */
        $current_user = Auth::guard($this->guard)->user();

        /**
         *
         */
        foreach ($files as $file):


            /**
             *
             */
            $file_name = $file->getClientOriginalName();

            /**
             *
             */
            $file_extension = $file->getClientOriginalExtension();

            /**
             *
             */
            $file_basename = basename($file_name, '.' . $file_extension);

            /**
             *
             */
            $file_name_generator = $this->fileNameGenerator($this->uploads_path, $file_name, $file_basename, $file_extension);

            /**
             *
             */
            $file_path = $this->year . '/' . $this->month . '/' . $file_name_generator;

            /**
             * Image data
             */
            $file_data = getimagesize($file);
            $image_width = $file_data[0];
            $image_height = $file_data[1];
            $image_mime_type = $file_data['mime'];

            /**
             * Image meta data
             */
            $image_meta_data = array(
                'width' => $image_width,
                'height' => $image_height,
                'file' => $file_path,
                'sizes' => $this->cropImageSizes($file)
            );

            /**
             *
             */
            $file->move($this->uploads_path, $file_name_generator);

            /**
             *
             */
            $post_name = basename($file_name_generator, '.' . $file_extension);

            /**
             *
             */
            $post_name = str_replace(" ", "-", $post_name);

            /**
             *
             */
            $this->attachment = new Attachment();
            $this->attachment->post_author = $current_user->ID;
            $this->attachment->post_title = $file_basename;
            $this->attachment->post_status = 'inherit';
            $this->attachment->post_name = $post_name;
            $this->attachment->ping_status = 'closed';
            $this->attachment->post_type = $this->postType;
            $this->attachment->post_mime_type = $image_mime_type;

            /**
             *
             */
            if ($this->attachment->save()):
                $this->attachment->saveMeta([
                    'attached_file' => $file_path,
                    'attachment_metadata' => serialize($image_meta_data),
                ]);
            endif;
        endforeach;

        return Response::json([
            'message' => 'Image saved Successfully'
        ], 200);
    }


    public function fileNameGenerator($path = '', $file_name = '', $base_name = '', $file_extension = '', $crop = null)
    {
        $file_name = str_replace(" ", "-", $file_name);
        $file_path = $path . '/' . $file_name;
        if (!file_exists($file_path)):
            if ($crop):
                return $base_name . '-' . $crop . '.' . $file_extension;
            else:
                return $file_name;
            endif;
        else:
            if ($crop):
                $new_file_name = $base_name . '-' . $this->order++ . '-' . $crop . '.' . $file_extension;
                return $this->fileNameGenerator($path, $new_file_name, $base_name, $file_extension, $crop);
            else:
                $new_file_name = $base_name . '-' . $this->order++ . '.' . $file_extension;
                return $this->fileNameGenerator($path, $new_file_name, $base_name, $file_extension);
            endif;

        endif;
    }

    public function cropImageSizes($image)
    {
        $crop_sizes = [];
        $image_sizes = $this->image_sizes;
        $file_data = getimagesize($image);
        $image_width = (int)$file_data[0];
        $image_height = (int)$file_data[1];
        $image_mime_type = $file_data['mime'];

        $original_aspect = $image_width / $image_height;

        /**
         *
         */
        $file_name = $image->getClientOriginalName();

        /**
         *
         */
        $file_extension = $image->getClientOriginalExtension();

        /**
         *
         */
        $file_basename = basename($file_name, '.' . $file_extension);

        if ($image_sizes):
            foreach ($image_sizes as $size_name => $size):
                $crop_width = (int)$size['width'];
                $crop_height = (int)$size['height'];
                if ($crop_width >= $image_width && $crop_height >= $image_height):
                    continue;
                endif;
                if ($size_name == 'large'):
                    //Crop theo tỉ lệ
                    $new_height = 0;
                    $new_width = 0;
                    if ($image_width > $image_height):
                        if ($image_width > $crop_width):
                            $new_width = $crop_width;
                            $new_height = $image_height / ($image_width / $crop_width);
                        endif;
                    else:
                        if ($image_height > $crop_height):
                            $new_height = $crop_height;
                            $new_width = $image_width / ($image_height / $crop_height);
                        endif;
                    endif;
                else:
                    //Crop theo kích thước
                    $crop_aspect = $crop_width / $crop_height;
                    if ($original_aspect >= $crop_aspect):
                        $new_height = $crop_height;
                        $new_width = $image_width / ($image_height / $crop_height);
                        if ($new_width > $crop_width):
                            $new_width = $crop_width;
                        endif;
                    else:
                        $new_width = $crop_width;
                        $new_height = $image_height / ($image_width / $crop_width);
                        if ($new_height > $crop_height):
                            $new_height = $crop_height;
                        endif;
                    endif;
                endif;
                $crop_sizes[$size_name] = [
                    'file' => $this->fileNameGenerator($this->uploads_path, $file_name, $file_basename, $file_extension, $new_width . 'x' . $new_height),
                    'width' => (int)$new_width,
                    'height' => (int)$new_height,
                    'mime-type' => $image_mime_type
                ];
            endforeach;
        endif;
        return $crop_sizes;
    }

    function formatSizeUnits($bytes)
    {
        if ($bytes >= 1073741824) {
            $bytes = number_format($bytes / 1073741824, 2) . ' GB';
        } elseif ($bytes >= 1048576) {
            $bytes = number_format($bytes / 1048576, 2) . ' MB';
        } elseif ($bytes >= 1024) {
            $bytes = number_format($bytes / 1024, 2) . ' KB';
        } elseif ($bytes > 1) {
            $bytes = $bytes . ' bytes';
        } elseif ($bytes == 1) {
            $bytes = $bytes . ' byte';
        } else {
            $bytes = '0 bytes';
        }
        return $bytes;
    }
}
