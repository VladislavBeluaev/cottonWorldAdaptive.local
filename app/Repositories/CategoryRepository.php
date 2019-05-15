<?php

namespace App\Repositories;

use App\Interfaces\Repository;
use Illuminate\Database\Eloquent\Model;
use App\Gender;
use Illuminate\Http\Request;

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
        return $this->gender->getModelByUrlPrefix(getRoutePrefix())->$eloquentRelation->load('colors')->load('images');
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
