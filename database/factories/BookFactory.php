<?php

namespace Database\Factories;

use App\Models\Author;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Book>
 */
class BookFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $fecha= new Carbon();
        return [
            'title'=>fake()->text(30),
            'isbn'=>fake()->isbn13(),
            'published_date'=>fake()->date(),
            'author_id'=>Author::all()->random()->id,
            'created_at'=>$fecha->today(),
            'updated_at'=>$fecha->today(),
        ];
    }
}
