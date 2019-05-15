<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddMaterialQualityFKToFutbolkiTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('futbolki', function (Blueprint $table) {
            $table->integer('material_quality_id')->unsigned()->after('t_shirts_types_id');
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
        Schema::table('futbolki', function (Blueprint $table) {
            $table->dropColumn('material_quality_id');
        });
    }
}
