<?php

namespace Database\Factories;

use Carbon\Carbon;
use Faker\Factory as FakerFactory;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Author>
 */
class AuthorFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $fecha= new Carbon();
        $faker = FakerFactory::create('es_ES');

        return [
            'name'=>$faker->name(),
            'birthdate'=>$faker->date(),
            'nationality'=>$faker->country,
            'created_at'=>$fecha->today(),
            'updated_at'=>$fecha->today(),
        ];
    }
}
