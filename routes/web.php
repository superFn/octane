<?php

use Illuminate\Support\Facades\Route;
use Laravel\Octane\Facades\Octane;

Route::get('/', function () {
    return view('welcome');
});

Route::get('/octane', static function () {
    $START = microtime(true);
    [$users, $servers] = Octane::concurrently([
        fn () => sleep(6),
        fn () => sleep(5),
    ], 3000000);

    return microtime(true)-$START;

});
