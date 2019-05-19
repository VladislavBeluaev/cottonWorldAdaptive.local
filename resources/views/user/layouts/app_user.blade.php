<!doctype html>
<html lang="{{ app()->getLocale() }}">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1 maximum-scale=1">
    <title>@yield('pageTitle')</title>
    <link rel="stylesheet" href="{{asset('css/bootstrap.min.css')}}">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css"
          integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
    <link rel="stylesheet" href="{{asset('css/user/app.css')}}">
    <script src="{{asset('js/jquery-3.4.0.min.js')}}"></script>
    <script src="http://api-maps.yandex.ru/2.1/?lang=ru_RU"></script>
    <script src="{{asset('js/user/app_user.js')}}" type="module"></script>
</head>
<body>
@include('user.layouts.new_header')
@yield('content')
@include('user.layouts.new_footer')
</body>
</html>