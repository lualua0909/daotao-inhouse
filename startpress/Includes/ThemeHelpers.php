<?php

function get_the_title($post = 0): string
{
    return isset($post->post_title) ? $post->post_title : '';
}

function the_title($post, $echo = true)
{
    $title = get_the_title($post);

    if (strlen($title) == 0) {
        return '';
    }

    if ($echo):
        echo $title;
    else:
        return $title;
    endif;
}

function get_the_author_meta($field = '', $post = false)
{
    if (in_array($field, array('ID', 'login', 'pass', 'nicename', 'email', 'url', 'registered', 'activation_key', 'display_name'), true)) {
        $field = 'user_' . $field;
        if ($field === 'user_display_name'):
            $field = 'display_name';
        endif;
    }
    return isset($post->author->$field) ? $post->author->$field : '';
}

function get_post_time($format = 'U', $post = null)
{
    if (!$post) {
        return false;
    }
    return date($format, strtotime($post->post_date));
}

function get_post_thumbnail_url($post = false)
{
    if (!$post) {
        return false;
    }
    if (isset($post->thumbnail->attachment)):
        return asset('contents/uploads/' . $post->thumbnail->attachment->meta->attached_file);
    else:
        return false;
    endif;
}

function get_the_excerpt($post = false, $length = 20)
{
    $excerpt = '';
    if (!$post) {
        return '';
    }

    if ($post->post_excerpt !== ''):
        $excerpt = $post->post_excerpt;
    else:
        $excerpt = $post->post_content;
    endif;

    return $excerpt;
}

function get_the_content($post = false)
{
    if (!$post) {
        return '';
    }

    return $post->post_content;
}

function get_permalink($post = false)
{
    if (!$post) {
        return false;
    }
    $site_info = app('site_info');
    return $site_info['site_url'] . '/' . $post->post_name;
}

function sp_menu($args = array())
{
    $defaults = array(
        'container' => 'div',
        'container_class' => '',
        'container_id' => '',
        'menu_class' => 'menu',
        'menu_id' => '',
        'theme_location' => '',
    );

    $site_info = app('site_info');
    $menu_locations = $site_info['menu_locations'];
    $args = array_merge($defaults, $args);
    $menu_location = $menu_locations[$args['theme_location']];
    return StartPress::getMenuBuilder()->get_menu($menu_location, $args);
}
