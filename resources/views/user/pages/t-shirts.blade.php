@extends('user.layouts.app_user')
@section('pageTitle',$page->getTitle())
@section('content')
    <section class="t_shirts" role="main">
        <div class="container">
            <nav class="breadcrumbs grid" role="navigation">
                <div class="breadcrumbs__content">
                    <p><a href="{{route('user.index')}}">Главная</a></p>
                    <p><span class="fas fa-angle-right"></span></p>
                    <p><a href="@routeTo("t_shirts")"></a>@genderNameShirts</p>
                </div>
            </nav>
            <div class="product_article__content">
                <div class="content__header">
                    <h1>{{$page->getMainHeader()}}</h1>
                </div>
                @include('user.layouts.modalWindows.clothes_table_size')
                @include('user.layouts.modalWindows.product_description')
                @include('user.layouts.modalWindows.order')
                @include('user.layouts.modalWindows.confirm')
                <div class="content__cards grid">
                    @foreach($t_shirt['relation'] as $color=>$img)
                    <div class="cards__item">
                        <div class="cards__item-img">
                            <p><img src="{{asset($img)}}" alt="">
                            </p>
                        </div>
                        <div class="cards__item-name grid">
                            {{--<p>@t_shirtName($t_shirt['name'],$color)</p>--}}
                            <p>{{$t_shirt['name']}}</p>
                            <p>({{$color}})</p>
                        </div>
                        <div class="cards__item-price">
                            <p>{{$t_shirt['price']}}</p>
                        </div>
                        <div class="cards__item-description">
                            <div class="d-flex justify-content-start align-items-center" data-modal-open="modal-product_description">
                                <p><span class="fa fa-info-circle fa-lg"></span></p>
                                <p>Описание товара</p>
                            </div>
                            <div class="d-flex justify-content-start align-items-center" data-modal-open="modal-clothes_size">
                                <p><img src="{{asset('images/t_shirts_size_icon.PNG')}}" alt="t_shirts_size"></p>
                                <p>Таблица размеров</p>
                            </div>
                        </div>
                        <div class="cards__item-order" data-modal-open="modal-product_order">
                            <button type="button" class="btn btn-success btn-sm">Оформить заказ</button>
                        </div>
                        <button class="d-none" data-modal-open="modal-confirm"></button>
                    </div>
                        @endforeach
                </div>
            </div>
        </div>
    </section>
@endsection
