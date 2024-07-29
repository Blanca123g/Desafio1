<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreBookRequest;
use App\Http\Requests\UpdateBookRequest;
use App\Models\Book;
use Carbon\Carbon;
use Illuminate\Http\Request;

class BookController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        //la pagina si o si debe ser en ingles
        $buscar = $request->input('search', false);

        $book = new Book();
        $books = $book->getBooks($buscar);

        return $books;
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreBookRequest $request)
    {
        try {
            $book= new Book();

            $data = request(['title', 'isbn', 'published_date', 'author_id']);

            $data['created_at']= Carbon::today();
            $data['updated_at']= Carbon::today();

            $book->insertar($data);

            return response()->json([
                'mensaje' => 'Libro registrado',
                'success' => true
            ], 201);

        } catch (\Throwable $th) {
            return response()->json([
                'mensaje' => 'Ocurrio un error al registrar el libro',
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
            $book = new Book();
            $infoBook = $book->getById($id);
            if (is_null($infoBook)) {
                return response()->json([
                    'mensaje' => 'Recurso no encontrado',
                    'success' => false
                ], 404);
            }

            return response()->json([
                'data' => $infoBook,
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
    public function update(UpdateBookRequest $request, int $id)
    {
        try {
            $book = new Book();
            $infoBook = $book->getById($id);
            if (is_null($infoBook)) {
                return response()->json([
                    'mensaje' => 'Recurso no encontrado',
                    'success' => false
                ], 404);
            }

            $data = [
                'updated_at' => Carbon::today(),
                'title' => $request->title,
                'isbn' => $request->isbn,
                'published_date' => $request->published_date,
                'author_id' => $request->author_id,
            ];

            $infoBook->actualizar($data);

            return response()->json([
                'mensaje' => 'Registro actualizado',
                'success' => true
            ], 201);

        } catch (\Throwable $th) {
            return response()->json([
                'mensaje' => 'Ocurrio un error al actualizar la informacion',
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
            $book = new Book();
            $infoBook = $book->getById($id);
            if (is_null($infoBook)) {
                return response()->json([
                    'mensaje' => 'Recurso no encontrado',
                    'success' => false
                ], 404);
            }

            $infoBook->eliminar();

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
