# Instalation

* Docker
    * https://docs.docker.com/engine/install/ubuntu/
    * https://docs.docker.com/engine/install/linux-postinstall/
* Docker-compose
    * https://docs.docker.com/compose/install/

# About docker and docker-compose

## Github repos

 * https://github.com/zhao-lin-li/postgresql-with-docker-compose
    
     ```
     database_1  | ls: cannot access '/docker-entrypoint-initdb.d/': Operation not permitted
     ```

 * https://github.com/jdaarevalo/docker_postgres_with_data

## Youtube

 *  Melvin L
      * PostgreSQL and Docker - getting started: https://youtu.be/A8dErdDMqb0

         * Create a Postgres docker container 
            ```
            docker run --name demo -e POSTGRES_PASSWORD=password1 -d postgres
            ```

        * Connect and run some queries
            ```
            docker exec -it demo psql -U postgres

            CREATE DATABASE demo_db1
            \c demo_db1
            CREATE TABLE demo_t(something int);
            INSERT INTO demo_t (something) VALUES (1);
            ```
        * Automate - run scripts using docker cli (run sql scripts from your host machine/dev machine etc)
            ```
            docker run --name demo -v "$PWD"/:/opt/demo/ -e POSTGRES_PASSWORD=password1 -d postgres
            docker exec -it demo psql -U postgres -c "CREATE DATABASE demo_db2"
            docker exec -it demo psql -U postgres -f /opt/demo/script_demo1.sql
            ```
   * Very Academy
      *  What are Docker Volumes? - A brief introduction with Commands and Docker-Compose example: https://youtu.be/wZbPmb4soTI
         *  Host volume
            * Lives on the Docker host's filesystem
            * Access from within the container
               ```
               docker run-v/path/on/host:/path/in/container ...
               ```
         * Anonymous volume
            * Docker handles storage location (host)
            * Difficult to refer to for multiple containers
               ```
               docker run -v/path/in/container ...
               ```
         *  Named Volume
            * Is like an anonymous volume
            * Docker manages location of volume
            * Difference: we name the volume
               ```
               docker volume create volume-name
               docker run -v name:/path/in/container ...
               ```
         * Create and manage volumes
            * Create outside the scope of the container
               ```
               # Create volume
               docker volume create new-vol
               # List volumes
               docker volume is
               # Inspect
               docker volume inspect new-vol
               # Remove
               docker volume rm new-vol
               ```
