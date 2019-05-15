@extends('user.layouts.app_user')
@section('pageTitle', $t_shirt->name)
@section('content')
    <section class="product_article">
        <div class="container">
            <div class="breadcrumbWrapper">
                <nav class="breadcrumbs">
                    <p><a href="{{route('user.index')}}">Главная</a></p>
                    <p><span class="fas fa-angle-right"></span></p>
                    <p><a href="{{route('user.woman_t_shirts')}}">@genderNameShirts</a></p>
                    <p><span class="fas fa-angle-right"></span></p>
                    <p><a href="@routeTo("t_shirts")"></a>{{$t_shirt->name}}</p>
                </nav>
            </div>
            <div class="product_article__container">
                <div class="article__container__image">
                    <div class="gallery-image-full_size">
                        <p><img src="@headerImg($t_shirt->images(),"src")" alt="@headerImg($t_shirt->images(),"alt")"></p>
                    </div>
                    <div class="gallery-image-wrapper">
                        @foreach($t_shirt->images->shuffle() as $image)
                        <p class="gallery-image"><img src="{{asset($image->img_src)}}" alt="{{$image->img_alt}}"></p>
                            @endforeach
                    </div>
                </div>
                <div class="article__container__text-content">
                    <div class="article__container__description">
                        <h1>{{$t_shirt->name}}</h1>
                        <div class="article-description">
                            <p><span>Описание товара:</span>{{$t_shirt->description}}</p>
                            <p><span>Материал:</span>{{$t_shirt->material}}</p>
                            <p><span>Состав:</span>{{$t_shirt->composition}}</p>
                        </div>
                    </div>
                    <div class="article__container__price">
                        <p><span>Цена:</span>{{$t_shirt->price}}</p>
                        <p>(Цена действительна при заказе от 50 единиц.)</p>
                    </div>
                    <div class="article__container__size-box">
                        <h3>Доступные размеры:</h3>
                        <div class="container__size-wrapper">
                            <div class="article__container__size"><p>XS(38-40)</p></div>
                            <div class="article__container__size"><p>S(40-42)</p></div>
                            <div class="article__container__size"><p>M(42-44)</p></div>
                            <div class="article__container__size"><p>L(44-46)</p></div>
                            <div class="article__container__size"><p>XL(46-48)</p></div>
                            <div class="article__container__size"><p>XXL(48-50)</p></div>
                        </div>
                    </div>
                    <div class="article__container__color-box">
                        <h3>Доступные цвета:</h3>
                        <div class="container__color-wrapper">
                            @foreach($t_shirt->colors as $color)
                                @if($color->en_name=='white')
                                    <div class="article__container__color" data-color="{{$color->rus_name}}">
                                        <p class="border-white-color color-{{$color->en_name}}">
                                            <span></span>
                                        </p></div>
                                @else
                                    <div class="article__container__color" data-color="{{$color->rus_name}}"><p class="color-{{$color->en_name}}"></p>
                                    </div>
                                @endif
                            @endforeach
                        </div>
                        <p>(цвета по пантону TPX; возможно изготовление промо футболок в цветах по индивидуальным
                            заказам)</p>
                    </div>
                    <div class="article__container__qty-box">
                        <h3>Количество:</h3>
                        <div class="container__qty-box-wrapper">
                            <div class="article__container__qty-minus"><p>-</p></div>
                            <div class="article__container__qty"><input type="number" placeholder="0"></div>
                            <div class="article__container__qty-plus"><p>+</p></div>
                        </div>
                        <p>(Обратите внимание, что для заказов принимается количество товаров кратное пяти.</p>
                    </div>
                    <div class="article__container__order">
                        <h3>Заказ:</h3>
                        <table class="table table-bordered table-striped table-hover">
                            <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Размер</th>
                                <th scope="col">Количество</th>
                                <th scope="col">Цвет</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <th scope="row">1</th>
                                <td>XS(38-40)</td>
                                <td>10 штук</td>
                                <td>Красный</td>
                            </tr>
                            <tr>
                                <th scope="row">2</th>
                                <td>XS(38-40)</td>
                                <td>10 штук</td>
                                <td>Красный</td>
                            </tr>
                            <tr>
                                <th scope="row">2</th>
                                <td>Jacob</td>
                                <td>Thornton</td>
                                <td>@fat</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="article__container__cart-box">
                        <button type="button" class="btn btn-secondary disabled">Заказать</button>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection