<?php

namespace StartPress\Core\Helpers;

use Illuminate\Config\Repository;
use Illuminate\Support\Facades\Validator;

class Helpers
{
    /**
     * @var Repository
     */
    protected $config;

    /**
     * @var Repository
     */
    protected $themeConfig;

    /**
     * @var array
     */
    protected $adminAssets = [];

    /**
     * @var array
     */
    protected $themeAssets = [];

    /**
     * @var array
     */
    protected $styles = [];

    /**
     * @var array
     */
    protected $scripts = [];

    /**
     * @var array
     */
    protected $themeStyles = [];

    /**
     * @var array
     */
    protected $themeScripts = [];

    /**
     * @var array
     */
    protected $adminMenus = [];

    /**
     * @var AssetBuilder
     */
    protected $assetBuilder;

    /**
     * @var AdminMenuBuilder
     */
    protected $adminMenuBuilder;

    /**
     * @var UserRole
     */
    protected $userRole;

    /**
     * @var TaxonomyBuilder
     */
    protected $taxonomyBuilder;

    /**
     * @var MenuEditorBuilder
     */
    protected $menuEditorBuilder;

    /**
     * @var MenuBuilder
     */
    protected $menuBuilder;

    /**
     * @var AttachmentBuilder
     */
    protected $attachmentBuilder;

    public function __construct(
        Repository $config,
        AssetBuilder $assetBuilder,
        AdminMenuBuilder $adminMenuBuilder,
        UserRole $userRole,
        TaxonomyBuilder $taxonomyBuilder,
        MenuEditorBuilder $menuEditorBuilder,
        MenuBuilder $menuBuilder,
        AttachmentBuilder $attachmentBuilder
    )
    {
        $this->config = $config->get('core');

        $this->themeConfig = $config->get('theme');

        $this->adminAssets = $this->config['admin-assets'];

        $this->themeAssets = $this->themeConfig['assets'];

        $this->adminMenus = $this->config['admin-menus'];

        $this->styles = $this->adminAssets['css'];

        $this->scripts = $this->adminAssets['js'];

        $this->themeStyles = $this->themeAssets['css'];

        $this->themeScripts = $this->themeAssets['js'];

        $this->assetBuilder = $assetBuilder;

        $this->adminMenuBuilder = $adminMenuBuilder;

        $this->userRole = $userRole;

        $this->taxonomyBuilder = $taxonomyBuilder;

        $this->menuEditorBuilder = $menuEditorBuilder;

        $this->menuBuilder = $menuBuilder;

        $this->attachmentBuilder = $attachmentBuilder;
    }

    /**
     * @return AssetBuilder
     */
    public function getAssetBuilder(): AssetBuilder
    {
        return $this->assetBuilder;
    }

    /**
     * @return AdminMenuBuilder
     */
    public function getAdminMenuBuilder(): AdminMenuBuilder
    {
        return $this->adminMenuBuilder;
    }

    /**
     * @return UserRole
     */
    public function getUserRole(): UserRole
    {
        return $this->userRole;
    }

    /**
     * @return AttachmentBuilder
     */
    public function getAttachmentBuilder(): AttachmentBuilder
    {
        return $this->attachmentBuilder;
    }

    /**
     * @return TaxonomyBuilder
     */
    public function getTaxonomyBuilder(): TaxonomyBuilder
    {
        return $this->taxonomyBuilder;
    }


    /**
     * @return MenuEditorBuilder
     */
    public function getMenuEditorBuilder(): MenuEditorBuilder
    {
        return $this->menuEditorBuilder;
    }

    /**
     * @return MenuBuilder
     */
    public function getMenuBuilder(): MenuBuilder
    {
        return $this->menuBuilder;
    }

    /**
     * @param false $footer
     * @return array
     */
    public function getScripts($footer = false): array
    {
        $headerScripts = [];
        $footerScripts = [];
        if ($this->scripts):
            foreach ($this->scripts as $assetName => $script):
                if (isset($script['footer']) && $script['footer'] === true):
                    $footerScripts[$assetName] = $script;
                else:
                    $headerScripts[$assetName] = $script;
                endif;
            endforeach;
        endif;
        if ($footer === true):
            return $footerScripts;
        else:
            return $headerScripts;
        endif;
    }

