<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Gender extends Model
{
    function t_shirts(){
        return $this->hasMany(T_shirt::class);
    }
    function getModelByUrlPrefix($urlPrefix){
        return $this->where('url_prefix',$urlPrefix)->firstOrFail();
    }
    protected $table = 'gender';
}
