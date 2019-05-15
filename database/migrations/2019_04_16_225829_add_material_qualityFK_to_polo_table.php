<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddMaterialQualityFKToPoloTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('polo', function (Blueprint $table) {
            $table->integer('material_quality_id')->unsigned();
            $table->foreign('material_quality_id')->references('id')->on('material_quality')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('polo', function (Blueprint $table) {
            $table->dropColumn('material_quality_id');
        });
    }
}
