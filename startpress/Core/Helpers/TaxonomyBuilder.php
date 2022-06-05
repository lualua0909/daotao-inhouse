<?php

namespace StartPress\Core\Helpers;

use Illuminate\Support\HtmlString;
use StartPress\Core\Models\Option;
use StartPress\Core\Models\Taxonomy;

class TaxonomyBuilder
{
    /**
     * @var Taxonomy
     */
    protected $taxonomy;

    /**
     * @var Option
     */
    protected $option;

    public function __construct(Taxonomy $taxonomy, Option $option)
    {
        $this->taxonomy = $taxonomy;

        $this->option = $option;
    }

    public function structuredTaxonomySelect($name, $title, $post_taxomonies = null)
    {
        return $this->toHtmlString(
            '<div class="form-group">' .
            '<label hidden>' . $title . '</label>' .
            '<div class="select2-purple">' .
            '<select id="select2_' . $name . '" class="select2" multiple="multiple" data-placeholder="Chọn ' . $title . ' có sẳn" data-dropdown-css-class="select2-purple" style="width: 100%;" name="taxonomies[]">' .
            $this->getStructuredTaxonomyOption($name, $post_taxomonies) .
            '</select>' .
            '</div>' .
            '</div>'
        );
    }

    public function getStructuredTaxonomyOption($name, $post_taxomonies = null)
    {
        $taxonomies = $this->taxonomy->name($name)->get();
        $options = '';
        if ($taxonomies):
            foreach ($this->taxonomyRefactoring($taxonomies) as $taxonomy):
                $selected = '';
                if ($post_taxomonies):
                    foreach ($post_taxomonies as $item):
                        if ($taxonomy['term_id'] === $item->term_id):
                            $selected = 'selected';
                        endif;
                    endforeach;
                endif;
                $options .= $this->toHtmlString(
                    '<option value="' . $taxonomy['term_id'] . '"' . $selected . '>' . $taxonomy['name'] . '</option>'
                );
            endforeach;
        endif;
        return $options;
    }

    public function structuredTaxonomy($name, $post_taxomonies = null, $parent = 0)
    {
        $taxonomies = $this->taxonomy->name($name)->parent($parent)->get();
        $parent_items = '';
        if ($taxonomies):
            foreach ($taxonomies as $taxonomy):
                $checked = '';
                if ($post_taxomonies):
                    foreach ($post_taxomonies as $item):
                        if ($taxonomy->term_id === $item->term_id):
                            $checked = 'checked';
                        endif;
                    endforeach;
                endif;
                $parent_items .= $this->toHtmlString(
                    '<div class="checkbox-item" id="checkbox-item-' . $taxonomy->term_id . '">' .
                    '<div class="form-check">' .
                    '<input class="form-check-input" type="checkbox" name="taxonomies[]" value="' . $taxonomy->term_id . '"' . $checked . '>' .
                    '<label class="form-check-label">' .
                    $taxonomy->term->name . '</label>' .
                    '</div>' .
                    $this->structuredChildTaxonomy($name, $post_taxomonies, $taxonomy->term_id) .
                    '</div>'
                );
            endforeach;
        endif;
        return $this->toHtmlString('<div class="taxonomy-check-list" id="' . $name . '_check_list">' . $parent_items . '</div>');
    }

    public function structuredChildTaxonomy($name, $post_taxomonies = null, $parent = 0)
    {
        $taxonomies = $this->taxonomy->name($name)->parent($parent)->get();
        $child_items = '';
        if ($taxonomies):
            foreach ($taxonomies as $taxonomy):
                $checked = '';
                if ($post_taxomonies):
                    foreach ($post_taxomonies as $item):
                        if ($taxonomy->term_id === $item->term_id):
                            $checked = 'checked';
                        endif;
                    endforeach;
                endif;
                $child_items .= $this->toHtmlString(
                    '<div class="children">' .
                    '<div class="checkbox-item" id="checkbox-item-' . $taxonomy->term_id . '">' .
                    '<div class="form-check">' .
                    '<input class="form-check-input" type="checkbox" name="taxonomies[]" value="' . $taxonomy->term_id . '"' . $checked . '>' .
                    '<label class="form-check-label">' . $taxonomy->term->name . '</label>' .
                    '</div>' .
                    $this->structuredChildTaxonomy($name, $post_taxomonies, $taxonomy->term_id) .
                    '</div>' .
                    '</div>'
                );
            endforeach;
        endif;
        return $this->toHtmlString($child_items);
    }

