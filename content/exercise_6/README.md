# Data Minded Academy - Containerization with Docker
## Exercise 6 - Run a frontend-backend stack

In this exercise, you are asked to reproduce the frontend-backend example shown in the video content 
of the course. You will the source code of the frontend and the backend in, respectively, the 
`example-fronted` and `example-backend` subfolders of this exercise. The apps' `README.md` will guide 
you on how to set them up.

1. Write the Dockerfile of the frontend app. Build it, run it and check if you can access the frontend UI.

2. Write the Dockerfile of the backend app. Build it, run it and check if the server starts successfully.

3. Make the `Test connection to the backend` button of the frontend UI work successfully. To do so, you 
will need to set correctly the environment variables of the backend and frontend apps respectively 
(tips: refer to the note below about `localhost`).

4. Write a `docker-compose.yml` file to run your frontend and backend together instead of running 
them in different terminals. Make sure everything works as expected when you run `docker-compose up`. 

A few notes to consider:

* `localhost` isn't accessible in the GitHub Codespaces environments. Instead, GitHub Codespaces creates URLs for each service you run. You can find the URLs in the `ports` tab of the VSCode terminal. By default these URLs are private, but you can choose to make them public. 