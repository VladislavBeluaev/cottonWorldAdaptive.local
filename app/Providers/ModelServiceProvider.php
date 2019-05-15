<?php

namespace App\Providers;

use App\{T_shirt,Gender};
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\ServiceProvider;

class ModelServiceProvider extends ServiceProvider
{
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
        $this->app->bind(Model::class,function(){
            $urlPrefixes = $this->app->make(Gender::class)->pluck('url_prefix')->toArray();
            if(in_array(getRoutePrefix(),$urlPrefixes)){
                $model = getModelByUrl();
                return new $model();
            }
            return true;
        });
    }
}
