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
                <div class="cardsSlider">
                    <div class="cardsSlider__content d-flex">
                        @foreach($t_shirts as $t_shirt)
                            <div class="card w-25 d-inline-block text-center">
                                @if($t_shirt->url_prefix==='men')
                                    <a href="@productLink(route('user.man_t_shirts'),$t_shirt->routeKeyName)"
                                       class="toProductCart">
                                        @else
                                            <a href="@productLink(route('user.woman_t_shirts'),$t_shirt->routeKeyName)"
                                               class="toProductCart">
                                                @endif
                                                <img class="card-img-top"
                                                     src="{{asset($t_shirt->img_src)}}"
                                                     alt="{{$t_shirt->img_alt}}">
                                            </a>
                                            <div class="card-body">
                                                <div class="customerChoice__productDescription mt-1 text-center">
                                                    @if($t_shirt->url_prefix==='men')
                                                        <a href="@productLink(route('user.man_t_shirts'),$t_shirt->routeKeyName)"
                                                           class="toProductCart">
                                                            @else
                                                                <a href="@productLink(route('user.woman_t_shirts'),$t_shirt->routeKeyName)"
                                                                   class="toProductCart">
                                                                    @endif
                                                                    <span>{{$t_shirt->name}}</span>
                                                                </a>
                                                </div>
                                                <div class="productOfDay__currentPrice d-flex align-items-center justify-content-between">
                                                    <div><span>{{$t_shirt->price}} руб.</span></div>
                                                    {{--<div><span class="fas fa-cart-plus fa-lg"></span></div>--}}
                                                </div>
                                            </div>
                            </div>
                        @endforeach
                    </div>
                    <div class="next_btn active">
                        <span class="fas fa-angle-right fa-2x "></span>
                    </div>
                    <div class="prev_btn nonActive">
                        <span class="fas fa-angle-left fa-2x"></span>
                    </div>
                </div>
            </div>
            </div>
        </div>
    </section>
@endsection
