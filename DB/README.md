# Postgres Image creation
---

![My Skills](https://go-skill-icons.vercel.app/api/icons?i=linux,docker,bash,postgres,vscode,&perline=6)

---

### Postgres version supported 

> **upto 16.8**

### Postgres Image Build Command Syntax supported 

>[!TIP]
>```sh
>export PGVERSION=15.0
>docker build --build-arg="PGVERSION=${PGVERSION}" -t pritamchk98/postgres:v${PGVERSION} -f postgres.Dockerfile .
>```
>OR we can build through docker-compose 
>
>```sh
>docker-compose build
>```

### Available ENVIRONMENT VARIABLES

1. `DBPORT=5432`               ## DBPORT inside container 
1. `MAX_CONN=100`              ## Default : 100
1. `IP_RANGE="0.0.0.0/0"`
1. `ENC_ALGO="scram-sha-256"`  ## possible values-> |scram-sha-256|md5|

## volume backup technique:

### backup in tar.gz

>powershell
```powershell
docker run --rm -v pg_data:/postgres -v ${PWD}:/tmp alpine:3.21 tar -czvf /tmp/postgres_backup.tar.gz -C /postgres . 
```
>bash
```sh
docker run --rm -v pg_data:/postgres -v $(pwd):/tmp alpine:3.21 tar -czvf /tmp/postgres_backup.tar.gz -C /postgres . 
```

### restore into same volume from tar.gz:

>powershell
```powershell
docker run --rm -v pg_data:/postgres -v ${PWD}:/backup alpine:3.21 tar -xzvf /backup/postgres_backup.tar.gz -C /postgres
```
>bash
```bash
docker run --rm -v pg_data:/postgres -v $(pwd):/backup alpine:3.21 tar -xzvf /backup/postgres_backup.tar.gz -C /postgres
```

