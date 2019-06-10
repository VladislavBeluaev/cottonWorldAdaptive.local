<?php

namespace App\Providers;

use App\Http\Controllers\Ajax\AjaxController;
use App\Mail\SendMail;
use App\Order;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use Illuminate\Mail\Mailable;
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
                return $this->giveImplementation(Order::class, "Unknown address sending ajax request");
            });
        /*$this->app->when(AjaxController::class)
            ->needs(Mailable::class)
            ->give(function () {
                $this->giveImplementation(SendMail::class, "Unknown address sending ajax request",Order::class);
            });*/
    }

    protected function giveImplementation(string $implementation, string $errMsg, $implData = null)
    {
        switch (substr(app()->make(Request::class)->getPathInfo(), 1)) {
            case "order":
                if($implData === null){
                    return $this->app->make($implementation);
                }
                else{
                    return new $implementation($this->app->make($implData));
                }
                break;
            default:
                Throw new Exception($errMsg);
        }
    }

    protected $request;
}
