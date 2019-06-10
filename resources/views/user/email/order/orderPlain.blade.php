Заказ № {{$order->id}}

Наименование: {{$order->t_shirt_name}}
Цвет: {{$order->t_shirt_color}}
Размер: {{$order->t_shirt_size}}
Количество: {{$order->t_shirt_qty}}
Цена: {{$order->t_shirt_totalPrice}}
Фио заказчика: {{$order->customer_name}}
Телефон заказчика: {{$order->customer_phone}}
Почта заказчика: {{$order->customer_email}}

С уважением, {{env('APP_NAME')}}