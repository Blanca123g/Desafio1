<?php

namespace Tests\Feature;

use App\Models\Author;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class DeleteBookTest extends TestCase
{
    public function setUp(): void
    {
        parent::setUp();
        $this->setBaseRoute('books');
        $this->setBaseModel('\App\Models\Book');
    }

    public function test_authenticated_user_can_delete_an_author()
    {
        $this->signIn();
        Author::factory(5)->create();

        $this->destroy();
    }

    public function test_unauthenticated_user_can_delete_an_author()
    {
        Author::factory(5)->create();
        $this->destroy()->assertStatus(204);
    }
}
