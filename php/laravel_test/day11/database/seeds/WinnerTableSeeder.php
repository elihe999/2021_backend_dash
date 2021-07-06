<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
class WinnerTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        DB::table('winner')->insert([
            'name' => str_random(10),
            'email' => str_random(10).'@win.com',
        ]);
    }
}
