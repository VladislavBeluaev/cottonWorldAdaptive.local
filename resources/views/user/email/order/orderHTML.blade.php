@component('mail::panel')
    <h1>Заказ №{{$order->id}}</h1>
    @endcomponent
@component('mail::table')
    | Наименование                | Цвет                   | Размер                 | Количество             | Цена                               | Фио заказчика           | Телефон заказчика        | Почта заказчика              |
    |:---------------------------:|:------------------    :|:----------------------:|:----------------------:|:----------------------------------:|:-----------------------:|:------------------------:|:----------------------------:|
    |{{$order->t_shirt_name}}     |{{$order->t_shirt_color}}|{{$order->t_shirt_size}}|{{$order->t_shirt_qty}}|{{$order->t_shirt_totalPrice}} руб. |{{$order->customer_name}}|{{$order->customer_phone}}|{{$order->customer_email}}    |
@endcomponent
