<header role="banner" class="main-header">
    <nav>
        <div class="container">
            <div class="d-flex justify-content-center">
                <ul role="menubar" class="grid">
                    <li role="menuitem">
                        <a href="#">о нас</a>
                    </li>
                    <li role="menuitem">
                        <a href="#">доставка</a>
                    </li>
                    <li role="menuitem">
                        <a href="#">таблица размеров</a>
                    </li>
                    <li role="menuitem">
                        <a href="{{route('user.contacts')}}">контакты</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="banner__contacts-bar">
        <div class="container">
            <div class="contacts-bar__content grid">
                <div class="content__logo">
                    <p><a href="{{route('user.index')}}"><img src="{{asset('images/logo_etalon.PNG')}}" alt="main_logo" class="w-50"></a></p>
                </div>
                <div class="content__social grid">
                    <p><a href="#"><span class="fab fa-instagram fa-2x"></span></a></p>
                    <p><a href="#"><span class="fab fa-facebook fa-2x"></span></a></p>
                    <p><a href="#"><span class="fab fa-viber fa-2x"></span></a></p>
                    <p><a href="#"><span class="fab fa-vk fa-2x"></span></a></p>
                </div>
                <div class="content__contacts grid">
                    <p><a href="tel:+375296038038">+375(29) 6-038-038</a></p>
                    <p><span>график работы: пн-пт с 9 до 18</span></p>
                    <p><a href="mailto:uzbolka@mail.ru">uzbolka@mail.ru</a></p>
                </div>
            </div>
        </div>
    </div>
    <div class="banner__nav-bar" role="navigation">
        <div class="container p-2">
            <div class="nav-bar__content grid">
                <div class="content__item">
                    <p>
                        <a href="{{route('user.man_t_shirts')}}">
                            <img src="{{asset('images/catalog/man.jpg')}}" alt="man-cart">
                            <img src="{{asset('images/catalog/man_hover.jpg')}}" alt="man-cart" class="d-none">
                            <span>Мужские майки</span>
                        </a>
                    </p>
                </div>
                <div class="content__item">
                    <p>
                        <a href="{{route('user.woman_t_shirts')}}">
                            <img src="{{asset('images/catalog/woman.jpg')}}" alt="woman-cart">
                            <img src="{{asset('images/catalog/woman_hover.jpg')}}" alt="woman-cart" class="d-none">
                            <span>Женские майки</span>
                        </a>
                    </p>
                </div>
                <div class="content__item">
                    <p>
                        <a href="{{route('user.woman_t_shirts')}}">
                            <img src="{{asset('images/catalog/child.jpg')}}" alt="child-cart">
                            <img src="{{asset('images/catalog/child_hover.jpg')}}" alt="child-cart" class="d-none">
                            <span>Детские майки</span>
                        </a>
                    </p>
                </div>
            </div>
        </div>
    </div>
</header>