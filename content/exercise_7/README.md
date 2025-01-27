# Data Minded Academy - Containerization with Docker
## Exercise 7 - Your first CICD pipeline

Our goal in this final exercise is to implement a simple yet powerful CICD pipeline with GitHub Actions. 
We'll use the code of a simple Python FastAPI application contained in the `project-api` folder. 
The app code and the Dockerfile are already written for you. Your mission in this exercise will only 
be to implement the CICD pipeline. We will separate the whole CICD pipeline into two distinct sub-pipelines 
triggered by various Git events: 

* the PR (pull request) pipeline
* the master pipeline.

**The role of the PR pipeline** will be to make sure our code is passing the suite of unit tests. 
To do so, we'll also need to build the Docker image. We won't publish the Docker image at this point 
because we are still in a feature branch. It's not definitive before we merge to master.

**The role of the master pipeline** will be to build the image and push it to your GitHub repository
public image registry. This way, every time a pull request will be approved with some changes in the 
codebase, the CICD pipeline will take care of building it and pushing the new version of master 
to your own Docker registry hosted for free in GitHub.

The files defining the GitHub Actions pipelines are in the `.github` folder at the root of the 
`project-api` project. The simple existence of this folder enables Github Actions in your repository.

Sounds exciting no? Let's get started 🛠 !

-----------

1. Go to your GitHub account and create a new repository.

2. Create an SSH key in your GitHub Codespaces environment with `ssh-keygen` and link it with your GitHub account.

3. Push the content of the `project-api` folder to the newly created repository. You can do it following 
one of these two ways. Make sure you use the SSH cloning URL from Github:

    * Initialize a repository in the `project-api` folder, create the first commit then link with the remote repository and push (see Github's instructions)
    * Clone the newly-created repository, copy/paste content from the `project-api` folder to your repository folder, commit and push

4. Once pushed for the first time, head to your GitHub repository and check that a master pipeline has 
been triggered in the `Actions` panel. You just pushed to master directly so it's expected. Look at 
what this pipeline is doing (spoiler: it's useless). Find the code defining those actions in the `.github` folder of your repository.

5. As you may know, pushing to `main` directly is evil and chaotic, so head to your GitHub repository 
`Settings > Branches > Branch protection rules > Add rule` and create a rule with the following information:

    * Branch name pattern: `main`
    * Require a pull request before merging: `Ticked`
    * Untick the `Require approvals` field 
    * Do not allow bypassing the above setting: `Ticked`

6. Modify the file `.github/pr-pipeline.yml` (that defines the PR pipeline, you got it) to do the following steps:

    * Build the Docker image with:
    ```
    git_hash=$(git rev-parse --short HEAD)
    docker build . -t project-api:$git_hash
    ```

    * Test the Docker image built before with:
    ```
    git_hash=$(git rev-parse --short HEAD)
    docker run \
    --entrypoint=/bin/bash \
    project-api:$git_hash \
    ./script/test
    ```

7. Create a Pull Request and check everything is working as expected. The Actions panel should display 
a Pull Request pipeline running/completed recently and the status should be updated in the Pull Request itself. 
Once everything is okay, merge the PR. See in the Actions panel that you again triggered a master pipeline (still useless tho)

8. Now we want to make the master pipeline useful. Modify the file `.github/master-pipeline.yml` 
to do the following steps:

    * Build the Docker image with the registry name in it:
        ```
        git_hash=$(git rev-parse --short HEAD)
        docker build . -t ghcr.io/<your username>/<your repository name>/project-api:$git_hash
        ```
    * Retest your image like above. You want to retest in CD because you can never be sure
      that the result of your merge to main doesn't result in a broken state.

    * Login and push the Docker image to Github Packages:
      ```
      git_hash=$(git rev-parse --short HEAD)
      docker login https://ghcr.io --username ${{ github.actor }} --password ${{ secrets.GITHUB_TOKEN }}
      docker push ghcr.io/<your username>/<your repository name>/project-api:$git_hash
      ```
    
11. Create a pull request to merge your changes. Once green at the PR-level, merge it to main. Once done, 
head to the Actions panel and see if your master pipeline is running as expected. If yes, you should be 
able to see your image landing to your GitHub repository's image registry pretty soon!

Congratulations! You just created your first CICD pipeline 🥳 🚀!
