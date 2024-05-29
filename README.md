# DevOps
http://school.pages.takima.io/devops-resources/

## TP1


### 1-1 Document your database container essentials: commands and Dockerfile

Create a Docker network named app-network for connect all the containers
`docker network create app-network`


Run Adminer container with port mapping from host port 8090 to container port 8080,
attaching it to the app-network, naming it adminer, and running it in detached mode.
`docker run \-p "8090:8080" \--net=app-network \--name=adminer \-d \admine `


Run a PostgreSQL container named my-postgres-container in detached mode, mapping host port 5432 to container port 5432, attaching it to the app-network, setting the environment variable POSTGRES_PASSWORD to 'pwd', and mounting a volume from the host to the container for persistent data storage.
`docker run -d -p 5432:5432 --name my-postgres-container --network app-network -e POSTGRES_PASSWORD=pwd -v /Users/leo/Desktop/EPF_4A/DevOps/tp1:/var/lib/postgresql/tp1 my-postgres-db:v1.0`

### 1-2 Why do we need a multistage build? And explain each step of this dockerfile

Multistage builds in Docker are used to create lean, efficient, and secure container images by separating the build environment from the runtime environment. Here are the main reasons why multistage builds are beneficial:
- Reduced Image Size
- Enhanced Security
- Improved Efficiency
- Better Separation of Concerns

By separating the build and runtime environments, multistage builds help create more efficient, secure, and maintainable Docker images.


`docker run --name backend-app --network my-network -p 8080:8080 -d my-backend-app:v1.0`
`docker run -dit --name my-running-app --network app-network -p 8085:80 my-apache2:v1.0 `


### 1-3 Document docker-compose most important commands

- docker-compose up
    Usage: docker-compose up [options] [SERVICE...]
    Description: Builds, (re)creates, starts, and attaches to containers for a service.
- docker-compose down
    Usage: docker-compose down [options]
    Description: Stops containers and removes containers, networks, volumes, and images created by docker-compose up.
- docker-compose build
    Usage: docker-compose build [options] [SERVICE...]
    Description: Builds or rebuilds services.
- docker-compose logs
    Usage: docker-compose logs [options] [SERVICE...]
    Description: View output from containers.
- docker-compose ps
    Usage: docker-compose ps [options] [SERVICE...]
    Description: Lists containers.
- docker-compose exec
    Usage: docker-compose exec [options] SERVICE COMMAND [ARGS...]
    Description: Executes a command in a running container.
- docker-compose stop
    Usage: docker-compose stop [SERVICE...]
    Description: Stops running containers without removing them.
- docker-compose start
    Usage: docker-compose start [SERVICE...]
    Description: Starts existing containers for a service.
- docker-compose restart
    Usage: docker-compose restart [options] [SERVICE...]
    Description: Restarts running containers.
- docker-compose rm
    Usage: docker-compose rm [options] [SERVICE...]
    Description: Removes stopped service containers.
- docker-compose pull
    Usage: docker-compose pull [options] [SERVICE...]
    Description: Pulls service images.
- docker-compose config
    Usage: docker-compose config [options]
    Description: Validates and views the Compose file.


### 1-4 Document your docker-compose file

'see docker-compose file'

### 1-5 Document your publication commands and published images in dockerhub

To connect to DockerHub.
`docker login`

To rename our image.
`docker tag {my_image} leogou/{my_image}:{tag}`

To push the image on the public DockerHub.
`docker push leogou/{my_image}:{tag}`


To have more information on the images, it is necessary to check the respective Dockerfile.

## TP2

### 2-1 What are testcontainers?

'Testcontainers' is a Java library that provides lightweight, throwaway instances of common databases, Selenium web browsers, or anything else that can run in a Docker container during your JUnit tests. It allows you to easily set up and tear down containerized environments for testing, ensuring consistent and reproducible test results.
Overall, these dependencies enable developers to write integration tests that interact with containerized resources, such as databases, in a controlled and reproducible manner using Testcontainers.


### 2-2 Document your Github Actions configurations

To have more information on the Github Actions configurations, it is necessary to check the respective .github/workflows folder.

### 2-3 Document your quality gate configuration

To configurat the gate properly, there is some step mandatory.

- Add this to pom.xml:
<properties>
  	<sonar.host.url>https://sonarcloud.io</sonar.host.url>
		<sonar.projectKey>devons_devops</sonar.projectKey>
</properties>

- Change 'run: mvn clean install --file ./API/simple-api-student-main/pom.xml' in  .github/workflows/test-backend.yml by the line bellow. Where devons_devops & devons are some key from sonar and SONAR_TOKEN is a variable store in github to save the connection token.

run: mvn -B verify sonar:sonar -Dsonar.projectKey=devons_devops -Dsonar.organization=devons -Dsonar.host.url=https://sonarcloud.io -Dsonar.login=${{ secrets.SONAR_TOKEN }}  --file ./API/simple-api-student-main/pom.xml


## TP3

### 3-1 Document your inventory and base commands

To have more information on the inventory, it is necessary to check the respective ansible/inventories/setup.yml file.

- Install Ansible using Homebrew
`brew install ansible`
- Check the installed Ansible version
`ansible --version`
- SSH into a remote server using a specific private key
`ssh -i ~/Desktop/EPF_4A/DevOps/ansible/id_rsa centos@leo.goutard.takima.cloud`
- Run Ansible module 'yum' to ensure that 'httpd' package is present on all hosts
`ansible -i inventories/setup.yml all -m yum -a "name=httpd state=present" --private-key=id_rsa -u centos (-b)`
- Run Ansible module 'shell' to append HTML content to a file on all hosts
`ansible -i inventories/setup.yml all -m shell -a 'echo "<html><h1>Hello World</h1></html>" >> /var/www/html/index.html' --private-key=id_rsa -u centos --become`

### 3-2 Document your playbook

To have more information on the playbook, it is necessary to check the playbook and respective each main.yml file for every roles.

### 3-3 Document your docker_container tasks configuration


To have more information on the playbook, it is necessary to check the playbook and respective each main.yml file for every roles.
(same than before)