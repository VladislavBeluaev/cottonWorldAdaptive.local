<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateOrdersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('orders', function (Blueprint $table) {
            $table->increments('id');
            $table->string('t_shirt_name');
            $table->string('t_shirt_color');
            $table->string('t_shirt_size');
            $table->string('t_shirt_qty');
            $table->string('t_shirt_price');
            $table->string('customer_name');
            $table->string('customer_phone');
            $table->string('customer_email');
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
        Schema::table('orders', function (Blueprint $table) {
            $table->dropColumn('t_shirt_name');
            $table->dropColumn('t_shirt_color');
            $table->dropColumn('t_shirt_size');
            $table->dropColumn('t_shirt_qty');
            $table->dropColumn('t_shirt_price');
            $table->dropColumn('customer_name');
            $table->dropColumn('customer_phone');
            $table->dropColumn('customer_email');
        });

    }
}
