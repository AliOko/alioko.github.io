Database from https://www.postgresqltutorial.com/install-postgresql-linux/

# Docker steps:

## Docker handling

1. Run docker
```
docker-compose up -d
```
2. Close docker
```
docker-compose down
```

## How import database into docker?

1. Go to `/path/to/repo/postgresqltutorial_db`
2. Download dvdrental.zip 
```
curl -O https://sp.postgresqltutorial.com/wp-content/uploads/2019/05/dvdrental.zip
```
3. Unzip to `/path/to/repo/postgresqltutorial_db/dvdrental` as `dvdrental.tar`
```
unzip dvdrental.zip
```
4. Run postgresql in docker as postgres user
```
docker exec -it postgresqltutorial_db_dvdrental_1 psql -U postgres
```
5. Create table
```
create database dvdrental;
```
6. Exit postgres in docker
```
\q
```
7. Run docker as postgres user
```
docker exec -u postgres -it postgresqltutorial_db_dvdrental_1 bash
```
8. Go to `/docker-entrypoint-initdb.d/`
```
cd /docker-entrypoint-initdb.d/
```
9. Use the pg_restore tool to restore the dvdrental database
```
pg_restore --dbname=dvdrental --verbose dvdrental.tar
```
10. Now you can verify content of database
```
postgres-# \c dvdrental
You are now connected to database "dvdrental" as user "postgres".
dvdrental-# \dt
             List of relations
 Schema |     Name      | Type  |  Owner   
--------+---------------+-------+----------
 public | actor         | table | postgres
 public | address       | table | postgres
 public | category      | table | postgres
 public | city          | table | postgres
 public | country       | table | postgres
 public | customer      | table | postgres
 public | film          | table | postgres
 public | film_actor    | table | postgres
 public | film_category | table | postgres
 public | inventory     | table | postgres
 public | language      | table | postgres
 public | payment       | table | postgres
 public | rental        | table | postgres
 public | staff         | table | postgres
 public | store         | table | postgres
(15 rows)
```
