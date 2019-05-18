<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::group(['namespace'=>'User',],function(){
    Route::group(['prefix'=>'men'],function (){
        Route::get('t-shirts','DashboardController@allTShirts')->name('user.man_t_shirts');
        Route::get('t-shirts/{model}','DashboardController@getTShirt')->name('user.man_getTShirt');
    });
    Route::group(['prefix'=>'women'],function (){
        Route::get('t-shirts','DashboardController@allTShirts')->name('user.woman_t_shirts');
        Route::get('t-shirts/{model}','DashboardController@getTShirt')->name('user.woman_getTShirt');
    });
    Route::get('/','DashboardController@index')->name('user.index');
    Route::get('/contacts','DashboardController@contacts')->name('user.contacts');
});
