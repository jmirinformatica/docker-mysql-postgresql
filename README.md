# Docker MySQL & PostgreSQL

Desplegament bàsic de MySQL i PostgreSQL amb [AdminerEvo](https://docs.adminerevo.org/).

**Important!** Tant PostgreSQL com MySQL estan configurats per defectet per a que siguin accessibles fora de docker, amb la IP configurada. Revisa el fitxer [docker-compose.yml](./docker-compose.yml) si no vols aquest comportament.

## Flask

A la carpeta [./data/flask/flask_app_to_deploy/](./data/flask/flask_app_to_deploy/) hi ha l'aplicació flask de prova que es desplega. L'aplicació flask de prova que hi ha també necessita un fitxer `.env` propi de configuració.

## Configuració

Crea un fitxer `.env` amb els paràmetres de configuració. Pots fer servir el fitxer [.env.exemple](./.env.exemple). A continuació executa:

    docker compose up -d

## Usuaris per l'alumnat

### MySQL

#### Creating

```sql
CREATE USER 'alumne'@'%' IDENTIFIED BY 'secret';
create database alumne_db1;
GRANT ALL PRIVILEGES ON `alumne_db1` . * TO 'alumne'@'%';
create database alumne_db2;
GRANT ALL PRIVILEGES ON `alumne_db2` . * TO 'alumne'@'%';
```

#### Cleaning

```sql
drop database alumne_db1;
drop database alumne_db2;
drop user alumne;
```

### PostgreSQL

#### Creating

```sql
create role alumne login encrypted password 'secret';
create database alumne_db1;
grant all privileges on database alumne_db1 to alumne;
ALTER DATABASE alumne_db1 OWNER TO alumne;
create database alumne_db2;
grant all privileges on database alumne_db2 to alumne;
ALTER DATABASE alumne_db2 OWNER TO alumne;
```

#### Cleaning

```sql
drop database alumne_db1;
drop database alumne_db2;
drop user alumne;
```


