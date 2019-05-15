<?php

namespace App\Providers;

use App\Gender;
use App\Interfaces\Repository;
use App\Repositories\{CategoryRepository};
use Illuminate\Http\Request;
use Illuminate\Support\ServiceProvider;
use Mockery\Exception;
use Illuminate\Contracts\Foundation\Application;

class RepositoryServiceProvider extends ServiceProvider
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
        $this->app->bind(Repository::class,function(){
            $gender = $this->app->make(Gender::class);
            $requestInstance = $this->app[Request::class];
            return new CategoryRepository($gender,$requestInstance);
            /*$routePrefix = substr($requestInstance->route()->getPrefix(),1);
            switch ($routePrefix){
                case "men":
                    return new ManRepository($gender,$requestInstance);
                    break;
                case "women":
                    return new WomanRepository($gender);
                    break;
                case "children":
                    return new CategoryRepository($gender);
                    break;
                default:
                    throw new Exception(sprintf("%sRepository does not exists.",ucfirst($routePrefix)));
            }*/
        });
    }

}
