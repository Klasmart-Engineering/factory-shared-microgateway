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

## Validating a Configuration file

This repository offers a [Dockerfile](Dockerfile.validate) that will automatically validate the config in this
repository with the provided region and environment.

Where `REGION` & `ENVIRONMENT` specify which files get loaded from the `config/settings` directory

```sh
docker buildx build -t validate -f Dockerfile.validate .
docker run -e REGION="global" -e ENVIRONMENT="landing-zone" validate
```
