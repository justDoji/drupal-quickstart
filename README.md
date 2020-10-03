# Drupal QUICKSTART

A quickstart project for drupal development, using a dockerized development environment.
Using this quickstart project, you will be able to: 
* build your own theme files using Node.js
* Start your Drupal server using Composer

## Dev environment set-up

### Starting containers

To start as a running process, so you have full output and can kill the containers whenever you want:
```
docker-compose up
```

To run in detached mode:
```
docker-compose up -d
```

### Use Node.js container to build theme

```
docker-compose exec -u node node npm install
docker-compose exec -u node node npm run build
```

### Use Composer to build and start your Drupal Site

```
docker-compose exec web composer install
docker-compose exec web ./vendor/bin/run drupal:site-install
```
Your site will be available at:
 http://127.0.0.1:8080/<site-root>

# Acknowledgements

Inspired by:
* https://github.com/drupal-composer/drupal-project
* https://github.com/openeuropa/oe_theme