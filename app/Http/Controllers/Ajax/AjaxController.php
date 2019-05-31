<?php

namespace App\Http\Controllers\Ajax;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class AjaxController extends Controller
{
    function __construct(Request $request,Model $model){
        $this->request = $request;
        $this->model = $model;
    }
    function createOrder(){
        dd(array_flatten(json_decode($this->request->getContent(), true)));
    }
    protected $request;
    protected $model;
}
