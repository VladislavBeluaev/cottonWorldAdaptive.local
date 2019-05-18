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
          <div id="contacts__map">

          </div>
        </div>
    </section>
@endsection
