<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateFutbolkiTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('futbolki', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name');
            $table->string('density');
            $table->string('price');
            $table->integer('gender_id')->unsigned();
            $table->foreign('gender_id')->references('id')->on('gender')->onDelete('cascade');
            $table->integer('t_shirts_types_id')->unsigned();
            $table->foreign('t_shirts_types_id')->references('id')->on('t_shirts_types')->onDelete('cascade');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('futbolki');
    }
}