    /**
     * @param false $footer
     * @return array
     */
    public function getThemeScripts($footer = false): array
    {
        $headerScripts = [];
        $footerScripts = [];
        if ($this->themeScripts):
            foreach ($this->themeScripts as $assetName => $script):
                if (isset($script['footer']) && $script['footer'] === true):
                    $footerScripts[$assetName] = $script;
                else:
                    $headerScripts[$assetName] = $script;
                endif;
            endforeach;
        endif;
        if ($footer === true):
            return $footerScripts;
        else:
            return $headerScripts;
        endif;
    }

    /**
     * @return string
     */
    public function adminHeaderScripts(): string
    {
        $headScripts = $this->getScripts();
        $styles = $this->styles;
        return view('assets.header', compact('styles', 'headScripts'))->render();
    }

    /**
     * @return string
     */
    public function headerScripts(): string
    {
        $headScripts = $this->getThemeScripts();
        $styles = $this->themeStyles;
        return view('theme.header', compact('styles', 'headScripts'))->render();
    }

    /**
     * @return string
     */
    public function adminFooterScripts(): string
    {
        $bodyScripts = $this->getScripts(true);
        return view('assets.footer', compact('bodyScripts'))->render();
    }

    /**
     * @return string
     */
    public function footerScripts(): string
    {
        $bodyScripts = $this->getThemeScripts(true);
        return view('theme.footer', compact('bodyScripts'))->render();
    }

    /**
     * @return string
     */
    public function adminSidebar(): string
    {
        $adminMenus = $this->adminMenus;
        return view('dashboard.sidebar', compact('adminMenus'))->render();
    }

    public function slugGenerator($title, $taxonomy = false, $count = 0, $new_title = '')
    {
        /*
         * Remove unicode
         */
        $slug = $this->vnToStr($title);

        if ($new_title != ''):
            $slug = $this->vnToStr($new_title);
        endif;

        if ($taxonomy === true):
            $validator = Validator::make(['slug' => $slug], [
                'slug' => 'unique:terms,slug'
            ]);
            if ($validator->fails()):
                return $this->slugGenerator($title, true, ++$count, $title . ' ' . ++$count);
            else:
                return $slug;
            endif;
        else:
            $validator = Validator::make(['slug' => $slug], [
                'slug' => 'unique:posts,post_name'
            ]);
            if ($validator->fails()):
                return $this->slugGenerator($title, false, ++$count, $title . ' ' . ++$count);
            else:
                return $slug;
            endif;
        endif;
    }

    /**
     * @param $str
     * @return string
     */
    function vnToStr($str): string
    {
        $unicode = array(
            'a' => 'á|à|ả|ã|ạ|ă|ắ|ặ|ằ|ẳ|ẵ|â|ấ|ầ|ẩ|ẫ|ậ',
            'd' => 'đ',
            'e' => 'é|è|ẻ|ẽ|ẹ|ê|ế|ề|ể|ễ|ệ',
            'i' => 'í|ì|ỉ|ĩ|ị',
            'o' => 'ó|ò|ỏ|õ|ọ|ô|ố|ồ|ổ|ỗ|ộ|ơ|ớ|ờ|ở|ỡ|ợ',
            'u' => 'ú|ù|ủ|ũ|ụ|ư|ứ|ừ|ử|ữ|ự',
            'y' => 'ý|ỳ|ỷ|ỹ|ỵ',
            'A' => 'Á|À|Ả|Ã|Ạ|Ă|Ắ|Ặ|Ằ|Ẳ|Ẵ|Â|Ấ|Ầ|Ẩ|Ẫ|Ậ',
            'D' => 'Đ',
            'E' => 'É|È|Ẻ|Ẽ|Ẹ|Ê|Ế|Ề|Ể|Ễ|Ệ',
            'I' => 'Í|Ì|Ỉ|Ĩ|Ị',
            'O' => 'Ó|Ò|Ỏ|Õ|Ọ|Ô|Ố|Ồ|Ổ|Ỗ|Ộ|Ơ|Ớ|Ờ|Ở|Ỡ|Ợ',
            'U' => 'Ú|Ù|Ủ|Ũ|Ụ|Ư|Ứ|Ừ|Ử|Ữ|Ự',
            'Y' => 'Ý|Ỳ|Ỷ|Ỹ|Ỵ',
        );
        foreach ($unicode as $nonUnicode => $uni) {
            $str = preg_replace("/($uni)/i", $nonUnicode, $str);
        }
        $str = str_replace(' ', '-', $str);
        return strtolower($str);
    }
}
