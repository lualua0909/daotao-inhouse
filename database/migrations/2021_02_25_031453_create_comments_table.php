<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCommentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('comments', function (Blueprint $table) {
            $table->bigIncrements('comment_ID');
            $table->bigInteger('comment_post_ID')->unsigned()->index('comment_post_ID')->default(0);
            $table->text('comment_author')->default('');
            $table->string('comment_author_email', 100)->index('comment_author_email')->default('');
            $table->string('comment_author_url', 200)->default('');
            $table->string('comment_author_IP', 100)->default('');
            $table->dateTime('comment_date')->index('comment_date')->default('0000-00-00 00:00:00');
            $table->text('comment_content')->default('');
            $table->integer('comment_karma')->default(0);
            $table->string('comment_approved', 20)->default('1');
            $table->string('comment_agent', 255)->default('');
            $table->string('comment_type', 20)->default('comment');
            $table->bigInteger('comment_parent')->unsigned()->index('comment_parent')->default(0);
            $table->bigInteger('user_id')->unsigned()->default(0);
            $table->unique(['comment_approved', 'comment_date'], 'comment_approved_date');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('comments');
    }
}
