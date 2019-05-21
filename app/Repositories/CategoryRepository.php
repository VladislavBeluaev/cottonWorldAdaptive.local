<?php

namespace App\Repositories;

use App\Interfaces\Repository;
use Illuminate\Database\Eloquent\Model;
use App\Gender;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Schema;

class CategoryRepository implements Repository
{
    function __construct(Gender $gender,Request $request)
    {
        $this->gender = $gender;
        $this->eloquentRelation = strstr(last($request->segments()), '-')!==FALSE
            ? str_replace("-", "_", last($request->segments()))
            : last($request->segments());
    }
    public function all()
    {
        $eloquentRelation = $this->eloquentRelation;
        /*return $this->gender->getModelByUrlPrefix(getRoutePrefix())->$eloquentRelation->load('colors')->load('images');*/
        $t_shirt = $this->gender->getModelByUrlPrefix(getRoutePrefix())->$eloquentRelation
            ->load(['colors'=>function($query){
            $query->where('is_enable',1)->orderBy('id');
        }])->first();
        $images = $t_shirt->images()->orderBy('color_id')->get();
        $colors = $t_shirt->colors;
        $t_shirtArr = ['relation'=>[]];
        foreach (array_filter(Schema::getColumnListing($eloquentRelation),function($modelColumn){
            return in_array($modelColumn,['name','description','material','composition','price','density']);
        }) as $modalProperties){
            $t_shirtArr[$modalProperties] =$t_shirt->$modalProperties;
        }
        while($images->count()){
            $t_shirtArr['relation'][$colors->first()->rus_name] = $images->first()->img_src;
            $images->shift();
            $colors->shift();
        }
        return $t_shirtArr;
    }

    public function find(Model $model)
    {
        return $model;
    }

    public function update(Model $model)
    {
        // TODO: Implement update() method.
    }

    public function delete(Model $model)
    {
        // TODO: Implement delete() method.
    }
    protected $gender;
    protected $eloquentRelation;
    protected $urlPrefix;
}
