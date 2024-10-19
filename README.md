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

    CREATE USER 'demo'@'%' IDENTIFIED BY 'demo123';
    create database demo_db1;
    create database demo_db2;
    GRANT ALL PRIVILEGES ON `demo_%` . * TO 'demo'@'%';

#### Cleaning

    drop database demo_db1;
    drop database demo_db2;
    drop user demo;

### PostgreSQL

#### Creating

    create role demo login encrypted password 'demo123';
    create database demo_db1;
    grant all privileges on database demo_db1 to demo;
    ALTER DATABASE demo_db1 OWNER TO demo;
    create database demo_db2;
    grant all privileges on database demo_db2 to demo;
    ALTER DATABASE demo_db2 OWNER TO demo;

#### Cleaning

    drop database demo_db1;
    drop database demo_db2;
    drop user demo;
