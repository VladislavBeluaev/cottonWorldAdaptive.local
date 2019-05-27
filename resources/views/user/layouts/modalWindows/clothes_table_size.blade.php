<div class="modal-clothes-size d-none">
<div class="clothes-size__content grid">
    <div class="content__close-window">
        <p><span class="fas fa-times-circle fa-2x"></span></p>
    </div>
    <div class="content__table">
        <table class="table table-hover">
            <tbody>
            <tr class="table__header">
                <th>Размер EU</th>
                <th>Размер RU</th>
                <th>Длина, см.</th>
                <th>Ширина, см.</th>
                <th rowspan="8"><img src="{{asset('images/men_t_shirts_size.png')}}" alt="size"></th>
            </tr>
            <tr>
                <th data-size="xs">XS</th>
                <td>44</td>
                <td>64</td>
                <td>44</td>
            </tr>
            <tr>
                <th data-size="s">S</th>
                <td>46</td>
                <td>66</td>
                <td>48</td>
            </tr>
            <tr>
                <th data-size="m">M</th>
                <td>48</td>
                <td>68</td>
                <td>51</td>
            </tr>
            <tr>
                <th data-size="l">L</th>
                <td>50</td>
                <td>70</td>
                <td>54</td>
            </tr>
            <tr>
                <th data-size="xl">XL</th>
                <td>52</td>
                <td>74</td>
                <td>56</td>
            </tr>
            <tr>
                <th data-size="2xl">XXL</th>
                <td>54</td>
                <td>76</td>
                <td>60</td>
            </tr>
            <tr>
                <th data-size="3xl">XXXL</th>
                <td>56</td>
                <td>76</td>
                <td>63</td>
            </tr>
            </tbody>
        </table>
    </div>
    <div class="content__order">
        <div class="order__confirm d-none">
            <button class="btn btn-info btn-sm" data-open-modal="modal-product_order">Перейти к оформлению заказа</button>
           {{--<div class="d-flex justify-content-start align-items-center">
               <p class="confirm__product-name">Футболка мужская(красная)</p>
               <p class="confirm__product-qty"><input type="number" placeholder="кол-во"></p>
               <p class="confirm__total-price"><span>Итого: </span><span>65,50 руб.</span></p>
           </div>
            <button type="button" class="btn btn-success btn-sm">Заказать</button>--}}
        </div>
        <div class="order__checkout">
            <button type="button" class="btn btn-info btn-sm" data-button-order="order__confirm">Выбрать размер</button>
            {{--<p class="checkout__info d-none">Для оформления заказа, выберите размер</p>--}}
        </div>

    </div>

</div>
</div>

