# Data Minded Academy - Containerization with Docker
## Exercise 5 - Write the Dockerfile of a simple Spring (Java) application

In this exercise, you are asked to containerize a simple Spring (Java) application. The source code 
of the application is available in the subfolder `app` of the `exercise_5` folder. The instructions 
about how to set up the application should be straightforward and are written in the app's `README.md`.

1. Write the Dockerfile that will define your Docker image, build, and run it to make sure everything
   is working as expected. Tip: use the [`openjdk:19-jdk-slim` image](https://hub.docker.com/_/openjdk)
   as a base image. You’ve completed the exercise when you see a ‘Success’ message in your browser.

2. Make a dummy change to the page (`app/src/main/resources/templates/index.html`) and rebuild.
   Were the Maven dependencies cached? If not, fix your Dockerfile until they are.

3. Before you push, add `ARG SOME_SECRET` with a dummy value to your Dockerfile and rebuild.
   [Create an account on Docker Hub](https://hub.docker.com/) and push the image. Delete it locally
   and pull it back from your account. When you are done, open the repository on Docker Hub and
   inspect the layers. What do you see?