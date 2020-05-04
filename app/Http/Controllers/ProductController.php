<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Str;

use App\Http\Resources\Product as ProductResource;
use App\Product;

class ProductController extends Controller
{
  public function show(Request $request)
  {
    $barcode = $request->segment(4);
    $model = new Product;
    $product = $model->where('barcode', '=', $barcode)->first();

    if ($product) {
      $response = new ProductResource($product);
    } else {
      /**
       * Request data from https://api.cosmos.bluesoft.com.br/
       */
      $cosmosRequest = Http::withHeaders([
        'X-Cosmos-Token' => env('API_COSMOS_TOKEN'),
      ])->get('https://api.cosmos.bluesoft.com.br/gtins/' . $barcode);

      // Decode data received
      $cosmosJson = json_decode($cosmosRequest, true);

      // Format json to same format internal requests
      $formatJson = json_encode([
        'id'            => 0,
        'category_id'   => 0,
        'barcode'       => $cosmosJson['gtin'],
        'title'         => $cosmosJson['description'],
        'body'          => $cosmosJson['ncm']['full_description'],
        'price'         => number_format($cosmosJson['avg_price'], 2, ',', '.'),
        'image'         => $cosmosJson['thumbnail'],
        'slug'          => Str::slug($cosmosJson['description'], '-'),
        'created_at'    => $cosmosJson['created_at'],
        'updated_at'    => $cosmosJson['updated_at']
      ]);

      // setup response
      $response = $formatJson;
    }

    return $response;
  }
}
