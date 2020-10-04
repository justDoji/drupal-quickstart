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

### Building and installing theme


#### Node.js based themes
If you are working on a Node.js based theme,
you can use the spawned node container to compile and build your theme.
```
docker-compose exec -u node node npm install
docker-compose exec -u node node npm run build
```

#### Standard themes
The default set-up used a FortyTwo based theme and subtheme.
These are included in the `theme-files` directory.
The `deploy_theme.sh` script can be edited to copy your required files qnd enabling the theme after
your drupal server has started.


### Use Composer to build and start your Drupal Site

```
docker-compose exec web composer install
docker-compose exec web ./vendor/bin/run drupal:site-install
```
Your site will be available at:
 http://127.0.0.1:8080/<site-root>

### Exporting and migrating data

The default `composer.yml` and `runner.yml.dist` provide the `docker/default_content` module.
This is a command line tool that can be used to export data from one Drupal instance to another.


# Acknowledgements

Inspired by:
* https://github.com/drupal-composer/drupal-project
* https://github.com/openeuropa/oe_theme