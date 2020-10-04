#!/usr/bin/zsh



echo '+--------------------------------------------------------------------------------------+'
echo '|                                     <(^v^)>                                          |'
echo '|                                                                                      |'
echo '|       ___________  ______               _                                  _         |'
echo '|      /  ___|  _  \ |  _  \             | |                                | |        |'
echo '|      \ `--.| | | | | | | |_____   _____| | ___  _ __  _ __ ___   ___ _ __ | |_       |'
echo '|       `--. \ | | | | | | / _ \ \ / / _ \ |/ _ \| '\''_ \| '\''_ '\'' _ \ / _ \ '\''_ \| __|      |'
echo '|      /\__/ / |/ /  | |/ /  __/\ V /  __/ | (_) | |_) | | | | | |  __/ | | | |_       |'
echo '|      \____/|___/   |___/ \___| \_/ \___|_|\___/| .__/|_| |_| |_|\___|_| |_|\__|      |'
echo '|                                                | |                                   |'
echo '|                                                |_|                                   |'
echo '|                                                                                      |'
echo '|                                     <(^v^)>                                          |'
echo '+--------------------------------------------------------------------------------------+'
echo '|                                                                                      |'
echo '|              Drupal Quick Start package                                              |'
echo '|                  using Docker-Compose, Composer                                      |'
echo '|                  includes sane defaults                                              |'
echo '|                                                                                      |'
echo '+--------------------------------------------------------------------------------------+'
echo '|              Brought to you by:                                                      |'
echo '|                     Stijn Dejongh - SD Development                                   |'
echo '+--------------------------------------------------------------------------------------+'

sudo docker-compose exec web composer update
sudo docker-compose exec web composer install
sudo docker-compose exec web ./vendor/bin/run drupal:site-install

sudo chmod -R 777 ./drupal-files/web


echo '+--------------------------------------------------------------------------------------+'
echo '|              Drupal Environment ready                                                |'
echo '|                   > Deploying theme                                                  |'
echo '+--------------------------------------------------------------------------------------+'

# BARIO
#sudo docker-compose exec web ./vendor/bin/drush theme:enable bootstrap_barrio -y
#sudo docker-compose exec web ./vendor/bin/drush theme:enable bootstrap_barrio_subtheme -y
#sudo docker-compose exec web ./vendor/bin/drush config-set system.theme default bootstrap_barrio_subtheme -y

# Forty-two custom theme
mkdir ./drupal-files/web/themes/contrib
cp -r ./theme-files/fortytwo ./drupal-files/web/themes/contrib/fortytwo
cp -r ./theme-files/STARTERKIT ./drupal-files/web/themes/custom/STARTERKIT
sudo docker-compose exec web ./vendor/bin/drush theme:enable fortytwo -y
sudo docker-compose exec web ./vendor/bin/drush config-set system.theme default fortytwo -y

echo '+--------------------------------------------------------------------------------------+'
echo '|              Theme deployed                                                          |'
echo '|                 |- Reloading cache                                                   |'
echo '|                 |- Opening default browser                                           |'
echo '+--------------------------------------------------------------------------------------+'

sudo docker-compose exec web ./vendor/bin/drush cr

sensible-browser http://localhost:8080/web &

echo '+--------------------------------------------------------------------------------------+'
echo '|                                     ~ FIN ~                                          |'
echo '|                                                                                      |'
echo '|                                     <(^v^)>                                          |'
echo '+--------------------------------------------------------------------------------------+'