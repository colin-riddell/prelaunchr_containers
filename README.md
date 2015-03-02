
## Build containers

```bash
cd pgsql_container
docker build -t eg_postgresql .
cd ../prelaunchr_container
docker build -t prelaunchr_martin  .
```

## Run containers:

```bash
docker run -d -P --name pg_test eg_postgresql
docker run -d -p 3000:3000 -i --link pg_test:pg prelaunchr_martin
```

## Notes

sed -i 's/host:REPLACEME/host: '"$PG_PORT_5432_TCP_ADDR"'/g' /prelaunchr/config/database.yml
