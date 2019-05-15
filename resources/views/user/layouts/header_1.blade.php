<header>
    <nav class="menubar">
        <div class="menubar-background"></div>
        <div class="height-lock"></div>
        <div class="container">
            <div class="menubar-wrapper">
                <ul class="menubar__items">
                    <li class="menubar__item">
                        <a href="{{route('user.index')}}"><img src="{{asset('images/logo.png')}}" alt=""></a>
                    </li>
                    <li class="menubar__item">
                        <a href="#">О нас</a>
                    </li>
                    <li class="menubar__item">
                        <a href="#">Доставка</a>
                    </li>
                    <li class="menubar__item">
                        <a href="#">Контакты</a>
                    </li>
                </ul>
                {{--<form action="#" method="POST">
                    <label>
                        <input type="text" name="search_site" placeholder="Поиск по сайту">
                        <span class="fas fa-search"></span>
                    </label>
                </form>--}}
                <div class="main_logo__contacts">
                    <div class="main_logo__contacts-wrapper">
                        <div><a href="tel:+375(29)6-038-038">+375(29)6-038-038</a></div>
                        <div><a href="mailto:Uzbolka@mail.ru">Uzbolka@mail.ru</a></div>
                    </div>
                    <div class="main_logo__social-wrapper">
                        <div><a href="#"><span class="fab fa-instagram"></span></a></div>
                        <div><a href="#"><span class="fab fa-vk"></span></a></div>
                        <div><a href="#"><span class="fab fa-facebook"></span></a></div>
                        <div><a href="#"><span class="fab fa-youtube"></span></a></div>
                        <div><a href="#"><span class="fab fa-viber"></span></a></div>
                        <div><a href="#"><span class="fab fa-telegram"></span></a></div>
                    </div>
                </div>
            </div>
            <div class="menubar-catalog">
                <div class="menubar-catalog_item">
                    <p>
                        <a href="{{route('user.woman_t_shirts')}}">
                            <img src="{{asset('images/catalog/woman-t_shirt.jpg')}}" alt="woman-cart">
                            <span>Женские майки</span>
                        </a>
                    </p>
                </div>
                <div class="menubar-catalog_item">
                    <p>
                        <a href="{{route('user.man_t_shirts')}}">
                            <img src="{{asset('images/catalog/man-t_shirt.jpg')}}" alt="man-cart">
                            <span>Мужские майки</span>
                        </a>
                    </p>
                </div>
                <div class="menubar-catalog_item">
                    <p>
                        <a href="{{route('user.woman_t_shirts')}}">
                            <img src="{{asset('images/catalog/child-t_shirt.jpg')}}" alt="child-cart">
                            <span>Детские майки</span>
                        </a>
                    </p>
                </div>
            </div>
        </div>
    </nav>
</header>