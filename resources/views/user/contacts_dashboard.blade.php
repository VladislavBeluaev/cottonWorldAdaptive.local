@extends('user.layouts.app_user')
@section('pageTitle', 'Контакты')
@section('content')
    <section class="contacts" role="main">
        <div class="container">
            <nav class="breadcrumbs grid" role="navigation">
                <div class="breadcrumbs__content">
                    <p><a href="{{route('user.index')}}">Главная</a></p>
                    <p><span class="fas fa-angle-right"></span></p>
                    <p><a href="@routeTo("t_shirts")"></a>Контакты</p>
                </div>
            </nav>
            <div class="contacts__information">
                <h2>Менеджеры по работе с клиентами:</h2>
                <div class="information__content">
                    <div class="information__phone grid">
                        <p>Телефон:</p>
                        <p><a href="tel:+375296038038">+375(29) 6-038-038</a></p>
                    </div>
                    <div class="information__email grid">
                        <p>E-mail:</p>
                        <p><a href="mailto:uzbolka@mail.ru">uzbolka@mail.ru</a></p>
                    </div>

                    <div class="information__map">
                        <p>Карта проезда до офиса в Минске:</p>
                        <p>г. Минск, ул.Машиностроителей 29А, 2 подьезд, офис.25</p>
                    </div>
                </div>

            </div>
            <div id="contacts__map"></div>
        </div>
    </section>
@endsection
