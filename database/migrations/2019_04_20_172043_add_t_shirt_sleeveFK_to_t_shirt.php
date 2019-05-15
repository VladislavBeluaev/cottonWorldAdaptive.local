<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddTShirtSleeveFKToTShirt extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('t_shirts', function (Blueprint $table) {
            $table->integer('t_shirt_sleeve_id')->nullable()->unsigned()->after('material_quality_id');
            $table->foreign('t_shirt_sleeve_id')->references('id')->on('t_shirt_sleeve')->onDelete('cascade');

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('t_shirts', function (Blueprint $table) {
            $table->dropColumn('t_shirt_sleeve_id');
        });
    }
}
