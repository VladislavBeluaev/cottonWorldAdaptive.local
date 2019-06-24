<!doctype html>
<html lang="{{ app()->getLocale() }}">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1 maximum-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>@yield('pageTitle')</title>
    <link rel="stylesheet" href="{{asset('css/bootstrap.min.css')}}">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
          integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
    <link rel="stylesheet" href="{{asset('css/user/app.css')}}">
    <link rel="stylesheet" href="{{asset('css/slick/slick.css')}}">
    <link rel="stylesheet" href="{{asset('css/slick/slick-theme.css')}}">
    <link rel="stylesheet" href="{{asset('css/slick/slick-markdown.css')}}">
    <script src="{{asset('js/jquery-3.4.0.min.js')}}"></script>
    <script src="http://api-maps.yandex.ru/2.1/?lang=ru_RU"></script>
    <script src="{{asset('js/slick/slick.min.js')}}"></script>
    <script src="{{asset('js/user/app_user.js')}}" type="module"></script>
</head>
<body>
@include('user.layouts.new_header')
<div class="container">
    <div class="main_slider">
        @foreach($t_shirts as $t_shirt)
            <div class="main_slider__card">
                <div class="card__body">
                    <div class="card__body-img">
                        @switch($t_shirt->url_prefix)
                        @case('men')
                        <a href="@productLink(route('user.man_t_shirts'),$t_shirt->routeKeyName)"
                           class="toProductCart">
                            @break
                            @case('women')
                            <a href="@productLink(route('user.woman_t_shirts'),$t_shirt->routeKeyName)"
                               class="toProductCart">
                                @break
                                @case('children')
                                <a href="@productLink(route('user.children_t_shirts'),$t_shirt->routeKeyName)"
                                   class="toProductCart">
                                    @break
                                    @endswitch
                                    <img
                                         src="{{asset($t_shirt->img_src)}}"
                                         alt="{{$t_shirt->img_alt}}">
                                </a>
                            </a>
                        </a>
                    </div>

                    <div class="card__body-name">
                        @switch($t_shirt->url_prefix)
                        @case('men')
                        <a href="@productLink(route('user.man_t_shirts'),$t_shirt->routeKeyName)"
                           class="toProductCart">
                            @break
                            @case('women')
                            <a href="@productLink(route('user.woman_t_shirts'),$t_shirt->routeKeyName)"
                               class="toProductCart">
                                @break
                                @case('children')
                                <a href="@productLink(route('user.children_t_shirts'),$t_shirt->routeKeyName)"
                                   class="toProductCart">
                                    @break
                                    @endswitch
                                    <span>{{$t_shirt->name}}</span>
                                </a>
                            </a>
                        </a>
                    </div>
                    <div class="card__body-price">
                        <p><span>@price($t_shirt)</span></p>
                    </div>
                </div>
            </div>
        @endforeach
    </div>

</div>
@include('user.layouts.mobile_footer')
</body>
</html>