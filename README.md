# Docker-Confluent
A Docker toolkit to make a development Confluent platform ready in one stop.

## Overview
Page to outline how to prepare your own Confluent platform running in a Docker machine as a one stop solution. The installed environment will be kept isolated from your running Docker host like a physical machine, covering the following modules :
* ZooKeeper
* Kafka broker
* Schema registry
* Kafka rest proxy
* Kafka connect

## Objective
Build up a standalone Confluent platform for experimental use, service would be unavailable if visiting from different host owning different networks. 

## Prerequisite
The prerequisite components before the execution must be ready beforehand, here followings are the mandatory tools.
* Docker Engine for Mac, would provide the capacity of managing the Docker containers, receiving commands from Docker client and do the according actions. This would be the most essential part.
* VirtualBox,  Docker compose will have an virtual machine created with the supported driver VirtualBox, that running VM instance will be based on a tailored Linux kernel providing Docker native support.
* Docker Compose,  the orchestration tool of Docker containers, but limited all the containers to be in the same host. Would be pretty enough as the experimental use.
* Docker CLI,  Working as Docker Command input, go to have communication with Docker Engine via Docker REST API.

## Network Deployment View
Bridge network model would be used by default to ensure the internal communication between different containers, the perfect model for a small scaled deployment. For ports with public access purpose, port mapping and forwarding would be used to achieve the connectivity from external hosts. 

[]:https://github.com/guodongxiaren/ImageCache/raw/master/Logo/foryou.gif
 
## How TO
Go to check out the scripts for provisioning infrastructure.

```
OH-jund-MBP:Workspace jund$ git clone ssh://git@stash:7999/~jund/docker_confluent.git docker_kafka_platform
Cloning into 'docker_kafka_platform'...
remote: Counting objects: 4, done.
remote: Compressing objects: 100% (4/4), done.
remote: Total 4 (delta 0), reused 0 (delta 0)
Receiving objects: 100% (4/4), done.
OH-jund-MBP:Workspace jund$ cd docker_kafka_platform/
OH-jund-MBP:docker_kafka_platform jund$
```
You will find two files are already here after git clone finishes.
 
Go to run provisioning.sh with VM name provided, this VM name would be the identifier of managed VMs which should not be duplicate as existing ones. As the result, one VM with specified name would be created based on the Docker image boot2docker. This may take some minutes since that would go to Docker Hub to pull required images.

