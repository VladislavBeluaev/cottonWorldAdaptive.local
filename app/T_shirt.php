<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class T_shirt extends Model
{
    public function gender(){
        return $this->belongsTo(Gender::class);
    }
    public function colors(){
        return $this->belongsToMany(Color::class,'t_shirt_color','t_shirt_id','color_id');
    }
    public function images(){
        return $this->belongsToMany(Image::class,'t_shirt_image');
    }
    public function getRouteKeyName()
    {
       return "routeKeyName";
    }

    public function getPriceAttribute()
    {
        return "6.50 руб.";
        //return sprintf('%s руб.',$value);
    }
    public function getDensityAttribute()
    {
        return "160 г/м2";
        //return sprintf('%s руб.',$value);
    }
}
