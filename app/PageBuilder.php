<?php
/**
 * Created by PhpStorm.
 * User: isida
 * Date: 11.06.2019
 * Time: 16:04
 */

namespace App;


class PageBuilder
{
    public function setTitle()
    {
        $this->title = ucfirst(config("constants.options.page_titles.".getRoutePrefix()));
        return $this;
    }

    public function setMainHeader()
    {
        $this->mainHeader = ucfirst(config("constants.options.header.".getRoutePrefix()));
        return $this;
    }

    public function setBreadCrumb()
    {
        $this->breadCrumb = $this->setMainHeader();
        return $this;
    }
    public function make(){
        return new Page($this);
    }

    public $title;
    public $mainHeader;
    public $breadCrumb;
}