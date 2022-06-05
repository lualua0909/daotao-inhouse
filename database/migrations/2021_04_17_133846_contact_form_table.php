<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class ContactFormTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('contact_form', function (Blueprint $table) {
            $table->bigIncrements('ID');
            $table->string('company', 255)->default('');
            $table->string('email', 100)->default('');
            $table->string('full_name', 255)->default('');
            $table->string('phone', 20)->default('');
            $table->longText('note')->default('');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('contact_form');
    }
}
