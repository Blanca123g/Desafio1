<?php

namespace Tests\Feature;

use App\Models\Author;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class UpdateAuthorTest extends TestCase
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

    public function test_authenticated_user_can_update_an_author()
    {
        $this->signIn();

        $author = Author::factory()->create();
        
        $this->update($this->attributes, Author::class, 'authors/'.$author->id);
    }

    public function test_unautenticated_user_cannot_update_author(){
        $this->update($this->attributes);
    }
}
