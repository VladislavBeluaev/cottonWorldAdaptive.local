<?php

namespace App\Providers;

use App\Mail\SendMail;
use App\Order;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\ServiceProvider;
use Illuminate\Contracts\Foundation\Application;

class MailServiceProvider extends ServiceProvider
{
    function __construct(Application $app)
    {
        parent::__construct($app);
    }
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
        $this->app->when(SendMail::class)
            ->needs(Model::class)
            ->give(function () {
                return $this->app->make(Order::class);
            });
    }
}
