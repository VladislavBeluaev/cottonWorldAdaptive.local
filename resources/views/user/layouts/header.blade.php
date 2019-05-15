<header>
    <div class="menubar-fixed">
        <div class="container">
            <div class="menubar-fixed__content">
                <ul>
                    <li>
                        <a href="{{route('user.index')}}"><img src="{{asset('images/logo.png')}}" alt="main_logo"></a>
                    </li>
                    <li><a href="">О НАС</a></li>
                    <li><a href="">ДОСТАВКА</a></li>
                    <li><a href="">КОНТАКТЫ</a></li>
                </ul>
            </div>
        </div>
    </div>
    {{-- <div class="menubar-fixed__lock-height"></div>--}}
    <div class="menubar-contacts">
        <div class="container">
            <div class="menubar-contacts__wrapper">
                <div class="menubar-contacts__container">
                    <div><img src="{{asset('images/favicon.png')}}" alt="favicon"></div>
                    <div class="d-flex align-items-start justify-content-around">
                        <p><a href="#"><span class="fab fa-instagram fa-2x"></span></a></p>
                        <p><a href="#"><span class="fab fa-vk fa-2x"></span></a></p>
                    </div>
                    <div class="d-flex align-items-start justify-content-around">
                        <p><a href="#"><span class="fab fa-facebook fa-2x"></span></a></p>
                        <p><a href="#"><span class="fab fa-viber fa-2x"></span></a></p>
                    </div>
                    <div>
                        <p><a href="tel:+375296038038">+375(29) 6-038-038</a></p>
                        <p><span>график работы: пн-пт с 9 до 18</span></p>
                        <p><a href="mailto:uzbolka@mail.ru">uzbolka@mail.ru</a></p>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <div class="menubar-catalog">
        <div class="container">
            <div class="menubar-catalog__wrapper">
                <div class="menubar-catalog_item">
                    <p>
                        <a href="{{route('user.man_t_shirts')}}">
                            <img src="{{asset('images/catalog/man.jpg')}}" alt="man-cart">
                            <img src="{{asset('images/catalog/man_hover.jpg')}}" alt="man-cart" class="d-none">
                            <span>Мужские майки</span>
                        </a>
                    </p>
                </div>
                <div class="menubar-catalog_item">
                    <p>
                        <a href="{{route('user.woman_t_shirts')}}">
                            <img src="{{asset('images/catalog/woman.jpg')}}" alt="woman-cart">
                            <img src="{{asset('images/catalog/woman_hover.jpg')}}" alt="woman-cart" class="d-none">
                            <span>Женские майки</span>
                        </a>
                    </p>
                </div>
                <div class="menubar-catalog_item">
                    <p>
                        <a href="{{route('user.children_t_shirts')}}">
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