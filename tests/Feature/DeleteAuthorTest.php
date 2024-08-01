<?php

namespace Tests\Feature;

use App\Models\Author;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class DeleteAuthorTest extends TestCase
{
    public function setUp(): void
    {
        parent::setUp();
        $this->setBaseRoute('authors');
        $this->setBaseModel('\App\Models\Author');
    }

    public function test_authenticated_user_can_delete_an_author()
    {
        $this->signIn();
        $this->destroy();
    }

    public function test_unauthenticated_user_can_delete_an_author()
    {
        $this->destroy()->assertStatus(204);
    }

}
