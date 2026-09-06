# Data Minded Academy - Containerization with Docker
## Exercise 2 - Use existing docker images

Let's use the [`nginx` Docker image](https://hub.docker.com/_/nginx) to run a simple web server.

1. Run a container based on `nginx:1.25.5`. Search the image documentation for the port it exposes, and map it to a port on your machine with `-p`.

   **Codespaces:** published ports appear on the GitHub container, not on localhost on your laptop. Open the **Ports** tab in the VS Code terminal to reach the site.

2. Open the site. You should see the default nginx welcome page.

3. Stop that container. Run nginx again, this time mounting the `content` folder of this exercise over the html directory inside the container. Search the documentation for the path nginx serves from.

4. Confirm the site now shows the HTML from `content`. Then edit `content/index.html` while the container is still running.

Then answer:

* Stop the container and start nginx again without `-v`. Why is the default welcome page back?
* You changed the HTML and the site updated. Why? What would happen if that file had been copied into the image instead of mounted?
