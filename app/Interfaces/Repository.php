<?php
/**
 * Created by PhpStorm.
 * User: isida
 * Date: 22.04.2019
 * Time: 12:36
 */

namespace App\Interfaces;


use Illuminate\Database\Eloquent\Model;

interface Repository
{
    public function all();
    public function find(Model $model);
    public function update(Model $model);
    public function delete(Model $model);
}