
kafka-docker: zookeeper-less setup for AWS
============


Tags and releases
-----------------

Available tags are: (TBD, need to release it, although will likely be a private docker repo like AWS ECR)

- `0.0.1`
---

## Build the image

```
sh build.local.sh 
```

## AWS Usage

1. Spin up an AWS EC2 cluster (in a public subnet) with a SG that allows your IP(s) inbound access to 9094 (kafka) and 8081 (schema registry)

2. Install docker and docker-compose inside the AWS EC2 instance

3. SCP the docker-compose.yaml file in this root directory into the ec2 instance

4. Start up the containers

```
docker-compose up -d
```

## Ensure containers are healthy and perform connectivity test to AWS kafka & schema registry from local machine

1. Check to see that the containers are up and running

2. Check to see if you can reach port 9094 (kafka). If it hangs, it means you forgot to add the inbound port 9094. If connection is refused, then kafka is unhealthy and/or it's not up and running

```
nc -vc <ec2 ip adress> 9094
```

3. Check to see if you can reach port 8081 (Schema registry). If it hangs, it means you forgot to add the inbound port 8081. If connection is refused, then schema-registry is unhealthy (likely because there is no healthy broker it can connect to) and/or it's not up and running

```
nc -vc <ec2 ip adress> 8081
```

## Running kafka UI and schema registry UI locally connected to AWS kafka and AWS schema registry 

1. Replace <ec2 ip address> on line 10 and line 21 with your actual EC2 IP address in kafka-stack-uis.yml
        
2. Start up the kafka stack for UIs. This will spin up Kowl (kafka ui) reachable via ```localhost:8090/topics``` and schema registry ui via ```localhost:8001```
        
```
docker-compose -f kafka-stack-uis.yml up -d
```
