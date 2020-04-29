<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

use App\Http\Resources\Product as ProductResource;
use App\Product;

class Category extends JsonResource
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
          'parent_id'     => $this->parent_id,
          'order'         => $this->order,
          'name'          => $this->name,
          'slug'          => $this->slug,
          'created_at'    => $this->created_at,
          'updated_at'    => $this->created_at,
          'products'      => ProductResource::collection($this->products)
        ];
    }
}
