<?php

namespace App\Providers;

use App\Http\Controllers\Ajax\AjaxController;
use App\Order;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use Illuminate\Support\ServiceProvider;
use Illuminate\Contracts\Foundation\Application;
use Mockery\Exception;

class AjaxServiceProvider extends ServiceProvider
{
    function __construct(Application $app)
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
                switch (substr(app()->make(Request::class)->getPathInfo(),1)){
                    case "order":
                        return $this->app->make(Order::class);
                        break;
                    default:
                        Throw new Exception("Unknown address sending ajax request");
                }
                /*return Storage::disk('local');*/
            });
    }
    protected $request;
}
