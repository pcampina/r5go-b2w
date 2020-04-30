<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Facades\Storage;

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
          'image'         => config('app.url').Storage::url($this->image),
          'slug'          => $this->slug,
          'created_at'    => $this->created_at,
          'updated_at'    => $this->created_at
        ];
    }
}