```
OH-jund-MBP:docker_kafka_platform jund$ ./provisioning.sh confluent
Running pre-create checks...
Creating machine...
(confluent) Copying /Users/jund/.docker/machine/cache/boot2docker.iso to /Users/jund/.docker/machine/machines/confluent/boot2docker.iso...
(confluent) Creating VirtualBox VM...
(confluent) Creating SSH key...
(confluent) Starting the VM...
(confluent) Check network to re-create if needed...
(confluent) Waiting for an IP...
Waiting for machine to be running, this may take a few minutes...
Detecting operating system of created instance...
Waiting for SSH to be available...
Detecting the provisioner...
Provisioning with boot2docker...
Copying certs to the local machine directory...
Copying certs to the remote machine...
Setting Docker configuration on the remote daemon...
Checking connection to Docker...
Docker is up and running!
To see how to connect your Docker Client to the Docker Engine running on this virtual machine, run: docker-machine env confluent
Creating network "dockerkafkaplatform_default" with the default driver
Pulling zookeeper (confluentinc/cp-zookeeper:3.3.0)...
3.3.0: Pulling from confluentinc/cp-zookeeper
ad74af05f5a2: Pull complete
d02e292e7b5e: Pull complete
8de7f5c81ab0: Pull complete
ed0b76dc2730: Pull complete
cfc44fa8a002: Pull complete
1e07e523d000: Pull complete
4462147ab37b: Pull complete
Digest: sha256:97b4f3fded09e8466f65ba722b684b3ac6f5a711de2e7723f9b1b699886ada15
Status: Downloaded newer image for confluentinc/cp-zookeeper:3.3.0
Pulling kafka (confluentinc/cp-kafka:3.3.0)...
3.3.0: Pulling from confluentinc/cp-kafka
ad74af05f5a2: Already exists
d02e292e7b5e: Already exists
8de7f5c81ab0: Already exists
ed0b76dc2730: Already exists
cfc44fa8a002: Already exists
f441b84ed9ba: Pull complete
d42bb38e2f0e: Pull complete
Digest: sha256:61373cf6eca980887164d6fede2552015db31a809c99d6c3d5dfc70867b6cd2d
Status: Downloaded newer image for confluentinc/cp-kafka:3.3.0
Pulling schemaregistry (confluentinc/cp-schema-registry:3.3.0)...
3.3.0: Pulling from confluentinc/cp-schema-registry
ad74af05f5a2: Already exists
d02e292e7b5e: Already exists
8de7f5c81ab0: Already exists
ed0b76dc2730: Already exists
cfc44fa8a002: Already exists
3056d28f058a: Pull complete
db153840316d: Pull complete
Digest: sha256:aeabd34351f5fa024405d2768edb1b807a311c6ed4df4bd818e78c1ec2f3643b
Status: Downloaded newer image for confluentinc/cp-schema-registry:3.3.0
Pulling restproxy (confluentinc/cp-kafka-rest:3.3.0)...
3.3.0: Pulling from confluentinc/cp-kafka-rest
ad74af05f5a2: Already exists
d02e292e7b5e: Already exists
8de7f5c81ab0: Already exists
ed0b76dc2730: Already exists
cfc44fa8a002: Already exists
6dc9345a4367: Pull complete
3abdc8446334: Pull complete
Digest: sha256:bc227632f9c4f3b69366c87fde9e8eb34a7cb27f3676234df72414a0e42189ca
Status: Downloaded newer image for confluentinc/cp-kafka-rest:3.3.0
Pulling kafkaconnect (confluentinc/cp-kafka-connect:3.3.0)...
3.3.0: Pulling from confluentinc/cp-kafka-connect
ad74af05f5a2: Already exists
d02e292e7b5e: Already exists
8de7f5c81ab0: Already exists
ed0b76dc2730: Already exists
cfc44fa8a002: Already exists
f441b84ed9ba: Already exists
d42bb38e2f0e: Already exists
33f3edccb235: Pull complete
4c3f722d70a5: Pull complete
bfff0f5dd0d0: Pull complete
Digest: sha256:e10f5eadb010da8d55aa5910c087edd38fe2cf92dbc41503cfd88a67108e2f29
Status: Downloaded newer image for confluentinc/cp-kafka-connect:3.3.0
Creating dockerkafkaplatform_zookeeper_1 ...
Creating dockerkafkaplatform_zookeeper_1 ... done
Creating dockerkafkaplatform_kafka_1 ...
Creating dockerkafkaplatform_kafka_1 ... done
Creating dockerkafkaplatform_schemaregistry_1 ...
Creating dockerkafkaplatform_schemaregistry_1 ... done
Creating dockerkafkaplatform_restproxy_1 ...
Creating dockerkafkaplatform_restproxy_1 ... done
Creating dockerkafkaplatform_kafkaconnect_1 ...
Creating dockerkafkaplatform_kafkaconnect_1 ... done
Confluent Docker containers are up and running now on host 192.168.99.104
```

It is worth noting the Docker Host will be the ending output that gives us that the address information we can go to communicate with the containers. 
Go to check the containers status to ensure the services to be healthy

```
OH-jund-MBP:docker_kafka_platform jund$ eval $(docker-machine env confluent)
OH-jund-MBP:docker_kafka_platform jund$ docker ps
CONTAINER ID        IMAGE                                   COMMAND                  CREATED             STATUS              PORTS                                        NAMES
6b6d374bd888        confluentinc/cp-kafka-connect:3.3.0     "/etc/confluent/do..."   5 minutes ago       Up 5 minutes        8083/tcp, 9092/tcp                           dockerkafkaplatform_kafkaconnect_1
d17b3ad858c0        confluentinc/cp-kafka-rest:3.3.0        "/etc/confluent/do..."   5 minutes ago       Up 5 minutes        0.0.0.0:8082->8082/tcp                       dockerkafkaplatform_restproxy_1
834a9490ba6a        confluentinc/cp-schema-registry:3.3.0   "/etc/confluent/do..."   5 minutes ago       Up 5 minutes        0.0.0.0:8081->8081/tcp                       dockerkafkaplatform_schemaregistry_1
7d37f3177022        confluentinc/cp-kafka:3.3.0             "/etc/confluent/do..."   5 minutes ago       Up 5 minutes        0.0.0.0:9092->9092/tcp                       dockerkafkaplatform_kafka_1
48272196fcd0        confluentinc/cp-zookeeper:3.3.0         "/etc/confluent/do..."   5 minutes ago       Up 5 minutes        2888/tcp, 0.0.0.0:2181->2181/tcp, 3888/tcp   dockerkafkaplatform_zookeeper_1
```
All the services are up and running, have fun!
