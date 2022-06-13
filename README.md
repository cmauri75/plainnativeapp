# Helps

## NB
- docker in mac/rancher fails during packaging, maybe due to mem issue. Not solved using --memory parameter (it seems it's ignored)
  - solved using containerd

* Startup
```
mvn spring-boot:run
```

* docker build and execution of a test machine
```
docker build . -t plainnative -f Dockerfile
docker run -p 8081:8081 -it plainnative bash
mvn -DskipTests -Pnative clean package
```


* Creation of native image
```
docker build . -t plainnative-exec -f DockerfileNA

docker rm plainnative-exec --force
docker run -e "PORT=8081" -p 8082:8081 --name plainnative-exec plainnative-exec

docker logs plainnative-exec

docker stop plainnative-exec
```

* Creation on POJMachine
```
docker build . -t plainnative-java -f DockerfileJava

docker rm plainnative-java --force
docker run -p 8083:8081 --name plainnative-java plainnative-java

docker logs plainnative-java

docker stop plainnative-java
```

* Other utils

```
docker run -it --rm \
--volume $(pwd):/build \
--workdir /build \
--volume "$HOME"/.m2:/root/.m2 \
plainnative ./compile.sh
```
