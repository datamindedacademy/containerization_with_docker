# Data Minded Academy - Containerization with Docker
## Exercise 1 - Basics of the Docker CLI

In this exercise, you will have to use the `docker` CLI to complete a few simple operation tasks. The tasks are the following:

1. Run a container based on the `hello-world:latest` image. Name the container `my-hello-world-container`.
2. Run an interactive container based on `ubuntu:20.04`. List all files and exit the container.
3. Run three containers with the same terminal (you will need the detached mode). Each one will be based on the following ever-running images:
    * `nginx:1.21.5`
    * `ubuntu:20.04`. Change the startup command such that the container runs `sleep 1000` on startup.
    * `grafana/grafana:latest`
4. List the existing containers (running or stopped).