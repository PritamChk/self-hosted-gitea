## Steps to build the image and run for gitea

### way 1 : only with docker commands

1. pull the postgres docker image from own dockerhub
   - `docker pull pritamchk98/postgres:v15.10`
1. create a network to run db and gitea container in same network
   - `docker network create gitea-net`
1. build the Dockerfile of gitea
   - `docker build --no-cache -t pritamchk98/gitea:v1.23.5 -f gitea.Dockerfile .`
1. Run the Postgres Image container with hostname and network parameters like below :
   - `docker run -d --name pgdb_2 --net gitea-net -p 5300:5432 -v giteadb_vol:/postgres/Database pritamchk98/postgres:v15.10`
1. connect to the postgres container to create the role and db for gitea
   - `docker exec -it pgdb_gitea sh`
   - `psql -p 5432`
   - `CREATE ROLE gitea WITH LOGIN PASSWORD 'yourpassword';`
   - `CREATE DATABASE giteadb WITH OWNER gitea TEMPLATE template0 ENCODING UTF8 LC_COLLATE 'en_US.UTF-8' LC_CTYPE 'en_US.UTF-8';`
1. update details in .env file in local and add .env file in .gitignore to avoid uploading sensitive data in remote

1. start gitea container with below command
   - `docker run --net gitea-net --name giteaApp -d -p 3000:3000 --env-file .env -v gitea_app_data:/gitea pritamchk98/gitea:v1.23.5`
