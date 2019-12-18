<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Comment extends Model {
    // Tabla que modifica el modelo
    protected $table = 'comments';

    // Relacion Many To One
    public function user() {
        return $this->belongsTo('App\User', 'user_id');
    }
    // Relacion Many To One
    public function image() {
        return $this->belongsTo('App\Image', 'image_id');
    }

}
