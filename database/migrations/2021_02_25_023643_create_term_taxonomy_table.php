<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTermTaxonomyTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('term_taxonomy', function (Blueprint $table) {
            $table->bigIncrements('term_taxonomy_id');
            $table->bigInteger('term_id')->unsigned()->default(0);
            $table->string('taxonomy', 32)->default('');
            $table->longText('description')->default('');
            $table->bigInteger('parent')->unsigned()->default(0);
            $table->bigInteger('count')->default(0);
            $table->unique(['term_id', 'taxonomy'], 'term_id_taxonomy');
            $table->index('taxonomy', 'taxonomy');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('term_taxonomy');
    }
}
