<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUsermetaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('usermeta', function (Blueprint $table) {
            $table->bigIncrements('umeta_id');
            $table->bigInteger('user_id')->unsigned()->index('user_id')->default(0);
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
        Schema::dropIfExists('usermeta');
    }
}
