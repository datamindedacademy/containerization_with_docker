# Data Minded Academy - Containerization with Docker
## Exercise 3 - Interact with containers

Time to get inside a container while it is running.

We will use the `devopsdockeruh/simple-web-service:ubuntu` image. Once it is running, it writes
logs to `/usr/src/app/text.log`. Every 10 seconds the clock sends a “secret message”.

1. Run a container from `devopsdockeruh/simple-web-service:ubuntu` in detached mode. Set an
   environment variable `MY_SECRET` to a value of your choice.

2. Go inside that **running** container and
   * read the value of `MY_SECRET`
   * follow the logs with `tail -f /usr/src/app/text.log`. What is the secret message?

Then answer:

* What does the `-it` flag do? If you used it, why did you need it?
* Start a new container from the same image, but overwrite the entrypoint so you land in a shell. Try to `tail` the log again. What do you see?
