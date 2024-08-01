
# API DESAFIO 1

## Technologies

* Apache 2
* Laravel 10.48
* PHP 8.1
* Composer 2.4.2


## Project
```bash
sudo apt update
sudo apt install git
sudo apt autoclean && sudo apt clean
cd /var/www/html/
git clone https://github.com/Blanca123g/Desafio1.git
sudo chown -R useradmin:www-data Desafio1
cd Desafio1
cp .env.example .env
composer install
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

