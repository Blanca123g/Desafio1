<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;


class Author extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'birthdate',
        'nationality',
    ];

    /**
     * Recuperar informacion de un recurso en especifico
     *
     * @param integer $id
     * @return object
     */
    public function getById(int $id)
    {
        return $this->find($id);
    }

    /**
     * Recuperar listado de autores
     *
     * @param string|null $p_buscar
     * @return void
     */
    public function getPaginateOrSearch(string|null $p_buscar)
    {
        $query = $this::select('*');

        if ($p_buscar) {
            $query->where(function ($q) use ($p_buscar) {
                $p_buscar = "%" . $p_buscar . "%";
                $q->orWhere('name', 'ilike', $p_buscar);
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
}
