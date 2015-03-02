#!/bin/bash

#bash  /sbin/my_init

sed -i 's/host:REPLACEME/host: '"$PG_PORT_5432_TCP_ADDR"'/g' /prelaunchr/config/database.yml

pushd prelaunchr

# Setup the database
bundle exec rake db:create db:schema:load db:seed

# Start the server
bundle exec rails s



