<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddColumnRouteKeyNameToTShirts extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('t_shirts', function (Blueprint $table) {
            $table->string('routeKeyName')->after('name');
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
            $table->dropColumn('RouteKeyName');
        });
    }
}
