<?php
/**
 * Created by PhpStorm.
 * User: isida
 * Date: 11.06.2019
 * Time: 16:03
 */

namespace App;


class Page
{
    public function __construct(PageBuilder $builder)
    {
        $this->builder = $builder;
        $this->title = $builder->title;
        $this->mainHeader = $builder->mainHeader;
        $this->breadCrumb = $builder->breadCrumb;
    }

    public function getTitle()
    {
        return $this->title;
    }

    public function getMainHeader()
    {
        return $this->mainHeader;
    }

    public function getBreadCrumb()
    {
        return $this->breadCrumb;
    }

    protected $title;
    protected $mainHeader;
    protected $breadCrumb;
    protected $builder;
}