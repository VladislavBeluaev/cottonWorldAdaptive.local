<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddColumnIsEnableToTShirtColorTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('t_shirt_color', function (Blueprint $table) {
            $table->boolean('is_enable')->after('color_id')->default(false);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('t_shirt_color', function (Blueprint $table) {
            $table->dropColumn('is_enable');
        });
    }
}
