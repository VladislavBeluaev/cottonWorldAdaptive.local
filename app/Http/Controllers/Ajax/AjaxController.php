<?php

namespace App\Http\Controllers\Ajax;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Arr;

class AjaxController extends Controller
{
    function __construct(Request $request,Model $model){
        $this->request = $request;
        $this->model = $model;
    }
    function createOrder(){
        $orderData = json_decode($this->request->getContent(), true);
        //dd($this->model->insert($orderData));
        echo $this->model->insert($orderData);
    }
    protected $request;
    protected $model;
}
