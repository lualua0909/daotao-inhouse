<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTermmetaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('termmeta', function (Blueprint $table) {
            $table->bigIncrements('meta_id');
            $table->bigInteger('term_id')->unsigned()->default(0)->index('term_id');
            $table->string('meta_key', 255)->nullable()->index('meta_key');
            $table->longText('meta_value')->nullable()->default('');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('termmeta');
    }
}
