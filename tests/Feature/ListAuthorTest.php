<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class ListAuthorTest extends TestCase
{
    public function setUp(): void
    {
        parent::setUp();
        $this->setBaseRoute('authors');
        $this->setBaseModel('\App\Models\Author');

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
