# Docker Basics

---

*Courtesy:- TechWorld with nana*
## What is a container and what problems it solve?

<!-- ![container](https://miro.medium.com/max/6144/1*yo62B91F4V1QIJYirBbxlQ.jpeg) -->

* Container is a way to package application with all the necessary dependencies and configuration.
* The package or container is portable, it can be easily shared and moved around.
* That portability of containers across various development teams, and everything can be packaged in one isolated environment, makes development and deployment more efficient.

### Where do containers exist?

* If you got an app thats completed its 1st phase development  and need to containerize it, how can it be done?
* Containers existing in a container repository, for a private company there is their own container storage, and there are public open source containers for various programs in ***docker.hub***. where you can browse and publify any application container you want.
* For example if need a continuous deployment tool like jenkins, or a db like postgres or any open source software there is an official docker image for that.

### How containers makes life easy

* So if you are developing a django application with, django REST backend and react frontend, there needs, python, django, django rest, node, react, ...etc the exact same versions and setups on every developer system with different OS, configuration and versions.
* Sometimes it is an open source development and they are handling many other projects, if you need to switch to this particular project in the meantime, the setup process will takes and enormous amount of time and a lot of frustration..its a hands down to productivity..
* Now the existing problems stated briefly, but how the containers solve this..
* With containers you don't need to install any of the softwares or tools directly, with every things runnings as its own isolated images packed in to one OS image, and one docker command will fetch this and run at the same time.
* The docker commands are same on every system, if you need 10 dependencies 10 docker commands will fetch it all in your system..
* Still 10 commands to run??, no thats why the configuration file exists `Dockerfile` and `docker-compose` will help you around this, so its all came down to very less process setup your app just with one command..

  That sounds like the exact way how the production should go, how it was done earlier then,

* Before containers, there is configuration instructions for each dependencies passed to the hierarchies of a dev. team, a slight fail in communication can cause.. lot of troubles.
* Now with a docker container, no environmental configuration needed on server, except the docker runtime, different departments can work on a project, its a plug and play to get to the dev. environment.

### Whats inside the container?

* A container is actually layers of images, on the base of it is mostly a linux base image, cz of its small size,(most of them is alpine, which is the lighter version of linux)
* Then there is this application image (eg: postgres, python etc.. what you need), there will be those intermediate stack images that will lead to the final desired application image.

### Docker and virtual machine

* To get the difference between docker and other VM's, lets start from operating systems, OS has 2 layers the **OS kernel** and the **applications layer**, for eg there are different distributions of linux, there is ubuntu, debian, mint, kali...etc, they all look different, the GUI, file system all are different, but they all are based on the **same linux kernel, with different application layers**.
* So docker and other virtual machines got these OS's they are virtualizing, the question is what part of the os they are virtualizing.
* In **docker, it virtualize the application layer**, the downloaded docker image contains the application layer of the OS and some other applications, and it uses the kernel of the host(in the docker toolbox for earlier version in windows it uses the kernel from virtual box, the docker desktop for windows 10 versions it got its own kernel comes with the installation).
* The VM or VirtualBox in the other hand, has its own Application and OS kernel, it virtualizes the complete OS, if you download an image it uses it own kernel and application.
* The advantages docker just brings to the table is,
  * Docker images are small (talking about seveal Mb's vs GB's),
  * Runs faster(only to boot one time the kernel gets up and applications changed on top of it.)
  * Compatibility:- Oracle VB can run applications based on any kernel(windows, mac), for docker you need to get a work around to get the compatibility.

## Installation(windose)

* One can now install the *Docker Desktop for Windows Home* machines using the new(as on 2020) WSL 2 backend. [seed docs](https://docs.docker.com/docker-for-windows/install-windows-home/)
* Docker toolbox is now deprecated and no longer got the development support, windows or older mac users needed to upgrade to windows 10 versions.

## Docker image and Docker container

* ### Docker image

  * Image is the actual package that exist in the hub, with the configuration start script.
  * It is the part that gets moved around.
  * Images got tags, versions(etc:- *12-alpine*), latest is the one you get if you `docker pull` directly, its size and features varies across tags.
  * `docker images` gives you a list of all docker images existing in your system.

* ### Docker container

  * When you pull that image on to the local machine and started, the container environment is created from the base configuration and start script.
  * Simply, container is a running environment for an image,
  * A container needs:- **application image**(postgres, mongo..etc), **file system**(to save logs and config) also needs some **environmental configurations** like environmental variables.
  * All the communication provided by containers through the **ports linked** to it (eg: *port: 5000*), which enables talking to the application running in from the host.
  * It got its **own virtual file system**:- abstracted from base os, but different from the host OS.
  * To convert an image to container you just need to `docker run` it, to get a list of all images running ie containers do a `docker ps`
  * It shows the container `id`, `image`s based on ports and names etc..

## Pull and run your first image from the docker hub

* Lets start with a postgresql image from the docker hub, lets use the 12-alpine `docker run postgres:12-alpine`
* That gives an error, cz its a requirement to run the postgres it needs a superuser and a password.
so, this is the command needed,
`docker run --name some-postgres -e POSTGRES_PASSWORD=mysecretpassword -d postgres`
* `--name` is the custom name for the postgres instance, let it be "*mylocaldb*".
* Then a postgres password, lets go with `incorrect`(so no needed an extra reminder), do get some ports mapped with `-p 5432:5432`(which is the default port for postgres), and then finally the image `postgres:12-alpine`(if you just needed the latest alpine image give `postgres:alpine` only),

  ```bash
  docker run --name mylocaldb -e POSTGRES_PASSWORD=incorrect -d -p 5432:5432 postgres:12-alpine
  ```

* If it is for the first time docker pulls the image from the hub,(postgres alpine is approx 157mb), its pulls fully, the base image will be there in your system until you manually delete it.
* You can see all the separate layers downloading, one advantage of this layering is that, if a new version of postgres is out, then it is needed to only update the top postgres layer not the intermediate images.
* Next time you updating it takes very less time, as some of the images are already in your system.
* Now our container is up and running, you can see the running containers with a `docker ps` on cli.

  ```bash
  CONTAINER ID        IMAGE                COMMAND                  CREATED             STATUS              PORTS                    NAMES
  e6e0c63cfbd1        postgres:12-alpine   "docker-entrypoint.s"   4 minutes ago       Up 4 minutes        0.0.0.0:5432->5432/tcp   mylocaldb
  ```

* One can manage this container using its id or name,
* If you need to run another version of postgres at the same time on the local machine., like `10-alpine`
  can do it with no fuzz, using that particular image and `docker run`.

### How to run a container properly as needed (what is -e, -p, -d...etc)

* By default if you do a `docker run`, the container runs in the **attached mode**, ie now it can be stopped with `ctrl + C`, and the running statuses/or logs are live on the command line.
* But if you run `docker run -d`, you are entering to the **detached mode**, now after the command it returns the running container ID. there will be no live status/logs on the command line, doing a `docker ps` shows the container running in the background.
* `-e` enables you setting an environment variable(here used to set the username & password).

1. To stop a running container
   * `docker stop ID`, you don't need the full id just the first few letters, `docker stop e6e0` will stop the above container, can also use the name `docker stop mylocaldb`.

2. To start the container
   * To start the container again, `docker start ID`
   * What if you just forget the name and id(starting it on other day), instead of digging through the command line history just do a `docker ps -a`, that shows all the running and stopped containers.

3. To run different versions at the same time
   * If we just initiated two versions of an application using `docker run <image>`, chances they are listening to the same port, you can verify it with `docker ps`
   * Even if using the same ports both can run simultaneously, how that's done
   * **container port vs host port**:- container is just a virtual environment running on the host, there can have multiple containers running on the host machine.\
   The host machine got certain ports available for connections, one need to create a binding between the host machine port and the virtual machine port, **You get a conflict when same port is used on host machine**, (eg:- two instances trying to connect to the same host port: 5000)
      ![docker-ports](images/docker-ports.png)
     * but the virtual machine can have same ports, cz they are separate instances running, as they are bound to different host ports.
     * in the eg 3, the host address is `some-app://localhost:3001`, then the host forward the request using the port bindings.
   * To use the app with host, we need to bind a host port to it, It can be done simply by binding the ports at the runtime, `docker run -p <host_port>:<container_port>`
   * Now I run a second container with the same postgres but a different version say, postgres 10-alpine, with different host port mapped,\
    `docker run --name mylocaldb2 -e POSTGRES_PASSWORD=incorrect -d -p 5300:5432 postgres:10-alpine`
   * `docker ps` gives,

    ```bash
    CONTAINER ID        IMAGE                COMMAND                  CREATED             STATUS              PORTS                    NAMES
   c45f78f6a784        postgres:10-alpine   "docker-entrypoint.s"   4 seconds ago       Up 3 seconds        0.0.0.0:5300->5432/tcp   mylocaldb2
    ```

   * Now the laptops `5300` port is bound to containers `5432` port.
   * if used the same host port it gives an already allocated port warning.

4. Commands for troubleshooting
   * To see the logs produced by a container:-  `docker logs <container_id>`, or use the names
   * The `docker exec`
     * A very useful tool, that gives a running terminal in the container.
     * To get a terminal use it with the `-it` (interactive), command.\
        `docker exec -it <container_name> bash`.
     * An `ls` will give all the directories, `pwd` to get the current working directory, `env` shows all the environment variables.
     * Use an `exit` to get quickly exit from the terminal.

### `docker run` vs `docker start`

* `docker run` creates new container from images, while `docker start` works with containers, start while `docker stop` stops them.

## Demo project:- WorkFlow with Docker

---
![docker process](./images/docker-process.png)

* Developing a JS application, containerized with docker, uses a mongoDB database.
* The first phase development is completed and now need to deploy to a development server so as a tester can test that thing.
* The deployment uses CI tools like jenkis, that grabs the committed content from `git` and produce artifacts from the application.(builds the script to the docker image)
* The js application is built to a docker image and deployed to the private docker repository in the company.
* FInally that docker image is automated deployed to the development server, with the jenkins script or any other tools. Development server pulls the image from the repository, with the configuration specifies also pulls the dependency mongodb from the docker hub, that all required for the app to run.
* Now the tester or any other developer logs in to the test server and tests the application.

### Application:- create and edit a user profile

![demo-app-flow](./images/demo-app-flow.png)

* JS app with node js in the backend,
* Uses docker images of mongodb and its UI mongoExpress.

![user-profile](./images/user-profile.png)

* Just a simple application to use a database, with a user profile that can be edited and the data saved in mongodb.
* View the application [in the root](./user_profile/server.js).
* Get `mongo` [image](https://hub.docker.com/_/mongo) from the docker hub, pull the latest, `docker pull mongo`, its about 500mb in size.
* server instance using `docker run --name some-mongo -d mongo:tag`.
* Also get the [mongo express](https://hub.docker.com/_/mongo-express) `docker pull mongo-express`, to use it `docker run --network some-network -e ME_CONFIG_MONGODB_SERVER=some-mongo -p 8081:8081 mongo-express`.
* Now the images are pulled and a `docker images` give,

  ```bash
  mongo-express                    latest              6df8f457a22a        36 hours ago        130MB
  mongo                            latest              3068f6bb852e        8 days ago          493MB
  python                           3.7-alpine          295b051ee125        3 months ago        41.7MB
  dpage/pgadmin4                   latest              ae36b8785e03        4 months ago        220MB
  postgres                         10-alpine           eb55da5694a2        4 months ago        71.8MB
  postgres                         12.4-alpine         3781fe35c6b8        4 months ago        157MB
  postgres                         alpine              3781fe35c6b8        4 months ago        157MB
  python                           3.8.5-alpine        f8a57363ff96        5 months ago        80.3MB
  postgres                         12-alpine           17150f4321a3        5 months ago        157MB
  alpine                           latest              a24bb4013296        6 months ago        5.57MB
  ```

* Now run both mongo and mongo-express containers, so that the db is available for the application and it can be seen in mongo-express.

* Lets have the connection between mongodb and mongo-express first.

## Docker Network

![container-host](./images/container-host.png)

* To connect between containers and host, it is important to know about Docker Network,
* Docker creates its isolated docker network, inside the host, where the containers exist
* Two containers in the docker isolated network can talk to each other using just the container name,(cz they are in same network)
* But the applications that run outside(the node-express server running), do connect using the host(localhost) and the port number(27017:- default for mongo).
* Later when we package the application to a docker image, there will the node.js application also in association with the other mongo containers in the same docker network.
* The browser still connects to the application using the host and the port number.

* Docker already got some networks built in, to see all networks do a `docker network ls`.

  ```bash
  NETWORK ID          NAME                                 DRIVER              SCOPE
  520673c63715        bridge                               bridge              local
  e9c31d42c215        dockerpractice_default               bridge              local
  2848dd9f831e        host                                 host                local
  866232a52a90        none                                 null                local
  ```

* Create an own network for the mongodb and the mongo express, named "mongo-network", with `docker network create mongo-network`.
* Now the `docker network ls` shows the new network created

  ```bash
  aaef65bbc49d        mongo-network                        bridge              local
  ```

* In order to make the mongodb container + mongo-express container run in the `mongo-network`, also need to give this network option in the `docker run ..` command.

### Run mongo container

* To **start the container from the pulled mongo image** run `docker run -p 27017:27017 -d mongo`
* mapped the default port, runs in the detached mode, but that is not enough also needed to specify environment variables.
* In the docker hub page, the basic details about the env. variables needed can be founded, the relevent ones for every major project are, `MONGO_INITDB_ROOT_USERNAME, MONGO_INITDB_ROOT_PASSWORD`, the username and password for the database,
* Also, the `MONGO_INITDB_DATABASE` is usefull to specify custom names for the database, but it can be done using the mongo-express, so just going with username and password, also add a container name(mymongodb) and specify the created network to be in, now the run command gets to,

  ```bash
  docker run -p 27017:27017 -d -e MONGO_INITDB_ROOT_USERNAME=mongoadmin MONGO_INITDB_ROOT_PASSWORD=incorrect --name mymongodb --net mongo-network mongo
  ```

  Split it to multiple lines if it gets too lengthy(the nexy level is the configuration file)

  ```bash
  docker run -d \
  -p 27017:27017 \
  -e MONGO_INITDB_ROOT_USERNAME=mongo-admin \
  -e MONGO_INITDB_ROOT_PASSWORD=incorrect \
  --name mymongodb \
  --net mongo-network \
  mongo
  ```

  `docker ps`

  ```bash
  CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                      NAMES
  3bc29e73622f        mongo               "docker-entrypoint.s"   10 seconds ago      Up 8 seconds        0.0.0.0:27017->27017/tcp   mymongodb
  ```

* We can any time log the container(`docker logs <cont_id_>`) or inspect it using `docker inspect <cont_id`,

  `docker logs`(last line only)

  ```bash
  {"t":{"$date":"2020-12-19T09:03:27.864+00:00"},"s":"I",  "c":"NETWORK",  "id":23016, "ctx":"listener","msg":"Waiting for connections","attr":{"port":27017,"ssl":"off"}}
  ```

  `docker inspect`(only the networks part)

  ```bash
  "Networks": {
      "mongo-network": {
          "IPAMConfig": null,
          "Links": null,
          "Aliases": [
              "3bc29e73622f"
          ],
          "NetworkID": "aaef65bbc49d0e7248792c74be4af165d9e765a4220f66255811bf93a1ea2130",
          "EndpointID": "eb1a4bf1a598ab62f2274681903012683a4a772d8a2d61c4124a8fcc709e0b76",
          "Gateway": "172.21.0.1",
          "IPAddress": "172.21.0.2",
          "IPPrefixLen": 16,
          "IPv6Gateway": "",
          "GlobalIPv6Address": "",
          "GlobalIPv6PrefixLen": 0,
          "MacAddress": "02:42:ac:15:00:02",
          "DriverOpts": null
      }
  }
  ```

### Run mongo-express container

* Now start the container for **mongo-express**, needed the mongo express connected to the running mongodb on startup, looking at the [docs in docker hub](https://hub.docker.com/_/mongo-express).

* It needed the `ME_CONFIG_MONGODB_ADMINUSERNAME` and `ME_CONFIG_MONGODB_ADMINPASSWORD`, which is the database(mongo-admin, incorrect:- created for mymongodb) username and password, needed for authentication,
* Port is by default one,(27017- else needed to add to -e variables)
* The important part is the mongodb server, `ME_CONFIG_MONGODB_SERVER`, it is the mongodb container name(mymongodb) running in the same network.
* Creating the docker run command for express, last one is the image name

  ```bash
  docker run -d \
  -p 8081:8081 \
  -e ME_CONFIG_MONGODB_ADMINUSERNAME=mongo-admin \
  -e ME_CONFIG_MONGODB_ADMINPASSWORD=incorrect \
  --net mongo-network \
  --name mymongo-express \
  -e ME_CONFIG_MONGODB_SERVER=mymongodb \
  mongo-express
  ```

* Now with a `docker ps`

  ```bash
  CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                      NAMES
  d37712fb1043        mongo-express       "tini -- /docker-ent"   8 seconds ago       Up 6 seconds        0.0.0.0:8081->8081/tcp     mymongo-express
  3bc29e73622f        mongo               "docker-entrypoint.s"   25 minutes ago      Up 25 minutes       0.0.0.0:27017->27017/tcp   mymongodb
  ```

  `docker logs mymongo-express`

  ```bash
  docker logs mymongo-express
  Waiting for mymongodb:27017...
  Welcome to mongo-express
  ------------------------


  Mongo Express server listening at http://0.0.0.0:8081
  Server is open to allow connections from anyone (0.0.0.0)
  basicAuth credentials are "admin:pass", it is recommended you change this in your config.js!
  Database connected
  Admin Database connected
  ```

* Now the express is available in port `8081`, In windows without the docker desktop, or somehow connecting to `127.0.0.1:8081`(ie localhost) fails **use the docker-machine ip to connect**, it can be obtained by `docker-machine ip`, the default is `192.168.99.100`, so a `192.168.99.100:8081` will do the connection.

![mongo-express](./images/mongo-express.png)

* Look the hostname is the container_id of the db service(mymongodb).
* Create a new database(here "user-account"), now it needed to connect the mongo-db server with mongodb container.

### Connect Node server with MongoDB container

* To connect node js running on the host with the database created in mongodb('user-account), to do that give the protocol(ip) of the database and the URI, uri for the database will be `localhost:27017`,
* Need to add some code in node js for that. look at the [server.js](./user_profile/server.js).
* Create a new collection(similar to table in sql), in the 'user-account' database with mongo-express.
* so a new collection of user is created, for the connection the env. username and the password are gonna used, in the admin:password fields, (real life using env variables)`const mongoUrlLocal = "mongodb://admin:password@127.0.0.1:27017";`
* local not working or connecting to the database, take a look at the log,, to get the last part only do a `docker logs 3bc29e73622f | tail`, or to stream the logs(realtime) `docker logs 3bc29e73622f -f`
* For a successful connection it requires, *received client metadata from ip* message and request from nodejs.

### Conclusion of app phase1.

* In short now we got a nodejs application, with backend of mongodb and mongo-express conncected and the commands involved are lengthy.

  ```bash
  # Docker network
  docker network create mongo-network

  # start mongodb
  docker run -d \
  -p 27017:27017 \
  -e MONGO_INITDB_ROOT_USERNAME=mongo-admin \
  -e MONGO_INITDB_ROOT_PASSWORD=incorrect \
  --name mymongodb \
  --net mongo-network \
  mongo

  # start mongo-express
  docker run -d \
  -p 8081:8081 \
  -e ME_CONFIG_MONGODB_ADMINUSERNAME=mongo-admin \
  -e ME_CONFIG_MONGODB_ADMINPASSWORD=incorrect \
  --net mongo-network \
  --name mymongo-express \
  -e ME_CONFIG_MONGODB_SERVER=mymongodb \
  mongo-express
  ```

  But the process can be made simple using, `docker compose`

## Docker compose

* For running multiple containers that needed to talk to each other, they can be configured in a single file, the mapping looks like.

  ![docker-compose-1](./images/docker-compose-1.png)

* In the `.yaml` file the indentation is important, each container is at the same level, then the services.

  ```yaml
  version: '3'   # Docker compose version

  services:
    mongodb:
      image: mongo  # image to pull mongodb

      ports:
        - 27017:27017   # Host:Container
      environment:  # Environment variables
        - MONGO_INITDB_ROOT_USERNAME=mongo-admin
        - MONGO_INITDB_ROOT_PASSWORD=incorrect

    mongo-express:
      image: mongo-express  # image to pull mongo-express
      ports:
        - 8081:8081
      environment:
        - ME_CONFIG_MONGODB_ADMINUSERNAME=mongo-admin
        - ME_CONFIG_MONGODB_ADMINPASSWORD=incorrect
        - ME_CONFIG_MONGODB_SERVER=mongodb  # to which server it is connected
  ```

  ![docker-compose-2](./images/docker-compose-2.png)

* `mymongodb` is changed to `mongodb` and `mymongo-express` to `mongo-express`.
* So docker compose is the structured way to contain docker commands, easier to edit the files..
* Not need to specify the `--net`(ie docker network), docker compose creates a common network as default.
* `docker-compose` is already installed with docker.
* To start all the containers just run the yaml file using `docker-compose`. if you name the file as `docker-compose.yml`, just a `docker-compose up` from the root will do., for a specific yaml file use the file name prefixes with `-f` (ie from file)

  ```bash
  docker-compose -f mongo.yaml up
  ```

* It runs and streams the connection process, first the database is setup, till then express tries to connect and reconnect once the db once is set-up, then express connects to it, in the same network(the waiting logic can be configured in the docker-compose)
* docker-compose creates custom prefixes and suffixes for the names of the services, if we do a `docker ps` on another terminal.

  ```bash
  CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                      NAMES
  a71a42f66c2d        mongo-express       "tini -- /docker-ent"   3 minutes ago       Up 20 seconds       0.0.0.0:8081->8081/tcp     docker_practice_mongo-express_1
  ac2b85bc4cf9        mongo               "docker-entrypoint.s"   17 minutes ago      Up 20 seconds       0.0.0.0:27017->27017/tcp   docker_practice_mongodb_1
  ```

* When you restart a container everything that is configured into its virtual storage also geas deleted. no data persistent in the containers, this data persistency can be added using volumes, (Docker volumes)
* Again create the collection, now the app can connect.
* To stop the running containers just use the `docker-compose down`, here

  ```bash
  docker-compose -f mongo.yaml down
  ```

* It also removes the network created.

---

## Building our own docker image

---

![create-dockerfile](./images/create-dockerfile.png)

* Now it is needed to build a docker image from the node js backend app.
* In a real world development, jenkins will fetch the deployed code and creates the JS app and docker image, here it is gonna do it manually,

### Dockerfile

![dockerising](./images/dockerising.png)

* To build a docker image from a application, we need a blueprint to build the image each time, it is dockerfile.

![dockerfile](./images/dockerfile.png)

* Start the docker file, or every docker file based on an image-base image(-alpine  etc)
* We need node inside of the application to run it, in docker hub and search node,(node 15.4-alpine3.12), optionally define environmental variable using `ENV`(prefferd in docker-compose rather than dockerfile)
* One can execute any linux command inside a dockerfile `RUN` is used to do that, so to create a project folder, `RUN mkdir -p/home/app`, this is created inside of the container,(`-p` is short for --parents - it creates the entire directory tree up to the given directory.)
* There is also a `COPY` command, why don't we can use the `RUN` to do a `cp` or `mv`, this COPY is different, as it is executed in the `HOST` machine and used to copy the local folder to the image folder,
* `CMD`, is used to execute entrypoint linux commands, `CMD ["node", "server.js"]`, which is same as `node server.js` use to run the app, can run this as the files are copied and the node is already installed in the system.
* Why can it use `RUN node server.js`, cz `CMD` is used for entrypoint commands, ie it says you needed to execute this as an entrypoint command.

### ADD and COPY in Dockerfile

* **ADD** command is older than **COPY**, Since the launch of the Docker platform, the **ADD** instruction has been part of its list of commands.
* The command copies files/directories to a file system of the specified container, `ADD /source/file/path  /destination/path`
* **ADD** can also copy files from URL's, also it copies compressed files(from local), automatically extracting the content in the given destination(formats, gz, bz, xz..)
* **COPY** only has only one assigned function. Its role is to duplicate files/directories in a specified location in their existing format. This means that it doesn’t deal with extracting a compressed file, but rather copies it as-is.
* The instruction can be used only for locally stored files, and to copy files as-is, with `COPY /source/file/path  /destination/path`.
* Conclusion, To sum up – use **COPY**. As Docker itself suggests, **avoid the ADD command** unless you need to extract a local tar file.

### Creating the Dockerfile

* Docerfile cant have any file name, it must be exactly called `Dockerfile`.

```Dockerfile
FROM node:15.4-alpine3.12

ENV MONGO_DB_USERNAME=mongo-admin \
    MONGO_DB_PWD=incorrect

RUN mkdir -p /home/app

COPY . /home/app

CMD ["node", "server.js"]
```

## Building an image

![docker-images-layer](./images/docker-images-layer.png)

* To build an image from the `Dockerfile`, the image needs a name(give it the app name) and a tag, it can be a number or v1/version-1 etc.
* The second required parameter is the `path to the Dockerfile`, (here it is in current directory)

  ```bash
  docker build -t my-app:1.0 .
  ```

  Now a `docker images`, give

  ```bash
  REPOSITORY                       TAG                 IMAGE ID            CREATED             SIZE
  my-app                           1.0                 af35770ff9c8        29 seconds ago      115MB
  ```

* From the root-map image, what jenkins does is, it takes the dockerfile, and build a docker image based on the dockerfile, so all the development team has the access to the image,
* Test run the created app container., `docker run my-app:1.0`, that gives a server.js not found error, its cz the path is not fully given the file is in the new copied path `/home/app`, give that path in the Dockerfile.
* SO the Dockerfile, edited so the older image not valid now, need to rebuild the image, if needed remove the old image using `docker rmi <IMAGE ID>`, before that delete the containers using it, `docker rm <container_id` update the tags if feature updates done.
* Now the rebuild image is running, As `docker logs` gives not much info, lets dig into the container with `docker exec -it <cont_id> /bin/bash`, but some containers don't have bash at that case use `/bin/sh`, or simply `sh`, here in case of node, `docker exec -it 468dbcfc8745 sh` works.

### Navigating through the container

* Do navigation with `ls`, `cd` and `cd ..` and `~/`,
* To see the environment variables set use the `env`, it gives this,

  ```sh
  NODE_VERSION=15.4.0
  HOSTNAME=468dbcfc8745
  YARN_VERSION=1.22.5
  SHLVL=1
  HOME=/root
  OLDPWD=/home
  MONGO_DB_USERNAME=mongo-admin
  TERM=xterm
  PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
  MONGO_DB_PWD=incorrect
  PWD=/
  ```

* Check our files and directory created, the Dockerfile, and docker-compose files etc are not needed, so create an app directory, and mv only the files required to run the app to that.(in the local)
* So created an `app` directory, now needed to modify the `Dockerfile` to copy only the app directory instead of all the contents, ie, `COPY ./app /home/app`, rebuild the container, updated the Dockerfile to this,

  ```Dockerfile
  FROM node:15.4-alpine3.12

  ENV MONGO_DB_USERNAME=mongo-admin \
    MONGO_DB_PWD=incorrect

  RUN mkdir -p /home/app

  COPY ./app /home/app

  # set default dir so that next commands executes in /home/app dir
  WORKDIR /home/app

  # will execute npm install in /home/app because of WORKDIR
  RUN npm install

  # no need for /home/app/server.js because of WORKDIR
  CMD ["node", "server.js"]
  ```

## Image naming in docker registeries

* The first part of the image should be registryDomain, then image name and tag ie `registryDomain/imageName:tag`,
* But why the images in the docker-hub don't got these kind of long names, cz the `docker pull mongo:4.2` is a shorthand for this `docker pull docker.io/library/mongo:4.2`.
* In private registries need the full tag.

## Private repository for docker images

### Amazon ECR(Elastic Container Registery)

* There is others like digitalocean, nexus etc.
* Create a private repository(or docker registory) in AWS ECR.
* Get started -> repository name -> create a repository., in ECR, there can be only one repository per image, inside can store different versions(tags) of same image.
* To push the images to that, one must login/ authenticate the host pushing that, if jenkins is pushing to that repository jenkins credentials must be given, so `docker login` is the first step.
* ECR got is own docker login code use that.*Pre-requisites* :- AWS cli needs to be installed and credentials configured
* After authentication, in AWS ECR, push the image with the full tag, but before that we need to tag(rename) the image with `docker tag imageName:tag registryDomain/imageName:tag`, it is to let know docker where this image needed to be pushed, so `docker tag` does is simply rename the image.
* It creates an identical copy of the existing one with the rename, now that one needs to be pushed to the private repository. `docker push registryDomain/imageName:tag`
* Now in aws, there is the image exists, it got image URI, and a hash digest(unique hashmap).
* When the app gets updated `my-app:1.1`, similarly rename with `docker tag`, the repository is same with different versions, only the changed one gets repushed the second time.
* Now the different versions are listed, that is helpful in testing(AWS have capacity of holding 1000 images/ repo.)

--

---

## Deploy the app with docker-compose

---

![deployment](./images/deployment.png)

* Suppose the image pushed to the repository needs to be deployed, by using docker-compose it can be done, to do that add a `my-app` field in the docker-compose with the `registryDomain`,

  ```yaml
  version: '3'
   # This docker-compose file is used to deploy the image.
  services:
    my-app:
      images: <registryDomain>/my-app:1.0
      ports:
        - 3000:3000  # The app listens on port 3000
      commands: sh -c "npm start"  # optional to start the node server as defined in the script

    mongodb:
      image: mongo  # mongodb image from docker-hub

      ports:
        - 27017:27017   # Host:Container
      environment:  # Environment variables
        - MONGO_INITDB_ROOT_USERNAME=mongo-admin
        - MONGO_INITDB_ROOT_PASSWORD=incorrect

    mongo-express:
      image: mongo-express  # mongo-express from docker-hub
      ports:
        - 8081:8081
      environment:
        - ME_CONFIG_MONGODB_ADMINUSERNAME=mongo-admin
        - ME_CONFIG_MONGODB_ADMINPASSWORD=incorrect
        - ME_CONFIG_MONGODB_SERVER=mongodb  # to which server it is connected
  ```

* So that the server can fetch it from the private repository, the other images required, ie the mongo and mongo-express gets pulled from the docker-hub.
* Can also add a npm scripts command to the app, for starting the server.
* Finally copy only the docker-compose file to the root directory `/home/`, just outside the `app`, to build the working container.
* run `docker-compose -f mongo.yaml up`.
* Change the connecting server in `server.js` to `mongodb`,

## Docker volumes

* Docker volumes used for **data persistence**, ie no data is lost when container restarted.
* It a must require for database involved applications,

### The need of Docker Volumes

![anonymus-vol](./images/anonymus-vol.png)

* When doing a container restart all the data im it will be gone, not the thing you needed, but need the data to be stored in the host(in the local machine or server where the container is running), ie to permanently save the changes the application is making, docker volumes are used.
* There are virtual file system (inside the container) and the physical file system (in the host machine)
* It is a plug and play system, when the container is started, the physical-host file system is plugged to the container(a specific path or directory specified in the docker compose)
* When the application writes or modifies the data in the virtual file system, it gets replicated exactly in the host file path.
* Thats for every fresh start the data existing is fetched and the system runs with data persistance.

### Different ways of creating docker volumes

1. With the `docker run` using `-v` by referencing *host:container*(host volumes)

    ![volumes-1](./images/volumes-1.png)

   * For eg using `docker run -v /home/mount/data:/var/lib/mysql/data` (*host: container*)
   * The mysql host path is synced with the container path.
   * This is called **Host Volumes**, one can decide **where on the host file system, the reference is made**.

2. With just referencing the container volume (anonymous volumes)

    ![anonymus-volume-1](./images/anonymus-volume-1.png)

   * It will only specify which container directory is to store data,
   * Docker automatically creates same one in the host and does the thing, this types of volumes are called **Anonymous volumes**.
   * For each new container a folder is generated that gets mounted and stores the data.

3. Anonymous volumes, that can specify host folder name (Named volumes)

   * Compared to anonymous volumes, it can be referenced by name, so called **Named Volumes**, (dont need to know the path).
   * The mostly used one and the one **should be used in production** is the named volumes, ie it lets docker manage the host directories, with our inspection.

   Eg of named volumes,

   ```yml
   version: '3'

   services:
      mongodb:
          image: mongo

          ports:
            - 27017:27017

          volumes:
            - db-data:/var/lib/mysql/data  # db-data is the host folder name and next one is the
                                         # full path in the container to fetch that data
      mongo-express:
          image: mongo-express

          ...

   volumes:
      db-data
   ```

* At the end all the volumes defined must be listed, that ones are get mount to the container at start,
* Then at the container each service level, the exact path gets mentioned, `/var/lib/mysql/data.. etc`
* The benefit of this approach is it can mount the reference of the same host folder to different services running, beneficial if those needs to share the data.

### Docker volumes in practice

* In created app, lets attach volumes so the data not gets lost every time.
* Firstly define the list of all volumes gonna mounted at the bottom `volumes`, the with the path at the `services` level.

  ```yaml
  version: '3'
   # This docker-compose file is used to deploy the image.
  services:
   # my-app:
   #   images: <registryDomain>/my-app:1.0
   #   ports:
   #     - 3000:3000  # The app listens on port 3000
   #   commands: sh -c "npm start"  # optional to start the node server as defined in the script
    mongodb:
      image: mongo  # image to pull mongodb

      ports:
        - 27017:27017   # Host:Container
      environment:  # Environment variables
        - MONGO_INITDB_ROOT_USERNAME=mongo-admin
        - MONGO_INITDB_ROOT_PASSWORD=incorrect
      volumes:
        - mongo-data:/

    mongo-express:
      image: mongo-express  # image to pull mongo-express
      ports:
        - 8081:8081
      environment:
        - ME_CONFIG_MONGODB_ADMINUSERNAME=mongo-admin
        - ME_CONFIG_MONGODB_ADMINPASSWORD=incorrect
        - ME_CONFIG_MONGODB_SERVER=mongodb  # to which server it is connected
  volumes:
    mongo-data:
      driver: local
  ```

* For defining the path for a particular database, search for the default path where the data base stores, for *mongodb* - it is */data/db*, for postgres it is, */var/lib/postgresql/data/*, for mysql:- *var/lib/mysql*, assure it by getting inside the container
* All the data gets replicated from the host:path and vice versa.

### Where the local volumes exist in the docker machine.

* ON the windows, it will be typically in `C:\ProgramData\docker\volumes`
* On linux, `/var/lib/docker/volumes`.
* Mac, same as linux, but the docker in mac creates a linux virtual machine in the background and stores the data there. so `ls /var/lib/docker`, show nothing, start a screen section to the VM, and to close that vm, `exit` don't work in mac use `ctrl+ a + k`

* Each volume got a unique hash(one of the advantage of docker managing the paths), buth with the advantage of named volumes the navigation and referencing ca be done using the names.

---

:- CONCLUSION AND WHAT'S NEXT

- SO, How to create manage-deploy-containers, learnt, now  how to manage this large amount of containers across different servers, not manually, it so hard to manage a single container manually... causes so much headache

- So the best step is to use container orchestration tools, Kubernetes in particular, which is the most popular tool to do this task, that will be the next way to go also,
- learn other devops tools like, jenkins, github actions