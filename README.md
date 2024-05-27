# DevOps


1-1 Document your database container essentials: commands and Dockerfile.

docker run -d --name my-postgres-container -p 5432:5432 my-postgres-db:v1.0

docker run -d -p 5432:5432 --name my-postgres-container --network app-network -e POSTGRES_PASSWORD=pwd -v /Users/leo/Desktop/EPF_4A/DevOps/tp1:/var/lib/postgresql/data my-postgres-db:v1.0



1-2 Why do we need a multistage build? And explain each step of this dockerfile.


1-3 Document docker-compose most important commands. 


1-4 Document your docker-compose file.


1-5 Document your publication commands and published images in dockerhub.