<?php

namespace Tests\Feature;

use App\Models\Author;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class ListBookTest extends TestCase
{
    public function setUp(): void
    {
        parent::setUp();
        $this->setBaseRoute('books');
        $this->setBaseModel('\App\Models\Book');
        Author::factory(10)->create();
    }

    public function test_authenticated_user_can_list_authors()
    {
        $this->signIn();
    
        $this->list();
    }

    public function test_unauthenticated_user_cannot_list_authors()
    {
        $this->list();
    }
}
