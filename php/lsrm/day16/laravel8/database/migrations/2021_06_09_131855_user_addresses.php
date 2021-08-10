<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class UserAddresses extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('user_addresses',function (Blueprint $table){
           $table->bigIncrements('id');#主键以及int类型设置 名称为id
           $table->unsignedSmallInteger('user_id');#关联字段设置 user_id
            //设置地址表的user_id与用户表的id关联关系
           $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
           //省份
           $table->string('province');
           //市区
            $table->string('city');
            //地区
            $table->string('district');
            //邮编
            $table->unsignedInteger('zip');
            $table->string('contact_name');//收货人名称
            $table->string('contact_phone');//收货人手机号码
            $table->dateTime('last_used_at')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        //
    }
}
