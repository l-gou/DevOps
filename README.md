# DevOps


1-1 Document your database container essentials: commands and Dockerfile.

docker run -d --name my-postgres-container -p 5432:5432 my-postgres-db:v1.0

docker run -d -p 5432:5432 --name my-postgres-container --network app-network -e POSTGRES_PASSWORD=pwd -v /Users/leo/Desktop/EPF_4A/DevOps/tp1:/var/lib/postgresql/data my-postgres-db:v1.0