# Use the official httpd image version 2.4 as the base image
FROM httpd:2.4

# Copy the index.html file from the local filesystem to the /usr/local/apache2/htdocs/ directory inside the container
COPY ./index.html /usr/local/apache2/htdocs/

# Copy the httpd.conf file from the local filesystem to the /usr/local/apache2/conf/httpd.conf directory inside the container
COPY ./httpd.conf /usr/local/apache2/conf/httpd.conf
