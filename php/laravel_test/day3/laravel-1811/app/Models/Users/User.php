<?php

namespace App\Models\Users;

use Illuminate\Database\Eloquent\Model;

class User extends Model
{
    /**
     * The primary key for the model.
     *
     * @var string
     */
    protected $primaryKey = 'uid';
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'user';
}
