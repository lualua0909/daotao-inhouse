<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        $this->call(UserSeeder::class);
        $this->call(UserMetaSeeder::class);
        $this->call(OptionSeeder::class);
        $this->call(TermSeeder::class);
        $this->call(TermTaxonomySeeder::class);
    }
}