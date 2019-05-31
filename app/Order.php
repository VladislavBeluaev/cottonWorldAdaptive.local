<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
   protected $fillable = ['t_shirt_name','t_shirt_color','t_shirt_size','t_shirt_qty','t_shirt_price','customer_name',
       'customer_phone','customer_email'];
}
