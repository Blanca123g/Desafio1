<?php

namespace App\Http\Controllers;

use App\Http\Requests\LoginRequest;
use App\Http\Requests\NewUserRequest;
use App\Http\Requests\StoreUserRequest;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AuthController extends Controller
{
    /**
     * Registro de usuario
     */
    public function register(StoreUserRequest $request)
    {

        try {
            $usuario = new User();

            $usuario->insertar([
                'name' => $request->name,
                'email' => $request->email,
                'password' => bcrypt($request->password)
            ]);

            return response()->json([
                'message' => 'Usuario creado correctamente'
            ], 201);
        } catch (\Throwable $th) {
            //throw $th;
        }
    }

    /**
     * Inicio de sesión y creación de token
     */
    public function login(LoginRequest $request)
    {
        try {
            $credentials = request(['email', 'password']);

            if (!Auth::attempt($credentials)) {
                return response()->json([
                    'mensaje' => 'Usuario y/o contraseña invalido(s)',
                    'success'=>false
                ], 401);
            }

            $user = $request->user();
            $tokenResult = $user->createToken('Personal Access Token');

            $token = $tokenResult->token;
            if ($request->remember_me) {
                $token->expires_at = Carbon::now()->addWeeks(1);
                $token->save();
            }

            return response()->json([
                'mensaje'=>'Inicio de sesión exitoso',
                'access_token' => $tokenResult->accessToken,
                'token_type' => 'Bearer',
                'expires_at' => Carbon::parse($token->expires_at)->toDateTimeString(),
                'success' => true
            ], 200);
        } catch (\Throwable $th) {
            return response()->json([
                'mensaje'=>'Ocurrio un error al iniciar sesión, intente nuevamente',
                'success'=> false
            ], $th->getCode());
        }
    }
}
