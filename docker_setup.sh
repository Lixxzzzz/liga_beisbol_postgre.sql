# Contenedor Postgres local
docker run --name liga_local ^
  -e POSTGRES_PASSWORD=1234 ^
  -e POSTGRES_DB=liga ^
  -p 5432:5432 ^
  -d postgres:16

# Contenedor Postgres remoto
docker run --name liga_remota ^
  -e POSTGRES_PASSWORD=1234 ^
  -e POSTGRES_DB=liga ^
  -p 5433:5432 ^
  -d postgres:16

# Crear red
docker network create liga_network
docker network connect liga_network liga_local
docker network connect liga_network liga_remota

# Contenedor pgAdmin
docker run --name pgadmin ^
  -e PGADMIN_DEFAULT_EMAIL=admin@admin.com ^
  -e PGADMIN_DEFAULT_PASSWORD=admin ^
  -p 8080:80 ^
  -d dpage/pgadmin4