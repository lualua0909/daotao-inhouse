<?php

namespace StartPress\Core\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Config\Repository;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use StartPress\Core\Helpers\Helpers;
use StartPress\Core\Helpers\UserRole;
use StartPress\Core\Models\Taxonomy;
use StartPress\Core\Models\Term;

class TaxonomyController extends Controller
{
    /**
     * @var string
     */
    protected $guard = 'admin';

    /**
     * @var Taxonomy
     */
    protected $taxonomy;

    /**
     * @var Term
     */
    protected $term;

    /**
     * @var Repository
     */
    protected $config;

    /**
     * @var Helpers
     */
    protected $helpers;

    /**
     * @var UserRole
     */
    protected $userRole;

    public function __construct(Taxonomy $taxonomy, Repository $config, Term $term, Helpers $helpers, UserRole $userRole)
    {
        $this->taxonomy = $taxonomy;

        $this->term = $term;

        $this->helpers = $helpers;

        $this->config = $config->get('core');

        $this->userRole = $userRole;
    }

    public function taxonomy(Request $request, $taxonomy = null)
    {
        /**
         * Check role
         */
        $this->userRole->authorizeRoles(Auth::guard($this->guard)->user(), 'manage_categories');

        if (isset($this->config['taxonomies'][$taxonomy])):
            $option = $this->config['taxonomies'][$taxonomy];
        else:
            return abort(404);
        endif;

        if ($request->getMethod() == 'GET'):
            $taxonomies_paginate = $this->taxonomy->name($taxonomy)->paginate(20);
            $taxonomies = $this->taxonomy->name($taxonomy)->get();
            return view('taxonomy.taxonomy', compact('taxonomies', 'taxonomies_paginate', 'option'));
        endif;

        $input = $request->all();

        /**
         * Validation
         */
        $validator = Validator::make($input, [
            'name' => 'required|unique:terms,name'
        ],
            [
                'name.required' => 'Tên ' . $option['name'] . ' là bắt buộc',
                'name.unique' => $option['name'] . ' đã được sử dụng',
            ]
        );

        if ($validator->fails()):
            return redirect()->back()->withErrors($validator);
        endif;

        $this->term = new Term();
        $this->term->name = $input['name'];
        $this->term->slug = $input['slug'];

        if ($input['slug'] === '' || $input['slug'] === null):
            $this->term->slug = $this->helpers->slugGenerator($input['name'], true);
        endif;

        $this->taxonomy = new Taxonomy();

        if ($input['description'] === null):
            $input['description'] = '';
        endif;

        $this->taxonomy->taxonomy = $input['taxonomy'];
        $this->taxonomy->description = $input['description'];
        if ($request->has('parent')):
            $this->taxonomy->parent = $input['parent'];
        endif;
        if ($this->term->save()):
            $this->term->taxonomy()->save($this->taxonomy);
            return redirect()->back()->with('success', 'Thêm ' . $option['name'] . ' thành công');
        else:
            return redirect()->back()->with('error', 'Đã có lỗi xảy ra');
        endif;
    }

    public function editTaxonomy(Request $request, $taxonomy_ID)
    {
        if ($this->taxonomy->find($taxonomy_ID)):
            $taxonomy = $this->taxonomy->find($taxonomy_ID);
            $term = $this->term->find($taxonomy_ID);
            if (isset($this->config['taxonomies'][$taxonomy['taxonomy']])):
                $option = $this->config['taxonomies'][$taxonomy['taxonomy']];
            else:
                return abort(404);
            endif;
        else:
            return abort(404);
        endif;

        if ($request->getMethod() == 'GET'):
            $taxonomies = $this->structuredTaxonomy($taxonomy['taxonomy']);
            return view('taxonomy.edit', compact('taxonomies', 'taxonomy', 'option'));
        endif;

        $input = $request->all();

        if (isset($input['delete'])):
            if ($input['delete'] === true || $input['delete'] === 'true'):
                $newTaxonomy = new Taxonomy();
                $newTerm = new Term();
                $taxonomy_children = $newTaxonomy->name($taxonomy['taxonomy'])->parent($taxonomy_ID)->get();
                if (count($taxonomy_children)):
                    foreach ($taxonomy_children as $child):
                        $childTerm = $newTerm->find($child->term_id);
                        $childTax = $newTaxonomy->find($child->term_id);
                        $childTax->parent = $taxonomy->parent;
                        $childTerm->taxonomy()->save($childTax);
                    endforeach;
                endif;
                if ($term->taxonomy()->delete() && $term->delete()):
                    return response()->json(['success' => true, 'name' => $option['name'], 'route' => route('taxonomy', $taxonomy['taxonomy'])]);
                endif;
            endif;
        endif;

        /**
         * Validation
         */
        $name_validator = Validator::make($input, [
            'name' => 'required',
        ],
            [
                'name.required' => 'Tên ' . $option['name'] . ' là bắt buộc',
            ]
        );

        if ($name_validator->fails()):
            return redirect()->back()->withErrors($name_validator);
        endif;

        if ($input['slug'] !== $taxonomy->term->slug):
            $slug_validator = Validator::make($input, [
                'slug' => 'unique:terms,slug',
            ],
                [
                    'slug.unique' => 'Đường dẫn đã được sử dụng, vui lòng chọn đường dẫn khác',
                ]
            );
            if ($slug_validator->fails()):
                return redirect()->back()->withErrors($slug_validator);
            endif;
        endif;

        $term->name = $input['name'];
        $term->slug = $input['slug'];

        if ($input['slug'] === '' || $input['slug'] === null):
            $term->slug = $this->helpers->slugGenerator($input['name'], true);
        endif;

        if ($input['description'] === null):
            $input['description'] = '';
        endif;

        $taxonomy->description = $input['description'];
        if ($request->has('parent')):
            $taxonomy->parent = $input['parent'];
        endif;
        if ($term->save()):
            $term->taxonomy()->save($taxonomy);
            return redirect()->back()->with('success', $option['name'] . ' đã được cập nhật');
        else:
            return redirect()->back()->with('error', 'Đã có lỗi xảy ra');
        endif;
    }

    public function addNewTaxonomyAjax(Request $request)
    {
        $input = $request->all();

        if (isset($this->config['taxonomies'][$input['taxonomy']])):
            $option = $this->config['taxonomies'][$input['taxonomy']];
        else:
            return abort(404);
        endif;

        /**
         * Validation
         */

        $required_validator = Validator::make($input, [
                'name' => 'required'
            ]
        );

        if ($required_validator->fails()):
            return response()->json(['error' => 'required', 'name' => $option['name']]);
        endif;

        $unique_validator = Validator::make($input, [
                'name' => 'unique:terms,name'
            ]
        );

        if ($unique_validator->fails()):
            return response()->json(['error' => 'unique', 'name' => $option['name']]);
        endif;

        $this->term = new Term();
        $this->taxonomy = new Taxonomy();
        $this->term->name = $input['name'];
        $this->term->slug = $this->helpers->slugGenerator($input['name'], true);
        $this->taxonomy->taxonomy = $input['taxonomy'];
        $this->taxonomy->description = '';

        if ($request->has('parent')):
            $this->taxonomy->parent = $input['parent'];
        endif;
        if ($this->term->save()):
            $this->term->taxonomy()->save($this->taxonomy);
            return response()->json(['success' => true, 'term' => $this->term, 'taxonomy' => $this->taxonomy, 'name' => $option['name']]);
        else:
            return redirect()->back()->with('error', true);
        endif;
    }
}
