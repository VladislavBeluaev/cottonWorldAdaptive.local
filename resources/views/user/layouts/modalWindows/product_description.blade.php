<div class="modal-product_description d-none">
    <div class="product_description__content grid">
        <div class="content__close-window">
            <p><span class="fas fa-times-circle fa-2x"></span></p>
        </div>
        <div class="content__description">
            <h2>Описание</h2>
            <ul>
                <li class="grid"><span>Состав ткани</span><span>{{$t_shirt['composition']}}</span></li>
                <li class="grid"><span>Ткань</span><span>{{$t_shirt['material']}}</span></li>
                <li class="grid"><span>Плотность ткани</span><span>{{$t_shirt['density']}}</span></li>
                <li class="grid"><span>Цена</span><span>{{$t_shirt['price']}}</span></li>
            </ul>
            <div>
                <p>{{$t_shirt['description']}}</p>
            </div>
            <button class="btn btn-info btn-sm" data-open-modal="modal-product_order-withoutSetSize">Перейти к оформлению заказа</button>
        </div>
    </div>
</div>