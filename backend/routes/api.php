<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;


$group=[
    'middleware'    => 'api',
    'namespace'     => 'App\Http\Controllers'
];


Route::group(
    $group,
    function($router){
        $order="OrderController";
        Route::resource('/order',$order);
    }
);