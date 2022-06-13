# Helps

## NB
- docker in mac/rancher fails during packaging, maybe due to mem issue. Not solved using --memory parameter (it seems it's ignored)
  - solved using containerd

* Startup
mvn spring-boot:run

* docker build
nerdctl build . -t plainnative -f Dockerfile

nerdctl run  plainnative bash
mvn -DskipTests -Pnative clean package

nerdctl build . -t plainnative-exec -f DockerfileNA
nerdctl rm plainnative-exec
nerdctl run -p 8081:8081 --name plainnative-exec plainnative-exec

nerdctl build . -t plainnative-java -f DockerfileJava
nerdctl rm plainnative-java
nerdctl run  -p 8082:8081 --name plainnative-java plainnative-java

*other executions

docker run -it --rm \
--volume $(pwd):/build \
--workdir /build \
--volume "$HOME"/.m2:/root/.m2 \
plainnative ./compile.sh