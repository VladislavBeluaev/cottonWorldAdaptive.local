<?php

namespace App\Providers;

use App\Http\Controllers\Ajax\AjaxController;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use Illuminate\Support\ServiceProvider;
use Illuminate\Contracts\Foundation\Application;

class AjaxServiceProvider extends ServiceProvider
{
    function __construct(Application $app,Request $request)
    {
        parent::__construct($app);
    }
    /**
     * Bootstrap the application services.
     *
     * @return void
     */
    public function boot()
    {
        //
    }

    /**
     * Register the application services.
     *
     * @return void
     */
    public function register()
    {
        $this->app->when(AjaxController::class)
            ->needs(Model::class)
            ->give(function () {
                /*return Storage::disk('local');*/
            });
    }
    protected $request;
}
