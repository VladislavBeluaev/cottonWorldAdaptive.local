<div class="modal-product_order d-none">
    <div class="product_order__content grid">
        <div class="content__close-window">
            <p><span class="fas fa-times-circle fa-2x"></span></p>
        </div>
        <div class="content__description">
            <h2>Оформление заказа</h2>
            <ul>
                <li class="grid"><span>Название</span><span>{{$t_shirt['name']}}</span></li>
                <li class="grid"><span>Цвет</span><span>красный</span></li>
                <li class="description__order-size"><span> Выберите размер</span>
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
                <li class="description__order-qty"><span>Укажите количество</span>
                    <ul>
                        <li><input type="number" placeholder="1"></li>
                    </ul>
                </li>
            </ul>
            <button type="button" class="btn btn-success btn-sm">Заказать</button>
        </div>
    </div>
</div>