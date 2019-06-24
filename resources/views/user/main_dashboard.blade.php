@extends('user.layouts.app_user')
@section('pageTitle', 'Футболки оптом от производителя')
@section('content')
    <section class="main_page" role="main">
        <div class="container">
            <div class="main_page__banner">
                <p><a href="{{route('user.man_t_shirts')}}"><img src="{{asset('images/banner.PNG')}}" alt="main_banner"></a>
                </p>
            </div>
            <div class="main_page__slider">
                <h2>Выбор покупателей</h2>
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
        </div>
    </section>
@endsection
