<?php

namespace Tests\Feature;

use App\Models\Author;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class StoreBookTest extends TestCase
{
    public function setUp(): void
    {
        parent::setUp();
        $this->setBaseRoute('books');
        $this->setBaseModel('\App\Models\Book');
    }

    /**
     * Funcion para crear recurso utilizando un usuario registrado
     *
     * @return void
     */
    public function test_authenticated_user_can_create_a_book()
    {
        $this->signIn();

        $author = Author::factory()->create();

        // $attributes = [
        //     'title'=>fake()->text(30),
        //     'isbn'=>fake()->isbn13(),
        //     'published_date'=>fake()->date(),
        //     'author_id'=>Author::all()->random()->id,
        // ];
        
        $this->create();
    }
}
