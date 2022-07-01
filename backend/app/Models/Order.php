<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
     protected $table = 'master_order';

    protected $fillable = [
        'code',
        'customer_address_id',
        'total',
    ];

    
}