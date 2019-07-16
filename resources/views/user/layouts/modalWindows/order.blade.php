<div class="modal-product_order d-none">
    <div class="product_order__content grid">
        <div class="content__close-window">
            <p><span class="fas fa-times-circle fa-2x"></span></p>
        </div>
        <div class="content__description">
            <h2>Оформление заказа</h2>
            <ul class="order-ajax-send">
                <li class="grid"><span>Название</span><span>{{$t_shirt['name']}}</span></li>
                <li class="grid"><span>Цвет</span><span>красный</span></li>
                <li class="description__order-size valid-hint"><span> Выберите размер</span>
                    <ul class="grid">
                        <li>xs</li>
                        <li>s</li>
                        <li>m</li>
                        <li>l</li>
                        <li>xl</li>
                        <li>2xl</li>
                        <li>3xl</li>
                        <li>4xl</li>
                        <li>5xl</li>
                        <li>6xl</li>
                    </ul>
                </li>
                <li class="description__order-qty valid-hint"><span>Укажите количество</span>
                    <ul>
                        <li><input type="number" name="t_shirt_qty" placeholder="1"></li>
                        <li id="scroll-down-hint"><img src="{{asset('images/scroll-down.png')}}" alt="scroll-down"></li>
                    </ul>
                </li>
                <li class="description__order-price"><span>Итоговая цена</span>
                    <ul>
                        <li data-start-price="{{$t_shirt['price']}}">0 руб.</li>
                    </ul>
                </li>
                <li class="valid-hint"><span>Введите ваше имя</span>
                    <ul>
                        <li><input type="text" name="customer_name" placeholder="имя" required></li>
                    </ul>
                </li>
                <li class="valid-hint"><span>Введите ваш контактный телефон</span>
                    <ul>
                        <li>
                            <input type="tel" name="customer_phone" placeholder="телефон" value="+375" required>
                        </li>
                    </ul>
                </li>
                <li class="valid-hint"><span>Введите ваш email</span>
                    <ul>
                        <li><input type="email" name="customer_email" placeholder="email" required></li>
                    </ul>
                </li>
            </ul>
            <button type="button" class="btn btn-success btn-sm disable send-request">Заказать</button>
        </div>
    </div>
</div>