    public function addNewTaxonomy($name, $title, $parent)
    {
        $addNewTaxonomyModalHeader = $this->toHtmlString(
            '<div class="modal fade" id="add_new_' . $name . '_modal">' .
            '<div class="modal-dialog">' .
            '<div class="modal-content">' .
            '<div class="modal-header">' .
            '<h4 class="modal-title">Thêm ' . $title . ' mới</h4>' .
            '<button type="button" class="close" data-dismiss="modal" aria-label="Close">' .
            '<span aria-hidden="true">&times;</span>' .
            '</button>' .
            '</div>' .
            '<div class="modal-body">'
        );

        $addNewTaxonomyModalFooter = $this->toHtmlString(
            '</div>' .
            '<div class="modal-footer text-right">' .
            '<button id="add_new_' . $name . '_button" type="button" class="btn btn-info">Thêm ' . $title . '</button>' .
            '</div>' .
            '</div>' .
            '</div>' .
            '</div>'
        );

        if ($parent === true):
            $addNewTaxonomyModal = $this->toHtmlString($addNewTaxonomyModalHeader .
                '<div class="form-group">' .
                '<div class="input-group">' .
                '<input type="text" id="' . $name . '_title" placeholder="Thêm ' . $title . '" class="form-control">' .
                '</div>' .
                '</div>' .
                '<div class="form-group">' .
                '<select id="' . $name . '_parent" class="form-control select2" style="width: 100%;">' .
                '<option selected="selected" value="0">— ' . $title . ' cha —</option>' .
                $this->getStructuredTaxonomyOption($name) .
                '</select>' .
                '</div>' . $addNewTaxonomyModalFooter
            );
        else:
            $addNewTaxonomyModal = $this->toHtmlString($addNewTaxonomyModalHeader .
                '<div class="input-group">' .
                '<input type="text" id="' . $name . '_title" placeholder="Thêm ' . $title . '" class="form-control">' .
                '</div>' . $addNewTaxonomyModalFooter
            );
        endif;

        return $addNewTaxonomyModal;
    }

    public function taxonomyRefactoring($taxonomies = [], $parent = 0, $spacing = '', $structuredTaxonomy = [])
    {
        if ($taxonomies):
            foreach ($taxonomies as $taxonomy):
                if ($taxonomy->parent === $parent):
                    $structuredTaxonomy[] = array(
                        "term_taxonomy_id" => $taxonomy->term_taxonomy_id,
                        "term_id" => $taxonomy->term_id,
                        "name" => $spacing . $taxonomy->term->name,
                        "slug" => $taxonomy->term->slug,
                        "description" => $taxonomy->description,
                        "count" => $taxonomy->count
                    );
                    $structuredTaxonomy = $this->taxonomyRefactoring($taxonomies, $taxonomy->term_id, $spacing . '— ', $structuredTaxonomy);
                endif;
            endforeach;
        endif;
        return $structuredTaxonomy;
    }

    public function getCategoryLink($term_id): string
    {
        $taxonomy = $this->taxonomy->find($term_id);
        return $site_name = $this->option->get('site_url') . '/' . $taxonomy->taxonomy . '/' . $this->getCategorySlug($term_id);
    }

    public function getCategorySlug($term_id): string
    {
        $category_slugs = '';
        $taxonomy = $this->taxonomy->find($term_id);
        $category_slugs .= $taxonomy->term->slug;
        if ($taxonomy->parent !== 0):
            $category_slugs = $this->getCategorySlug($taxonomy->parent) . '/' . $category_slugs;
        endif;
        return $category_slugs;
    }

    protected function toHtmlString($html): HtmlString
    {
        return new HtmlString($html);
    }
}
