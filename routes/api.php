<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use App\Http\Resources\Product as ProductResource;
use App\Product;

use App\Http\Resources\Category as CategoryResource;
use App\Category;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Route::middleware('auth:api')->get('/user', function (Request $request) {
//     return $request->user();
// });

Route::group(['prefix' => 'products', 'middleware' => 'api'], function () {
  // List all Products
  Route::get('/', function () {
    return ProductResource::collection(Product::all());
  });

  // List Product by ID
  Route::get('/{id}', function (Request $request) {
    return new ProductResource(Product::find($request->id));
  });

  // List Product by barcode
  // Route::get('/barcode/{product:barcode}', function (Product $product, Request $request) {
  //     return new ProductResource($product);
  // });

  Route::get('/barcode/{product:barcode}', 'ProductController@show');
});

Route::group(['prefix' => 'category', 'middleware' => 'api'], function () {
  // List all Category
  Route::get('/', function () {
    return CategoryResource::collection(Category::all());
  });

  // List Category by ID
  Route::get('/{id}', function (Request $request) {
    return new CategoryResource(Category::find($request->id));
  });
});
