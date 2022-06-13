FROM ghcr.io/graalvm/graalvm-ce:latest

ADD . /build
WORKDIR /build

# For SDKMAN to work we need unzip & zip
RUN microdnf install -y unzip zip

RUN \
    # Install SDKMAN
    curl -s "https://get.sdkman.io" | bash; \
    source "$HOME/.sdkman/bin/sdkman-init.sh"; \
    # Install Maven
    sdk install maven; \
    # Install GraalVM Native Image
    gu install native-image;

RUN source "$HOME/.sdkman/bin/sdkman-init.sh" && mvn --version

RUN native-image --version

RUN source "$HOME/.sdkman/bin/sdkman-init.sh"

#downloads libraries
RUN ./mvnw clean package

