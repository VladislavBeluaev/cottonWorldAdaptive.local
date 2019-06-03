<?php

namespace App\Http\Controllers\User;

use App\Interfaces\Repository;
use App\Http\Controllers\Controller;
use App\T_shirt;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

class DashboardController extends Controller
{
    function __construct(Repository $repository)
    {
        $this->repository = $repository;
        $this->bladePathDir = sprintf("user.%s", getRoutePrefix());
    }

    function index()
    {
        $arr = [
            "t_shirt" => [
        "name" => "Футболка мужская",
    "color" => "красный",
    "size" => "s",
    "qty" => 2,
    "totalPrice" => 13,
  ],
  "customer" => [
        "name" => "sdsdsd",
    "phone" => "+375333333333",
    "email" => "a@a.ccom"
  ]
];

        /*$arr = [
          [1,2,8,12,13,14,15],
            [1,2,5,7,8,12,13,15],
            [1,15],
            [1,2,7,8,13,15],
        ];
        foreach ($arr as $key=>$value){
            foreach ($value as $v){
                $k = $key+6;
                file_put_contents('D:\temp\OSPanel\domains\cottonWorld.local\database\scripts\new_install\insert\fill_T_shirts_color.sql',"INSERT INTO t_shirt_color(`t_shirt_id`,`color_id`,`created_at`,`updated_at`)
values($k,$v,now(),now());\r\n",FILE_APPEND);
            }
        }*/
        $callProcedureStr = sprintf("call %s", Config::get('constants.options.procedures.cardSlider'));
        return view('user.main_dashboard', ['t_shirts' => DB::select($callProcedureStr)]);
    }

    function contacts()
    {
        return view('user.contacts_dashboard');
    }

    function allTShirts()
    {
        //dd($this->repository->all());
        return view($this->bladePathDir . ".t-shirts", ["t_shirt" => $this->repository->all()]);
    }

    function getTShirt(Model $model)
    {
        dd($this->repository->find($model));
        return view($this->bladePathDir . ".product_article", ["t_shirt" => $this->repository->find($model)]);
    }

    function setOrder(Request $request)
    {
        //echo "GOOD";
        dd(array_flatten(json_decode($request->getContent(), true)));
       /* $ajaxData = json_decode($request->getContent(), true);
        echo array_flatten($ajaxData[4]);*/
        //echo $request->post();/*dd();*/
    }

    protected $repository;
    protected $bladePathDir;
}
