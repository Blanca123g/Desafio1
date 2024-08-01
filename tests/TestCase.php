<?php

namespace Tests;

use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\TestCase as BaseTestCase;
use Laravel\Passport\Passport;

abstract class TestCase extends BaseTestCase
{
    use CreatesApplication;
    use RefreshDatabase;

    protected $base_route = null;
    protected $base_model = null;

    protected function signIn($user = null)
    {
        Passport::actingAs(User::factory()->create());
        return $this;
    }

    public function setBaseRoute($route)
    {
        $this->base_route = $route;
    }

    public function setBaseModel($model)
    {
        $this->base_model = $model;
    }

    protected function create($attributes = [], $model = '', $route = '')
    {
        $this->withoutExceptionHandling();

        $route = $this->base_route ? "{$this->base_route}.store" : $route;
        $modelClass = $this->base_model ?? $model;

        $attributes = $modelClass::factory()->raw($attributes);

        if (!auth()->user()) {
            $this->expectException(\Illuminate\Auth\AuthenticationException::class);
        }

        $response = $this->postJson(route($route), $attributes)->assertSuccessful();

        $modelInstance = new $modelClass;

        $this->assertDatabaseHas($modelInstance->getTable(), \Illuminate\Support\Arr::except($attributes, ['created_at', 'updated_at']));
        return $response;
    }

    protected function update($attributes = [], $model = '', $route = '')
    {
        $this->withoutExceptionHandling();

        $route = $this->base_route ? "{$this->base_route}.update" : $route;
        $modelClass = $this->base_model ?? $model;

        $modelInstance = $modelClass::factory()->create();

        if (!auth()->user()) {
            $this->expectException(\Illuminate\Auth\AuthenticationException::class);
        }

        $response = $this->patchJson(route($route, $modelInstance->id), $attributes)->assertSuccessful();

        tap($modelInstance->fresh(), function ($modelInstance) use ($attributes) {
            collect($attributes)->each(function ($value, $key) use ($modelInstance) {
                $this->assertEquals($value, $modelInstance[$key]);
            });
        });

        return $response;
    }

    protected function destroy($model = '', $route = '')
    {
        $this->withoutExceptionHandling();


        $route = $this->base_route ? "{$this->base_route}.destroy" : $route;
        $modelClass = $this->base_model ?? $model;

        $modelInstance = $modelClass::factory()->create();

        if (!auth()->user()) {
            $this->expectException(\Illuminate\Auth\AuthenticationException::class);
        }

        $response = $this->deleteJson(route($route, $modelInstance->id))->assertStatus(200);

        $this->assertDatabaseMissing($modelInstance->getTable(), $modelInstance->toArray());

        return $response;
    }

    public function list($model = '', $route = '')
    {
        $this->withoutExceptionHandling();

        $route = $this->base_route ? "{$this->base_route}.index" : $route;
        $modelClass = $this->base_model ?? $model;
    
        $modelClass::factory()->count(5)->create();
    
        if (!auth()->user()) {
            $this->expectException(\Illuminate\Auth\AuthenticationException::class);
        }
    
        $response = $this->getJson(route($route));
    
        $response->assertStatus(200)
                 ->assertJsonCount(5, 'data');
    }


    public function show($model = '', $route = '')
    {
        $this->withoutExceptionHandling();

        $route = $this->base_route ? "{$this->base_route}.show" : $route;
        $modelClass = $this->base_model ?? $model;
    
        $registro= $modelClass::factory()->create();
    
        if (!auth()->user()) {
            $this->expectException(\Illuminate\Auth\AuthenticationException::class);
        }
    
        $response = $this->getJson(route($route, $registro->id));
    
        $response->assertStatus(200);
    }
}
