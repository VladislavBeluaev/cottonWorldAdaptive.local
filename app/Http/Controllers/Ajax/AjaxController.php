<?php

namespace App\Http\Controllers\Ajax;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Mail\Mailable;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\DB;
use Mockery\Exception;

class AjaxController extends Controller
{
    function __construct(Request $request,Model $model,Mailable $mailDelivery){
        $this->request = $request;
        $this->model = $model;
        $this->mailDelivery = $mailDelivery;
    }
    function createOrder(){
        $orderData = json_decode($this->request->getContent(), true);
        //dd($this->model->insert($orderData));
        $result = $this->model->insert($orderData);
        //$result = false;
        if($result){
            $lastInsertId = DB::getPdo()->lastInsertId();
            echo $result;
            die();
        }
        throw new Exception("Errors occurred during the order registration. Contact your administrator");
    }
    protected $request;
    protected $model;
    protected $mailDelivery;
}
