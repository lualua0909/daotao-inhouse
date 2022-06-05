<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class TermTaxonomySeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('term_taxonomy')->insert([
            'term_id' => 1,
            'taxonomy' => 'category',
            'description' => '',
            'parent' => 0,
            'count' => 0
        ]);
    }
}
