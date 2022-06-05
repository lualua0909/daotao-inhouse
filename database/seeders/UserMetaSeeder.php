<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class UserMetaSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('usermeta')->insert([
            'user_id' => '1',
            'meta_key' => 'capabilities',
            'meta_value' => serialize(array('administrator' => true)),
        ]);
    }
}
