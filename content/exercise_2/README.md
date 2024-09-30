# Data Minded Academy - Containerization with Docker
## Exercise 2 - Use existing docker images

Let's use the [`nginx Docker image`](https://hub.docker.com/_/nginx) in practice to run a simple webserver.

1. Run a container based on `nginx:1.25.5`. Search in the documentation which port the container exposes and map it to a local port. **Note:** When working in GitPod, ports are opened on the GitPod container rather than on localhost on your own computer. You can retrieve the URLs where these ports are exposed using the `gp ports list` command.

2. Check that you can access your webserver.

3. Replace the default content of the webiste with the HTML pages in the `content` folder. What happens when you change this content, while the website is running?