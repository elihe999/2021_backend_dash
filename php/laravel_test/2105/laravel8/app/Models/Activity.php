<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Activity extends Model
{
    use HasFactory;

    public $table = "activites";

    public function hasVenue()
    {
        return $this->belongsToMany(Venue::class,'activity_venue_relation','activity_id','venue_id');
    }
}
