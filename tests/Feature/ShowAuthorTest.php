<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class ShowAuthorTest extends TestCase
{
    public function setUp(): void
    {
        parent::setUp();
        $this->setBaseRoute('authors');
        $this->setBaseModel('\App\Models\Author');
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
