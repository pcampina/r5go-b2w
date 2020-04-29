<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Facades\Voyager;
use TCG\Voyager\Traits\Translatable;

class Category extends Model
{
    use Translatable;

    protected $translatable = ['slug', 'name'];

    protected $table = 'categories';

    protected $fillable = ['slug', 'name'];

    public function products()
    {
        return $this->hasMany('App\Product')
            ->orderBy('created_at', 'DESC');
    }

    public function parentId()
    {
        return $this->belongsTo(self::class);
    }
}
