# DevOps
http://school.pages.takima.io/devops-resources/

## TP1


1-1 Document your database container essentials: commands and Dockerfile.

docker run -d --name my-postgres-container -p 5432:5432 my-postgres-db:v1.0

docker run -d -p 5432:5432 --name my-postgres-container --network app-network -e POSTGRES_PASSWORD=pwd -v /Users/leo/Desktop/EPF_4A/DevOps/tp1:/var/lib/postgresql/data my-postgres-db:v1.0



1-2 Why do we need a multistage build? And explain each step of this dockerfile.


1-3 Document docker-compose most important commands. 


1-4 Document your docker-compose file.

version: '3.7'

services:
    backend:
        build:
          context: "./backend/simple-api-student-main"
        container_name: "backend_db"
        networks:
          - database_prosp
        depends_on:
          - database


    database:
        
        image: pepsouille0/database:latest
        container_name: "database"
        networks:
          - database_prosp

    httpd:
        build:
          context: "./server"
        ports:
          - "80:80"
        networks:
          - database_prosp
        depends_on:
         - backend
         - database

networks:
    database_prosp:



1-5 Document your publication commands and published images in dockerhub.



## TP2

2-1 What are testcontainers?

2-2 Document your Github Actions configurations.

2-3 Document your quality gate configuration.


