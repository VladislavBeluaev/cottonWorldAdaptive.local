<?php

namespace App\Providers;

use Illuminate\Support\Facades\Blade;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        Blade::directive('productLink', function ($expression) {
            list($routeName, $routeParam) = explode(',', $expression);
            return "<?php echo sprintf('%s/%s',$routeName,$routeParam);?>";
        });
        Blade::directive('headerImg', function ($expression) {
            //dd($expression);
            list($collectionImages, $attrType) = explode(',', $expression);
            $modelProperty = str_replace('"', '', sprintf("img_%s", $attrType));
            $callString = "($collectionImages)->first()->$modelProperty";
            //dd(asset(($collectionImages)->last()->$modelProperty));
            if ($attrType == '"src"') $callString = "asset(($collectionImages)->first()->$modelProperty)";
            return "<?php echo $callString ?>";
        });
        Blade::directive('genderNameShirts', function () {
            $breadcrumbLink = '';
            switch (getRoutePrefix()) {
                case "men":
                    $breadcrumbLink = "'Мужские майки'";
                    break;
                case "women":
                    $breadcrumbLink = "'Женские майки'";
                    break;
                case "children":
                    $breadcrumbLink = "'Детские майки'";
                    break;
            }
            return "<?php echo $breadcrumbLink ?>";
        });
    }

    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {

    }
}
