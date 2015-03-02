docker run --rm -P --name pg_test eg_postgresql
# then
docker run --rm -p 3000:3000 -t -i --link pg_test:pg prelaunchr_martin bash

#sed -i 's/host:REPLACEME/host: '"$PG_PORT_5432_TCP_ADDR"'/g' /prelaunchr/config/database.yml
