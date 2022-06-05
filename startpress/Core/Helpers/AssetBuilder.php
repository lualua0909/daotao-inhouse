<?php

namespace StartPress\Core\Helpers;

use Illuminate\Support\Facades\Route;
use Illuminate\Support\HtmlString;
use StartPress\Core\Models\Option;

class AssetBuilder
{
    /**
     * @var Option
     */
    protected $option;

    /**
     * @var null
     */
    protected $site_url;

    protected $currentRoute;

    public function __construct(Option $option)
    {
        $this->option = $option;

        $this->site_url = $this->option->get('site_url');

        $this->currentRoute = Route::currentRouteName();
    }

    public function addAsset($asset, $assetName = null, $type = null, $theme = false)
    {
        $route = [];
        $attributes = [];

        if (isset($asset['route'])):
            $route = $asset['route'];
        endif;

        if (!empty($route) && !in_array($this->currentRoute, $route)):
            return '';
        endif;

        if (isset($asset['attributes'])):
            $attributes = $asset['attributes'];
        endif;

        $cssAttributes = [
            'media' => 'all',
            'type' => 'text/css',
            'rel' => 'stylesheet',
        ];

        $jsAttributes = [
            'type' => 'text/javascript',
        ];

        $location = key((array)$asset);

        $path = current((array)$asset);

        if ($location === 'local'):
            if ($theme === null || $theme === false):
                $link = $this->site_url . '/public/startpress/core/' . $path;
            else:
                $link = $this->site_url . '/public/startpress/theme/' . $path;
            endif;
        else:
            $link = $path;
        endif;

        if ($type === null):
            return '';
        else:
            if ($type === 'css'):
                if ($assetName !== null):
                    $attributes['id'] = $assetName . '-css';
                endif;
                $attributes['href'] = $link;
                $attributes = array_merge($cssAttributes, $attributes);
                return $this->toHtmlString('<link' . $this->attributes($attributes) . '>');
            elseif ($type === 'js'):
                if ($assetName !== null):
                    $attributes['id'] = $assetName . '-js';
                endif;
                $attributes['src'] = $link;
                $attributes = array_merge($jsAttributes, $attributes);
                return $this->toHtmlString('<script' . $this->attributes($attributes) . '></script>');
            else:
                return '';
            endif;
        endif;

    }

    protected function toHtmlString($html): HtmlString
    {
        return new HtmlString($html);
    }

    public function attributes($attributes): string
    {
        $html = [];

        foreach ((array)$attributes as $key => $value) {
            $element = is_numeric($key) ? $key : $this->attributeElement($key, $value);

            if (empty($element)) {
                continue;
            }

            $html[] = $element;
        }

        return count($html) > 0 ? ' ' . implode(' ', $html) : '';
    }

    protected function attributeElement($key, $value): string
    {
        // Treat boolean attributes as HTML properties
        if (is_bool($value) && $key !== 'value') {
            return $value ? $key : '';
        }

        if (is_array($value) && $key === 'class') {
            return 'class="' . implode(' ', $value) . '"';
        }

        if (!empty($value)) {
            return $key . '="' . e($value, false) . '"';
        }

        return $value;
    }
}
