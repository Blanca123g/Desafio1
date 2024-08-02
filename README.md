
# API DESAFIO 1

## Technologies

* Apache 2
* Laravel 10.48
* PHP 8.1
* Composer 2.4.2


## Project
```bash
cd /var/www/html/
git clone https://github.com/Blanca123g/Desafio1.git
cd Desafio1
cp .env.example .env
composer install
```

### Consideraciones importantes
Se debe crear previamente la base de datos: **desafio_idesa**

En el archivo .env se deben cambiar los siguientes valores de acuerdo al motor de base de datos a utilizar
```
DB_CONNECTION=[pgsql || mysql || sqlite || sqlsrv]
DB_HOST=127.0.0.1
DB_PORT=[pgsql 5432 || mysql 3306]
DB_DATABASE=desafio_idesa
DB_USERNAME=[usuario_de_la_BD]
DB_PASSWORD=[contraseña]
```

### Migrations and Seeders

```bash
php artisan migrate --seed
```

### Generate Keys --Laravel Passport
```bash
php artisan passport:install
```

## Test
Para ejecutar las pruebas es necesario utilizar el siguiente comando:
```bash
php artisan test
```

## Development

### Server

Run development server

```bash
php artisan serve
```

### Access web browser (temporal)

To access [http://localhost:8000/]

