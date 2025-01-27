# Data Minded Academy - Containerization with Docker
## Exercise 2 - Use existing docker images

Let's use the [`nginx Docker image`](https://hub.docker.com/_/nginx) in practice to run a simple web server.

1. Run a container based on `nginx:1.25.5`. Search in the documentation which port the container exposes and map it to a local port. **Note:** When working in GitHub Codespaces, ports are opened on the GitHub container rather than on localhost on your own computer. You can find the open ports the `ports` tab of the VSCode terminal.

2. Check that you can access your web server.

3. Replace the default content of the website with the HTML pages in the `content` folder. What happens when you change this content, while the website is running?