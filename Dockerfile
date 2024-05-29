# Use the official Python image as the base
FROM postgres:14.1-alpine

# Environment variables are set for configuring the PostgreSQL database
ENV POSTGRES_DB=db \
   POSTGRES_USER=usr \
   POSTGRES_PASSWORD=pwd

# Files placed in this directory are automatically executed when the PostgreSQL server starts up for the first time. 
# The SQL files likely contain database schema creation and data insertion scripts.
COPY ./CreateScheme.sql /docker-entrypoint-initdb.d/
COPY ./InsertData.sql /docker-entrypoint-initdb.d/