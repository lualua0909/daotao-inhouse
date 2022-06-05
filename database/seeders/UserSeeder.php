<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('users')->insert([
            'user_login' => 'admin',
            'user_pass' => bcrypt('123456789'),
            'user_nicename' => 'admin',
            'user_email' => 'admin@startpress.net',
            'user_url' => 'https://startpress.net',
            'user_registered' => '',
            'user_activation_key' => '',
            'display_name' => 'Admin',
        ]);
    }
}
