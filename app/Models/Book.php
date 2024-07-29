<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Book extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'title',
        'isbn',
        'published_date',
        'author_id'
    ];

    /**
     * Recuperar informacion de un recurso en especifico
     *
     * @param integer $id
     * @return object
     */
    public function getById(int $id)
    {
        return $this::select('books.*', 'authors.name as author')
            ->join('authors', 'author_id', 'authors.id')
            ->where('books.id', $id)
            ->first();
    }

    /**
     * Recuperar listado de autores
     *
     * @param string|null $p_buscar
     * @return void
     */
    public function getBooks(string|null $p_buscar)
    {
        $query = $this::select('books.id', 'authors.name as author', 'books.title', 'books.isbn', 'books.published_date')
            ->join('authors', 'author_id', 'authors.id');

        if ($p_buscar) {
            $query->where(function ($q) use ($p_buscar) {
                $p_buscar = "%" . $p_buscar . "%";
                $q->orWhere('title', 'ilike', $p_buscar)
                    ->orWhere('isbn', 'ilike', $p_buscar)
                    ->orWhere('authors.name', 'ilike', $p_buscar);
            });
        }

        return $query->paginate(env('ITEMS_POR_PAGINA'));
    }

    /**
     * Funcion para insertar uno o mas registros
     *
     * @param array $p_data
     * @return object
     */
    public function insertar(array $p_data)
    {
        return $this->create($p_data);
    }

    /**
     * Funcion para actualizar el registro
     *
     * @param array $p_data
     * @return object
     */
    public function actualizar(array $p_data)
    {
        return $this->update($p_data);
    }

    /**
     * Funcion para eliminar un registro en especifico
     *
     * @param array $p_data
     * @return void
     */
    public function eliminar()
    {
        return $this->delete();
    }


    public function getBooksByAuthor(int $id)
    {
        return $this->where('author_id', $id)->get();
    }
}
