#!/bin/sh

# If you would like to do some extra provisioning you may
# add any commands you wish to this file and they will
# be run after the Homestead machine is provisioned.


cd ~/Code/lsae
echo "Migrating DB"
php artisan migrate
echo "Seeding DB"
php artisan db:seed
echo "installing NPM"
npm install
echo "Running Gulp.sh"
./gulp.sh

echo "Installing BidGateway"
sudo apt-get -q -y install libmcrypt-dev g++
cd ~/Code/BidGateway
npm install
sudo npm install forever -g
forever start server.js


echo "Installing Services"
cd ~/Code/Services
npm install
forever start server.js

echo "Build Complete"




