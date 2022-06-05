<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCommentmetaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('commentmeta', function (Blueprint $table) {
            $table->bigIncrements('meta_id');
            $table->bigInteger('comment_id')->unsigned()->index('comment_id')->default(0);
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
        Schema::dropIfExists('commentmeta');
    }
}
