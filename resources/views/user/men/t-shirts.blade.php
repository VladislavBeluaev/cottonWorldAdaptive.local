{{--@extends('user.layouts.app_user')
@section('pageTitle', 'Мужские футболки оптом от производителя')
@section('content')
    <section class="t_shirts" role="main">
        <div class="container">
            <div class="product_article__content">
                <h1>мужские футболки</h1>
            </div>
        </div>
    </section>
@endsection--}}

@extends('user.layouts.app_user')
@section('pageTitle', 'Мужские футболки оптом от производителя')
@section('content')
    <section class="t_shirts" role="main">
        <div class="container">
            <nav class="breadcrumbs grid" role="navigation">
                <div class="breadcrumbs__content">
                    <p><a href="{{route('user.index')}}">Главная</a></p>
                    <p><span class="fas fa-angle-right"></span></p>
                    <p><a href="@routeTo("t_shirts")"></a>Мужские футболки</p>
                </div>
            </nav>
            <div class="product_article__content">
                <div class="content__header">
                    <h1>мужские футболки</h1>
                </div>
                <div class="content__cards grid">
                    <div class="cards__item">
                        <div class="cards__item-img">
                            <p><img src="{{asset('images\men\t_shirts\promo-futbolka_econom\1556530792.jpg')}}" alt="">
                            </p>
                        </div>
                        <div class="cards__item-name">
                            <p>Мужская футболка(красная)</p>
                        </div>
                        <div class="cards__item-price">
                            <p>6.50 руб. </p>
                        </div>
                        <div class="cards__item-description">
                            <div class="d-flex justify-content-start align-items-center">
                                <p><span class="fa fa-info-circle fa-lg"></span></p>
                                <p>Описание товара</p>
                            </div>
                            <div class="d-flex justify-content-start align-items-center">
                                <p><img src="{{asset('images/t_shirts_size_icon.PNG')}}" alt="t_shirts_size"></p>
                                <p>Таблица размеров</p>
                            </div>
                        </div>
                        <div class="cards__item-order">
                            <button type="button" class="btn btn-success btn-sm">Заказать</button>
                        </div>
                    </div>
                    <div class="cards__item">
                        <div class="cards__item-img">
                            <p><img src="{{asset('images\men\t_shirts\promo-futbolka_econom\1556530792.jpg')}}" alt="">
                            </p>
                        </div>
                        <div class="cards__item-name">
                            <p>Мужская футболка(красная)</p>
                        </div>
                        <div class="cards__item-price">
                            <p>6.50 руб. </p>
                        </div>
                        <div class="cards__item-description">
                            <div class="d-flex justify-content-start align-items-center">
                                <p><span class="fa fa-info-circle fa-lg"></span></p>
                                <p>Описание товара</p>
                            </div>
                            <div class="d-flex justify-content-start align-items-center">
                                <p><img src="{{asset('images/t_shirts_size_icon.PNG')}}" alt="t_shirts_size"></p>
                                <p>Таблица размеров</p>
                            </div>
                        </div>
                        <div class="cards__item-order">
                            <button type="button" class="btn btn-success btn-sm">Заказать</button>
                        </div>
                    </div>
                    <div class="cards__item">
                        <div class="cards__item-img">
                            <p><img src="{{asset('images\men\t_shirts\promo-futbolka_econom\1556530792.jpg')}}" alt="">
                            </p>
                        </div>
                        <div class="cards__item-name">
                            <p>Мужская футболка(красная)</p>
                        </div>
                        <div class="cards__item-price">
                            <p>6.50 руб. </p>
                        </div>
                        <div class="cards__item-description">
                            <div class="d-flex justify-content-start align-items-center">
                                <p><span class="fa fa-info-circle fa-lg"></span></p>
                                <p>Описание товара</p>
                            </div>
                            <div class="d-flex justify-content-start align-items-center">
                                <p><img src="{{asset('images/t_shirts_size_icon.PNG')}}" alt="t_shirts_size"></p>
                                <p>Таблица размеров</p>
                            </div>
                        </div>
                        <div class="cards__item-order">
                            <button type="button" class="btn btn-success btn-sm">Заказать</button>
                        </div>
                    </div>
                    <div class="cards__item">
                        <div class="cards__item-img">
                            <p><img src="{{asset('images\men\t_shirts\promo-futbolka_econom\1556530792.jpg')}}" alt="">
                            </p>
                        </div>
                        <div class="cards__item-name">
                            <p>Мужская футболка(красная)</p>
                        </div>
                        <div class="cards__item-price">
                            <p>6.50 руб. </p>
                        </div>
                        <div class="cards__item-description">
                            <div class="d-flex justify-content-start align-items-center">
                                <p><span class="fa fa-info-circle fa-lg"></span></p>
                                <p>Описание товара</p>
                            </div>
                            <div class="d-flex justify-content-start align-items-center">
                                <p><img src="{{asset('images/t_shirts_size_icon.PNG')}}" alt="t_shirts_size"></p>
                                <p>Таблица размеров</p>
                            </div>
                        </div>
                        <div class="cards__item-order">
                            <button type="button" class="btn btn-success btn-sm">Заказать</button>
                        </div>
                    </div>
                    <div class="cards__item">
                        <div class="cards__item-img">
                            <p><img src="{{asset('images\men\t_shirts\promo-futbolka_econom\1556530792.jpg')}}" alt="">
                            </p>
                        </div>
                        <div class="cards__item-name">
                            <p>Мужская футболка(красная)</p>
                        </div>
                        <div class="cards__item-price">
                            <p>6.50 руб. </p>
                        </div>
                        <div class="cards__item-description">
                            <div class="d-flex justify-content-start align-items-center">
                                <p><span class="fa fa-info-circle fa-lg"></span></p>
                                <p>Описание товара</p>
                            </div>
                            <div class="d-flex justify-content-start align-items-center">
                                <p><img src="{{asset('images/t_shirts_size_icon.PNG')}}" alt="t_shirts_size"></p>
                                <p>Таблица размеров</p>
                            </div>
                        </div>
                        <div class="cards__item-order">
                            <button type="button" class="btn btn-success btn-sm">Заказать</button>
                        </div>
                    </div>
                    <div class="cards__item">
                        <div class="cards__item-img">
                            <p><img src="{{asset('images\men\t_shirts\promo-futbolka_econom\1556530792.jpg')}}" alt="">
                            </p>
                        </div>
                        <div class="cards__item-name">
                            <p>Мужская футболка(красная)</p>
                        </div>
                        <div class="cards__item-price">
                            <p>6.50 руб. </p>
                        </div>
                        <div class="cards__item-description">
                            <div class="d-flex justify-content-start align-items-center">
                                <p><span class="fa fa-info-circle fa-lg"></span></p>
                                <p>Описание товара</p>
                            </div>
                            <div class="d-flex justify-content-start align-items-center">
                                <p><img src="{{asset('images/t_shirts_size_icon.PNG')}}" alt="t_shirts_size"></p>
                                <p>Таблица размеров</p>
                            </div>
                        </div>
                        <div class="cards__item-order">
                            <button type="button" class="btn btn-success btn-sm">Заказать</button>
                        </div>
                    </div>
                    <div class="cards__item">
                        <div class="cards__item-img">
                            <p><img src="{{asset('images\men\t_shirts\promo-futbolka_econom\1556530792.jpg')}}" alt="">
                            </p>
                        </div>
                        <div class="cards__item-name">
                            <p>Мужская футболка(красная)</p>
                        </div>
                        <div class="cards__item-price">
                            <p>6.50 руб. </p>
                        </div>
                        <div class="cards__item-description">
                            <div class="d-flex justify-content-between align-items-center">
                                <p><span class="fa fa-info-circle fa-lg"></span></p>
                                <p>Описание товара</p>
                            </div>
                            <div class="d-flex justify-content-between align-items-center">
                                <p><img src="{{asset('images/t_shirts_size_icon.PNG')}}" alt="t_shirts_size"></p>
                                <p>Таблица размеров</p>
                            </div>
                        </div>
                        <div class="cards__item-order">
                            <button type="button" class="btn btn-success btn-sm">Заказать</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection
