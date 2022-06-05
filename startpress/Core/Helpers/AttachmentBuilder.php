<?php

namespace StartPress\Core\Helpers;

use StartPress\Core\Models\Attachment;

class AttachmentBuilder
{
    /**
     * @var Attachment
     */
    protected $attachment;

    public function __construct(Attachment $attachment)
    {
        $this->attachment = $attachment;
    }

    public function get_attachment_url($attachment_id)
    {
        $attachment = $this->attachment->find($attachment_id);
        if ($attachment):
            return asset('contents/uploads/' . $attachment->meta->attached_file);
        else:
            return null;
        endif;
    }
}
