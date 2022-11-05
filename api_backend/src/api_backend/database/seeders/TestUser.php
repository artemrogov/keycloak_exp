<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\User as user;


class TestUser extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {

        $emailTest = 'test01@mail.com';

        if (user::where('email',$emailTest)->exists()) {
            return;
        }

        user::create([
           'email'=>'test01@mail.com',
           'name'=>'test01',
           'password'=>bcrypt('test123')
        ]);
    }
}
