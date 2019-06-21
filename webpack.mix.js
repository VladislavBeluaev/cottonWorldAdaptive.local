let mix = require('laravel-mix');

/*
 |--------------------------------------------------------------------------
 | Mix Asset Management
 |--------------------------------------------------------------------------
 |
 | Mix provides a clean, fluent API for defining some Webpack build steps
 | for your Laravel application. By default, we are compiling the Sass
 | file for the application as well as bundling up all the JS files.
 |
 */

mix.less('resources/assets/less/_app.less', 'public/css/user/app.css').
less('resources/assets/less/_header.less','public/css/user/header.css').
    less('node_modules/slick-carousel/slick/slick.less', 'public/css/slick/slick.css').
    less('node_modules/slick-carousel/slick/slick-theme.less', 'public/css/slick/slick-theme.css').
    less('resources/assets/less/_slick-markdown.less', 'public/css/slick/slick-markdown.css').
js('resources/assets/js/app.js','public/js/user/app_user.js').
js('node_modules/slick-carousel/slick/slick.js','public/js/slick/slick.js')
    .browserSync('cottonworldadaptive.local:90');


/*mix.less('resources/assets/less/_app.less', 'public/css/user/app.css').
js('resources/assets/js/app.js','public/js/user/app_user.js').browserSync('cottonworldadaptive.local');*/



