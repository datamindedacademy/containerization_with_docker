# Data Minded Academy - Containerization with Docker
## Exercise 4 - Write the Dockerfile of a simple Python application

In this exercise, you are asked to containerize a simple Streamlit app helping you to visualize typical 
neural network activation functions in an interactive environment.

The source code of the application is available in the subfolder `app` of the `exercise_4` folder. 

You are asked to containerize this simple application. To do so, refer to the application's `README.md`. 

1. Write the Dockerfile that will define your Docker image, build, and run it to make sure everything is working as expected.

2. Make a dummy change to the Streamlit page (`app/streamlit_app.py`) and rebuild. Were the Python
   dependencies cached? If not, fix your Dockerfile until they are.

3. What's the current size of your Docker image? Can you do something to reduce it?

4. Before you push, add `ARG SOME_SECRET` with a dummy value to your Dockerfile and rebuild.
   [Create an account on Docker Hub](https://hub.docker.com/) and push the image. Delete it locally
   and pull it back from your account. When you are done, open the repository on Docker Hub and
   inspect the layers. What do you see?