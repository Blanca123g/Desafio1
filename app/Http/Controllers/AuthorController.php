<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreAuthorRequest;
use App\Http\Requests\UpdateAuthorRequest;
use App\Models\Author;
use App\Models\Book;
use Carbon\Carbon;
use Illuminate\Http\Request;

class AuthorController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        //la pagina si o si debe ser en ingles
        $buscar = $request->input('search', false);

        $author = new Author();
        $authors = $author->getPaginateOrSearch($buscar);

        return $authors;
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreAuthorRequest $request)
    {
        try {
            $author= new Author();
            $data = request(['name', 'birthdate', 'nationality']);

            $author->insertar($data);

            return response()->json([
                'mensaje' => 'Autor registrado',
                'success' => true
            ], 201);

        } catch (\Throwable $th) {
            return response()->json([
                'mensaje' => 'Ocurrio un error al registrar el autor',
                'success' => false
            ], 500);
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(int $id)
    {
        try {
            $author = new Author();
            $infoAuthor = $author->getById($id);

            if (is_null($infoAuthor)) {
                return response()->json([
                    'mensaje' => 'Recurso no encontrado',
                    'success' => false
                ], 404);
            }

            return response()->json([
                'data' => $infoAuthor,
                'success' => true
            ], 200);
        } catch (\Throwable $th) {
            return response()->json([
                'mensaje' => 'Ocurrio un error al recuperar la informacion',
                'success' => false
            ], 500);
        }
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateAuthorRequest $request, $id)
    {
        try {
            $author = new Author();
            $infoAuthor = $author->getById($id);

            if (is_null($infoAuthor)) {
                return response()->json([
                    'mensaje' => 'Recurso no encontrado',
                    'success' => false
                ], 404);
            }

            $data = [
                'updated_at' => Carbon::today(),
                'name' => $request->name,
                'birthdate' => $request->birthdate,
                'nationality' => $request->nationality,
            ];

            $infoAuthor->actualizar($data);

            return response()->json([
                'mensaje' => 'Registro actualizado',
                'success' => true
            ], 201);
        } catch (\Throwable $th) {
            return response()->json([
                'mensaje' => 'Ocurrio un error al actualizar el recurso',
                'success' => false
            ], 500);
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(int $id)
    {
        try {
            $author = new Author();
            $infoAuthor = $author->getById($id);

            if (is_null($infoAuthor)) {
                return response()->json([
                    'mensaje' => 'Recurso no encontrado',
                    'success' => false
                ], 404);
            }

            //VERIFICAR SI EL AUTOR TIENE LIBROS REGISTRADOS
            $book = new Book();
            $books = $book->getBooksByAuthor($id);
            if (count($books)) {
                return response()->json([
                    'mensaje' => 'El registro no puede ser eliminado. El autor cuenta con libros registrados',
                    'success' => false
                ], 409);
            }

            $infoAuthor->eliminar();

            return response()->json([
                'mensaje' => 'Registro eliminado',
                'success' => true
            ], 200);
        } catch (\Throwable $th) {
            return response()->json([
                'mensaje' => 'Ocurrio un error al eliminar el recurso',
                'success' => false
            ], 500);
        }
    }
}
