<p align="center">
  <a href="https://github.com/pcampina/r5go-b2w">
  <img height="100" width="100' align="center" src="https://i.ibb.co/6Y9MhRX/goscan.png" /></a>
  <p align="center">
    Buy your products in <a href="https://www.americanas.com.br/">Americanas</a> just scanning then.
    <br />
    <br />
    View Demos:
    <a href="https://rocket-five-go-scan.herokuapp.com/">Front-end (PWA)</a> |
    <a href="http://r5-go.herokuapp.com/admin/login">Back-end</a>
  </p>
</p>

## About The Project

This project is a buy solution developed for MegaHack 2.0 ([Shawee](https://www.megahack.com.br/)) for Americanas / B2W

## Built with

- [Laravel](https://laravel.com)
- [Voyager](https://voyager.devdojo.com/)
- [MySql](https://www.mysql.com/)

## API Endpoints

```
(GET) http://r5-go.herokuapp.com/api/products
(GET) http://r5-go.herokuapp.com/api/products/{id}
(GET) http://r5-go.herokuapp.com/api/products/barcode/{barcode}

(GET) http://r5-go.herokuapp.com/api/category
(GET) http://r5-go.herokuapp.com/api/category/{id}
```

## Getting started

1. `git clone https://github.com/pcampina/r5go-b2w`
2. `composer install`
3. `mv .env.example`
4. `$ php artisan key:generate`
5. Setup your .env

```
APP_NAME=Myapp
APP_ENV=local
APP_KEY=base64:your_generated_key by step 4
APP_DEBUG=true
APP_URL=http://localhost:8080

DB_CONNECTION=mysql
DB_HOST=mysql
DB_PORT=3306
DB_DATABASE=your_database
DB_USERNAME=your_user
DB_PASSWORD=your_password
```

_If you want, use the demo sql in \_db/ folder._

## License

[MIT license](https://opensource.org/licenses/MIT).
