# Dockerfile for Apache ActiveMQ
This is basic `docker` image for `Apache ActiveMQ`. Please see the [Apache ActiveMQ](http://activemq.apache.org/) for details.

# Usage
You need to `build` the image and then `run` it.

## Build
To build the image, following command is enough.

    docker build -t activemq .

## Run
In order to start `activemq` process you have to specify `Xms` and `Xmx` values while running `docker`, by passing those as a `ENVIRONMENT` variable.

Please see the example below:

    docker run -it -d \
    --name activemq \
    -v /mnt/data:/mnt/data \
    -p 8161:8161 \
    -p 61616:61616 \
    --env JVM_XMS=3G \
    --env JVM_XMX=3G \
    activemq

This will store the `activemq` data in /mnt/data/activemq/kahadb on the host. Ensure that this path is accessible by the `activemq` user in the container.
