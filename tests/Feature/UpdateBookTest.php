<?php

namespace Tests\Feature;

use App\Models\Author;
use App\Models\Book;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class UpdateBookTest extends TestCase
{
    use WithFaker;

    private $attributes= [];

    public function setUp(): void
    {
        parent::setUp();
        $this->setBaseRoute('books');
        $this->setBaseModel('\App\Models\Book');
        Author::factory(5)->create();
        $this->attributes = [
            'title'=>fake()->text(30),
            'isbn'=>fake()->isbn13(),
            'published_date'=>fake()->date(),
            'author_id'=>Author::all()->random()->id,
        ];
    }

    public function test_authenticated_user_can_update_a_book()
    {
        $this->signIn();
        
        $this->update($this->attributes);
    }

    public function test_unautenticated_user_cannot_update_book (){
        $this->update($this->attributes);
    }
}
