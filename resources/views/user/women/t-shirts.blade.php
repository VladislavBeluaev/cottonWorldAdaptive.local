@extends('user.layouts.app_user')
@section('pageTitle', 'Женские футболки оптом от производителя')
@section('content')
    <section class="t_shirts">
        <div class="container">
            <div class="breadcrumbWrapper">
                <nav class="breadcrumbs">
                    <p><a href="{{route('user.index')}}">Главная</a></p>
                    <p><span class="fas fa-angle-right"></span></p>
                    <p><a href=""></a>Женские футболки</p>
                </nav>
            </div>
            <div class="collection-container d-flex justify-content-between align-items-start">
                <div class="aside-container">
                    <div class="filter-group">
                        <h4>Вид</h4>
                        <label class="checkbox-button">
                            <input type="checkbox" class="checkbox-button__input" name="promo-tShirts">
                            <span class="checkbox-button__control"></span>
                            <span class="checkbox-button__label">Промо футболки</span>
                        </label>
                        <label class="checkbox-button">
                            <input type="checkbox" class="checkbox-button__input" name="polo-tShirts">
                            <span class="checkbox-button__control"></span>
                            <span class="checkbox-button__label">Футболки поло</span>
                        </label>
                    </div>
                    <div class="filter-group">
                        <h4>Длина рукава</h4>
                        <label class="checkbox-button">
                            <input type="checkbox" class="checkbox-button__input" name="tShirts-longSleeve">
                            <span class="checkbox-button__control"></span>
                            <span class="checkbox-button__label">Футболки с длинным рукавом</span>
                        </label>
                        <label class="checkbox-button">
                            <input type="checkbox" class="checkbox-button__input" name="tShirts-shortSleeve">
                            <span class="checkbox-button__control"></span>
                            <span class="checkbox-button__label">Футболки с коротким рукавом</span>
                        </label>
                    </div>
                    <div class="filter-group">
                        <h4>Качество материала</h4>
                        <label class="checkbox-button sale-material">
                            <input type="checkbox" class="checkbox-button__input" name="tShirts-shortSleeve">
                            <span class="checkbox-button__control"></span>
                            <span class="checkbox-button__label">Акционные</span>
                            <span><img src="{{asset('images/sales.png')}}" alt="sale"></span>
                        </label>
                        <label class="checkbox-button">
                            <input type="checkbox" class="checkbox-button__input" name="tShirts-longSleeve">
                            <span class="checkbox-button__control"></span>
                            <span class="checkbox-button__label">Эконом</span>
                        </label>
                        <label class="checkbox-button">
                            <input type="checkbox" class="checkbox-button__input" name="tShirts-shortSleeve">
                            <span class="checkbox-button__control"></span>
                            <span class="checkbox-button__label">Стандарт</span>
                        </label>
                        <label class="checkbox-button">
                            <input type="checkbox" class="checkbox-button__input" name="tShirts-shortSleeve">
                            <span class="checkbox-button__control"></span>
                            <span class="checkbox-button__label">Премиум</span>
                        </label>
                    </div>
                    <div class="filter-group">
                        <h4>Цена</h4>
                        <div class="input-group input-group-sm">
                            <input type="number" name="min-price" class="form-control" placeholder="от">
                            <input type="number" name="max-price" class="form-control" placeholder="до">
                            <input type="hidden" name="inputPrice" title="result">
                        </div>
                    </div>
                </div>
                <div class="products-container">
                    <div class="products-container__header">
                        <h1>Футболки для женщин от производителя</h1>
                        <div class="sort-by">
                            <div><span>Сортировать по:</span></div>
                            <div class="dropdown_menu">
                                <div><a href="#">Названию</a></div>
                                <div><span class="fas fa-caret-down"></span></div>
                                <div class="dropdown_menu-items d-none">
                                    <div class="dropdown_menu-item"><a href="#">Цене</a></div>
                                    <div class="dropdown_menu-item"><a href="#">Названию</a></div>
                                    <div class="dropdown_menu-item"><a href="#">Плотности</a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="mobile-aside-container">
                        <div class="mobile-aside-container__wrapper">
                            <div><a href="#">Фильтр товаров</a></div>
                            <div><span class="fas fa-caret-down"></span></div>
                        </div>
                        <div class="filter-group__mobileWrapper">
                            <div class="filter-group">
                                <h4>Вид</h4>
                                <label class="checkbox-button">
                                    <input type="checkbox" class="checkbox-button__input" name="promo-tShirts">
                                    <span class="checkbox-button__control"></span>
                                    <span class="checkbox-button__label">Промо футболки</span>
                                </label>
                                <label class="checkbox-button">
                                    <input type="checkbox" class="checkbox-button__input" name="polo-tShirts">
                                    <span class="checkbox-button__control"></span>
                                    <span class="checkbox-button__label">Футболки поло</span>
                                </label>
                            </div>
                            <div class="filter-group">
                                <h4>Длина рукава</h4>
                                <label class="checkbox-button">
                                    <input type="checkbox" class="checkbox-button__input" name="tShirts-longSleeve">
                                    <span class="checkbox-button__control"></span>
                                    <span class="checkbox-button__label">Футболки с длинным рукавом</span>
                                </label>
                                <label class="checkbox-button">
                                    <input type="checkbox" class="checkbox-button__input" name="tShirts-shortSleeve">
                                    <span class="checkbox-button__control"></span>
                                    <span class="checkbox-button__label">Футболки с коротким рукавом</span>
                                </label>
                            </div>
                            <div class="filter-group">
                                <h4>Качество материала</h4>
                                <label class="checkbox-button sale-material">
                                    <input type="checkbox" class="checkbox-button__input" name="tShirts-shortSleeve">
                                    <span class="checkbox-button__control"></span>
                                    <span class="checkbox-button__label">Акционные</span>
                                    <span><img src="{{asset('images/sales.png')}}" alt="sale"></span>
                                </label>
                                <label class="checkbox-button">
                                    <input type="checkbox" class="checkbox-button__input" name="tShirts-longSleeve">
                                    <span class="checkbox-button__control"></span>
                                    <span class="checkbox-button__label">Эконом</span>
                                </label>
                                <label class="checkbox-button">
                                    <input type="checkbox" class="checkbox-button__input" name="tShirts-shortSleeve">
                                    <span class="checkbox-button__control"></span>
                                    <span class="checkbox-button__label">Стандарт</span>
                                </label>
                                <label class="checkbox-button">
                                    <input type="checkbox" class="checkbox-button__input" name="tShirts-shortSleeve">
                                    <span class="checkbox-button__control"></span>
                                    <span class="checkbox-button__label">Премиум</span>
                                </label>
                            </div>
                            <div class="filter-group">
                                <h4>Цена</h4>
                                <div class="input-group input-group-sm">
                                    <input type="number" name="min-price" class="form-control" placeholder="от">
                                    <input type="number" name="max-price" class="form-control" placeholder="до">
                                    <input type="hidden" name="inputPrice" title="result">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="products-container__cards">
                        <div class="row no-margins">
                            @foreach($t_shirts as $t_shirt)
                                <div class="products_card col-4">
                                    <div class="product_name">
                                        <p>
                                            <a href="@productLink(route('user.woman_t_shirts'),$t_shirt->routeKeyName)">{{$t_shirt->name}}</a>
                                        </p>
                                    </div>
                                    <div class="product_density">
                                        <p>{{$t_shirt->density}}</p>
                                    </div>
                                    <div class="product_img">
                                        @if(count($t_shirt->images)===0)
                                            <p><a href="@productLink(route('user.woman_t_shirts'),$t_shirt->routeKeyName)">
                                                    <img src="{{asset('images/image_not_found.PNG')}}"
                                                         alt="image_not_found">
                                                </a></p>
                                       @else
                                        <p><a href="@productLink(route('user.woman_t_shirts'),$t_shirt->routeKeyName)">
                                                <img src="@headerImg($t_shirt->images,"src")"
                                                     alt="@headerImg($t_shirt->images,"alt")">
                                            </a></p>
                                        @endif
                                        <div class="product_price">
                                            <span class="product_price__text">{{$t_shirt->price}}</span>
                                        </div>
                                    </div>
                                    <div class="product_available-colors">
                                        <div class="colors-box">
                                            @foreach($t_shirt->colors as $color)
                                                <div class="color color-{{$color->en_name}}"></div>
                                            @endforeach
                                        </div>
                                    </div>
                                </div>
                            @endforeach
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
    </section>
@endsection
