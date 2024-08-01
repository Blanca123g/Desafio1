<?php

namespace Tests\Feature;

use App\Models\Author;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;
use Faker\Factory as FakerFactory;
use Illuminate\Foundation\Testing\WithFaker;

class StoreAuthorTest extends TestCase
{
    use WithFaker;

    private $attributes= [];

    public function setUp(): void
    {
        parent::setUp();
        $this->setBaseRoute('authors');
        $this->setBaseModel('\App\Models\Author');
        $this->attributes= [
            'name'=>$this->faker->name(),
            'birthdate'=>$this->faker->date(),
            'nationality'=>'Paraguaya',
        ];
    }

    public function test_authenticated_user_can_create_an_author()
    {
        $this->signIn();
    
        $this->create($this->attributes);
    }

    public function test_unauthenticated_user_cannot_create_an_author()
    {
        $this->create($this->attributes);
    }
}
