<?php

namespace Tests\Feature;

use App\Models\Author;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class ShowBookTest extends TestCase
{
    public function setUp(): void
    {
        parent::setUp();
        $this->setBaseRoute('books');
        $this->setBaseModel('\App\Models\Book');
        Author::factory(5)->create();
    }

    public function test_authenticated_user_can_show_author()
    {
        $this->signIn();
    
        $this->show();
    }

    public function test_unauthenticated_user_cannot_show_author()
    {
        $this->show();
    }
}
