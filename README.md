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
nerdctl build . -t plainnative -f Dockerfile
nerdctl run -p 8081:8081 -it plainnative bash
mvn -DskipTests -Pnative clean package
```


* Creation of native image
```
nerdctl build . -t plainnative-exec -f DockerfileNA

nerdctl rm plainnative-exec
nerdctl run -d -p 8082:8081 --name plainnative-exec plainnative-exec

nerdctl logs plainnative-exec

nerdctl stop plainnative-exec
```

* Creation on POJMachine
```
nerdctl build . -t plainnative-java -f DockerfileJava

nerdctl rm plainnative-java
nerdctl run -d -p 8083:8081 --name plainnative-java plainnative-java

nerdctl logs plainnative-java

nerdctl stop plainnative-java
```

* Other utils

```
docker run -it --rm \
--volume $(pwd):/build \
--workdir /build \
--volume "$HOME"/.m2:/root/.m2 \
plainnative ./compile.sh
```
