# hello-java

This is a small application that runs Undertow, as an embedded web server, to return a nice greeting.

I created this to use for as a simple test for pipelines, demos and other stuff.

## To compile and run

To compile the application and build a fat-jar (`jar-with-dependencies`):

    mvn clean package

Then, to run:

    java -jar target/hello-java-1.0.0-SNAPSHOT.jar
    
## To build a Docker image

To build and push an OCI (Docker) image - e.g. to run on Kubernetes - set your registry credentials in environment variables and run `jib:build` with the image repository that you want to push to:

    export REGISTRY_USERNAME=youruser@example.com
    export REGISTRY_PASSWORD=registrypassssssswd
    
    mvn compile jib:build -Dimage=quay.io/youruser/yourimage
    
This uses [Google Jib][jib] to build the image. It doesn't build an executable JAR, but instead splits the build outputs into image layers (classes, libs, resources, etc.) and sets the container entrypoint to something like:

    java -cp /app/resources:/app/classes:/app/libs/* xyz.tomd.demos.hellorestjava.Application

## CI

### Concourse CI

This application includes a sample pipeline for _Concourse CI_.

```
# List all pipelines

# Create the overall pipeline
fly -t tutorial set-pipeline -c ci/concourse/pipeline.yml -p hello-java

# Unpause the job - it will go grey
fly -t tutorial unpause-pipeline -p hello-java

# Run
fly -t tutorial unpause-job --job hello-java/build
```

[jib]: https://github.com/GoogleContainerTools/jib
