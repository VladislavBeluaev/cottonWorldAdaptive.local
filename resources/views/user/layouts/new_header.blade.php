<header role="banner">
    <nav>
        <div class="adaptive_menu-bg grid">
            <div class="container">
                <div class="ws-menu">
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
            <div class="container-fluid">
                <div class="mobile-menu">
                    <p class="mobile-menu__toggle">
                        <i class="fa fa-bars fa-2x" aria-hidden="true"></i>
                    </p>
                    <ul role="menubar">
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
        </div>
        <div class="banner__contacts-bg">
            <div class="container">
                <div class="contacts-wrapper grid">
                    <div class="contacts__logo">
                        <p><a href="{{route('user.index')}}"><img src="{{asset('images/logo_etalon.PNG')}}"
                                                                  alt="main_logo"></a>
                    </div>
                    <div class="contacts__social grid">
                        <p><a href="https://www.instagram.com/frankprint/"><span class="fab fa-instagram fa-2x"></span></a></p>
                        <p><a href="https://www.facebook.com/frankprintby/"><span class="fab fa-facebook fa-2x"></span></a></p>
                        <p><a href="https://www.youtube.com/channel/UCcK4oMIcUjByx_YWi0cAhqA"><span class="fab fa-youtube fa-2x"></span></a></p>
                        <p><a href="https://vk.com/frankprint"><span class="fab fa-vk fa-2x"></span></a></p>
                    </div>
                    <div class="contacts__contact-wrapper grid">
                        <div class="contacts__contact grid">
                            <p><a href="tel:+375296038038">+375(29) 6-038-038</a></p>
                            <p><span id="test">график работы: пн-пт с 9 до 18</span></p>
                            <p><a href="mailto:uzbolka@mail.ru">uzbolka@mail.ru</a></p>
                        </div>
                    </div>
                </div>
                <div class="nav-bar grid" role="navigation">
                    <div class="nav-bar__item">
                        <p>
                            <a href="{{route('user.man_t_shirts')}}">
                                <img src="{{asset('images/catalog/man.jpg')}}" alt="man-cart">
                                <img src="{{asset('images/catalog/man_hover.jpg')}}" alt="man-cart" class="d-none">
                                <span>Мужские</span>
                                <span>майки</span>
                            </a>
                        </p>
                    </div>
                    <div class="nav-bar__item">
                        <p>
                            <a href="{{route('user.woman_t_shirts')}}">
                                <img src="{{asset('images/catalog/woman.jpg')}}" alt="woman-cart">
                                <img src="{{asset('images/catalog/woman_hover.jpg')}}" alt="woman-cart" class="d-none">
                                <span>Женские</span>
                                <span>майки</span>
                            </a>
                        </p>
                    </div>
                    <div class="nav-bar__item">
                        <p>
                            <a href="{{route('user.children_t_shirts')}}">
                                <img src="{{asset('images/catalog/child.jpg')}}" alt="child-cart">
                                <img src="{{asset('images/catalog/child_hover.jpg')}}" alt="child-cart" class="d-none">
                                <span>Детские</span>
                                <span>майки</span>
                            </a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </nav>
</header>