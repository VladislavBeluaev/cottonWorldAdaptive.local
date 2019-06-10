<?php

namespace App\Http\Controllers\Ajax;

use App\Mail\OrderEmail;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;
use Mockery\Exception;

class AjaxController extends Controller
{
    function __construct(Request $request,Model $model){
        $this->request = $request;
        $this->model = $model;
    }
    function createOrder(){
        $orderData = json_decode($this->request->getContent(), true);
        //dd($this->model->insert($orderData));
        $result = $this->model->insert($orderData);
        //$result = false;
        if($result){
            $lastInsertId = DB::getPdo()->lastInsertId();
            //dd(env('MAIL_ADMIN'));
            Mail::to(env('MAIL_ADMIN'))->send(new OrderEmail($this->model->findOrFail($lastInsertId)));
            echo $result;
            die();
        }
        throw new Exception("Errors occurred during the order registration. Contact your administrator");
    }
    protected $request;
    protected $model;
}
