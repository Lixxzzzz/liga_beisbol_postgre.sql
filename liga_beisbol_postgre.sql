-- Contenedor

docker run --name liga_local ^
-e POSTGRES_PASSWORD=1234 ^
-e POSTGRES_DB=liga ^
-p 5432:5432 ^
-d postgres:16

docker run --name liga_remota ^
-e POSTGRES_PASSWORD=1234 ^
-e POSTGRES_DB=liga ^
-p 5433:5432 ^
-d postgres:16

-- crear red
docker network create liga-network
docker network connect liga-network pgadmin
docker network connect liga-network liga_local
docker network connect liga-network liga_remota

--- contenedor pgadmin
docker run --name pgadmin ^
-e PGADMIN_DEFAULT_EMAIL=admin@admin.com ^
-e PGADMIN_DEFAULT_PASSWORD=admin ^
-p 8080:80 ^
-d dpage/pgadmin4
