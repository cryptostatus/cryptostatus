# <img src='https://github.com/cryptostatus/cryptostatus/blob/master/demo.jpg' alt='Cryptostatus' />

API for aggregation and monitoring prices for cryptocurrency.

Client repo is [here](http://github.com/cryptostatus/cryptostatus-client)

## Development environment

Fill env variables by `.env.example`.

Prepare:

 * `docker-compose build`

 * `docker-compose run --rm web bundle i`

 * `docker-compose up -d`

 * `docker-compose run --rm web bundle exec rails db:create`

 * `docker-compose run --rm web bundle exec rails db:migrate`

 * `docker-compose run --rm web bundle exec rails db:seed`

 Running tests:

 * `docker-compose run --rm web rspec`

 Running Rails:

 * `docker-compose run --rm --service-ports web`

 Running Sidekiq:

 * `docker-compose run --rm --service-ports sidekiq`

## Production environment

Fill env variables by `.env.example.production`.

Add IP of your production machine to capistrano [config](https://github.com/cryptostatus/cryptostatus/blob/master/config/deploy/production.rb).

Prepare server configuration with our [Chef Solo](https://github.com/cryptostatus/cryptostatus-chef).

Initialize folder on a server and upload configs by following two commands:

```
cap production deploy
cap production deploy:upload_configs
```

Finally run deploy command:

```
cap production deploy
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/cryptostatus/cryptostatus.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
