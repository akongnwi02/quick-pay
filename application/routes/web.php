<?php
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\View;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return View::make('welcome');
});

Route::get('cats/{id}', function($id) {
    return "Cat #$id";
})->where('id', '[0-9]+');

Route::get('/bill/search', function () {
    return "Bill";
});
