<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Color extends Model
{
    public function image()
    {
        return $this->hasOne(Image::class);
    }

    public function getRusNameAttribute($value)
    {
        return str_replace(["ый","ий"],["ая","яя"],$value);
    }
}
