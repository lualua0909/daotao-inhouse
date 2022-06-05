<?php

namespace Database\Seeders;

use Illuminate\Config\Repository;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class OptionSeeder extends Seeder
{
    /**
     * @var Repository
     */
    protected $config;

    /**
     * @var array
     */
    protected $roles = [];

    public function __construct(Repository $config)
    {
        $this->config = $config->get('core');

        $this->roles = $this->config['roles'];
    }

    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('options')->insert([
            'option_name' => 'user_roles',
            'option_value' => serialize($this->roles)
        ]);

        DB::table('options')->insert([
            'option_name' => 'site_name',
            'option_value' => 'IFA'
        ]);

        DB::table('options')->insert([
            'option_name' => 'site_description',
            'option_value' => 'Developed by StartPress Solutions'
        ]);

        DB::table('options')->insert([
            'option_name' => 'site_url',
            'option_value' => 'http://localhost/ifa-landing-page'
        ]);

        DB::table('options')->insert([
            'option_name' => 'posts_per_page',
            'option_value' => 10
        ]);
    }
}
