# Factory Shared Microgateway

Contains the configuration for the factory shared microgateway.

To build the docker image and tag it with the tag `microgateway`:
```
docker build  --platform=linux/amd64 -t microgateway .
```

After a successful build you can run the container with the following command, and expose the port 8080 on localhost:
```
docker run -p 8080:8080 microgateway:latest
```

To validate that the gateway is up and running you can go the the [http://localhost:8080/__health](http://localhost:8080/__health).