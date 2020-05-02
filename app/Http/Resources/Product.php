<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class Product extends JsonResource
{
  /**
   * Transform the resource into an array.
   *
   * @param  \Illuminate\Http\Request  $request
   * @return array
   */
  public function toArray($request)
  {
    return [
      'id'            => $this->id,
      'category_id'   => $this->category_id,
      'barcode'       => $this->barcode,
      'title'         => $this->title,
      'body'          => $this->body,
      'price'         => number_format($this->price, 2, ',', '.'),
      'image'         => $this->image,
      'slug'          => $this->slug,
      'created_at'    => $this->created_at,
      'updated_at'    => $this->created_at
    ];
  }
}
