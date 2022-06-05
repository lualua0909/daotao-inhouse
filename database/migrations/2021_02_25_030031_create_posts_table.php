<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePostsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('posts', function (Blueprint $table) {
            $table->bigIncrements('ID');
            $table->bigInteger('post_author')->unsigned()->index('post_author')->default(0);
            $table->dateTime('post_date')->default('0000-00-00 00:00:00');
            $table->longText('post_content')->default('');
            $table->text('post_title')->default('');
            $table->text('post_excerpt')->default('');
            $table->string('post_status', 20)->default('publish');
            $table->string('comment_status', 20)->default('open');
            $table->string('ping_status', 20)->default('open');
            $table->string('post_name', 200)->default('')->index('post_name');
            $table->dateTime('post_modified')->default('0000-00-00 00:00:00');
            $table->string('post_type', 20)->default('post');
            $table->string('post_mime_type', 100)->default('');
            $table->bigInteger('comment_count')->default(0);
            $table->index(['post_type', 'post_status', 'post_date', 'ID'], 'type_status_date');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('posts');
    }
}
