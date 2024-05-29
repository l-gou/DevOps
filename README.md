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

<<<<<<< HEAD

## TP3

ssh -i ~/Desktop/EPF_4A/DevOps/ansible/id_rsa centos@leo.goutard.takima.cloud
ssh -i ansible/id_rsa centos@leo.goutard.takima.cloud

ansible -i inventories/setup.yml all -m ping
ansible -i inventories/setup.yml all -m yum -a "name=httpd state=present" --private-key=id_rsa -u centos (-b)

ansible -i inventories/setup.yml all -m shell -a 'echo "<html><h1>Hello World</h1></html>" >> /var/www/html/index.html' --private-key=id_rsa -u centos --become


3 Point to document/report

3-1 Document your inventory and base commands

3-2 Document your playbook

3-3 Document your docker_container tasks configuration.



=======
ahhah
>>>>>>> 329948d9c691bfdbe529e2aedad675be500d4396

aaze