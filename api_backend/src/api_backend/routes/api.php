<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;


Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});


Route::middleware('auth:api')->get('/test-auth',function(Request $requestAuth){
   return response()->json([
              'data'=>[
                    'id'=>$requestAuth->user()->id,
                   'email'=>$requestAuth->user()->email,
                   'name'=>$requestAuth->user()->name  
              ],
       ],200);
});

Route::middleware('api')->get('/test-ok',function(Request $requestTest){

   return "test-ok";
});
