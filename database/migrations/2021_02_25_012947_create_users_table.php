<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->bigIncrements('ID');
            $table->string('user_login', 60)->index('user_login_key')->default('');
            $table->string('user_pass', 255)->default('');
            $table->string('user_nicename', 50)->index('user_nicename')->default('');
            $table->string('user_email', 100)->index('user_email')->default('');
            $table->string('user_url', 100)->default('');
            $table->dateTime('user_registered')->default('0000-00-00 00:00:00');
            $table->string('user_activation_key', 255)->default('');
            $table->string('display_name', 250)->default('');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('users');
    }
}
