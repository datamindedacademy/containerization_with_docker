---
theme: dataminded
title: Containerization with Docker
info: Using containers to package & deploy applications. Data Minded Academy.
fonts:
  serif: El Messiri
  sans: DM Sans
transition: slide-left
layout: cover
subtitle: Using containers to package & deploy applications · Data Minded Academy
---

# Containerization with <span class="dm-accent">Docker</span>

<p class="mt-6 text-lg opacity-80"><code>github.com/datamindedacademy/containerization_with_docker</code></p>

---
layout: section
---

# Let's get to know <span class="dm-accent">each other</span>

---
layout: intro
role: Data Engineer, Data Minded
---

# Moenes Ben Soussia

<p class="mt-6 text-lg opacity-80 leading-relaxed">
Started in <strong>software engineering</strong>.<br>
Now a <strong>data engineer</strong>.<br>
Docker is in the toolbox most days.
</p>


---
layout: values
---

# Now you, 30 <span class="dm-accent">seconds</span>

<template #badges>
<DmIconBadge icon="i-mdi-account-outline" label="Name" sub="Who are you?" />
<DmIconBadge icon="i-mdi-briefcase-outline" label="Background" sub="Role" tone="dark" />
<DmIconBadge icon="i-mdi-docker" label="Docker" sub="Never / some / daily" />
</template>

---
layout: agenda
label: Contents
---

# Contents

1. What are containers?
2. The Docker CLI
3. Dev containers
4. Images & registries
5. Writing Dockerfiles
6. Custom builds
7. Containerizing a web application
8. Orchestration
9. CI/CD & wrap-up

<!--
Three blocks, really: what containers are and why they help, the concepts you need to use Docker,
and hands-on practice. Exercises are spread over the whole day, roughly one per section.
-->

---
layout: section
---

# What are <span class="dm-accent">containers</span>?

---
layout: default
label: 1 · Containers
---

# It works on <span class="dm-accent">my machine</span>

<div class="meme-hero">
<img src="/intro/works-locally.gif" alt="When your code works like God's plan" />
</div>

<!--
You r dev locally, your application/script is doing all the magic that its supposed to do.
-->

---
layout: default
label: 1 · Containers
---

# All good, <span class="dm-accent">now ship it</span>🚀!

<div class="meme-hero">
<img src="/intro/other-machine.gif" alt="Ship it" />
</div>

<!--
You are your confidence peak. Lets ship to production. Nothing should break right?
-->

---
layout: default
label: 1 · Containers
---

# Famous last <span class="dm-accent">words</span>

<div class="meme-hero">
<img src="/intro/works-on-my-machine.gif" alt="Walking away from an explosion" />
</div>

<!--
You get thouands of emails and messages from users.
-->

---
layout: default
label: 1 · Containers
---

# Lost in all the <span class="dm-accent">logs</span>?

<div class="meme-hero">
<img src="/intro/error-cloud.png" alt="Word cloud of environment errors" />
</div>

<!--
ModuleNotFoundError, JAVA_HOME, PYTHONPATH, wrong numpy. None of these are the app. They are
the machine the app landed on. That is the whole problem.
-->

---
layout: default
label: 1 · Containers
---

# What physical containers are actually <span class="dm-accent">shipping</span>?!

<div class="meme-hero">
<img src="/intro/shipping-photo.jpg" alt="Stacks of shipping containers in a port" />
</div>

<!--
Step back, when you think about shipping containers, you think about physical containers. But what are they actually shipping?
-->

---
layout: default
label: 1 · Containers
---

# Same box, anywhere it <span class="dm-accent">lands</span>

<div class="meme-hero">
<img src="/intro/shipping-boxes.png" alt="A cargo ship carrying standardised shipping containers" />
</div>

<!--

-->

---
layout: default
label: 1 · Containers
---

# One box, one <span class="dm-accent">cargo</span>

<div class="meme-hero">
<img src="/intro/shipping-cargo.png" alt="Shipping containers holding different cargo in isolation" />
</div>

<!--
YOu dont ship parts of a piano, a car or a laptop. You ship the whole thing. The whole ready to use product.
-->

---
layout: default
label: 1 · Containers
---

# Same idea. For <span class="dm-accent">software</span>.

<div class="meme-hero">
<img src="/intro/docker-whale.png" alt="Docker whale carrying application stacks to any environment" />
</div>

<!--
Thats the idea. You ship the whole application, but just parts of it, including all dependencies.
-->

---
layout: default
label: 1 · Containers
---

# What is a Docker <span class="dm-accent">container</span>?

<div class="mt-4">

An artifact with **all dependencies needed to run your application**.

</div>

<DmColumns class="mt-6" :gap="16">
<DmColumn tone="plain">

- An operating system (e.g. Linux)
- With the required software installed (Python, Java, …)
- With the required packages installed (Pandas, Numpy, jar files, …)
- Containing the code required to run your application

</DmColumn>
<DmColumn tone="plain" divider>

Building an image gives you almost **full control of the execution environment**.

If the containerized application works on your computer, there is a big chance it will work in any
other environment, production server included.

</DmColumn>
</DmColumns>


---
layout: values
---

# Why containers <span class="dm-accent">win</span>

<template #badges>
<DmIconBadge icon="i-mdi-earth" label="Portability & isolation" sub="Once built, runnable everywhere. Period." />
<DmIconBadge icon="i-mdi-file-code-outline" label="Reproducibility" sub="Runtime & dependencies as code" tone="dark" />
<DmIconBadge icon="i-mdi-feather" label="Lightweight" sub="You ship what you really need" />
</template>

<!--
Reproducibility is the one data engineers feel most: the same image runs on the laptop, in CI, and
on the cluster, so a failure is a real failure and not an environment difference.
-->

---
layout: default
label: 1 · Containers
---

# Dockerfile, image, <span class="dm-accent">container</span>

<p class="mt-1 text-lg">Docker is a tool for creating and running containers.</p>

<div class="docker-flow">
  <div class="docker-flow-node">
    <img src="/intro/icon-dockerfile.svg?v=2" alt="Dockerfile" />
    <div class="docker-flow-title">Dockerfile</div>
    <div class="docker-flow-sub">A text file: OS, packages, files, the command to run.</div>
  </div>
  <div class="docker-flow-edge">
    <code>docker build<br>-t my-app .</code>
    <div class="i-mdi-arrow-right-bold docker-flow-arrow" />
  </div>
  <div class="docker-flow-node">
    <img src="/intro/icon-image.svg?v=2" alt="Docker image" />
    <div class="docker-flow-title">Image</div>
    <div class="docker-flow-sub">An immutable prototype. Built once, then shared.</div>
  </div>
  <div class="docker-flow-edge">
    <code>docker run my-app</code>
    <div class="i-mdi-arrow-right-bold docker-flow-arrow" />
  </div>
  <div class="docker-flow-node">
    <img src="/intro/icon-container.svg" alt="Docker container" />
    <div class="docker-flow-title">Container</div>
    <div class="docker-flow-sub">A running version of the image. Many from one.</div>
  </div>
</div>

<p class="docker-metaphor">
  <b>Recipe</b>
  <span class="docker-metaphor-arrow">→</span>
  <b>cake mix</b>
  <span class="docker-metaphor-arrow">→</span>
  <b>cake</b>
</p>
<p class="docker-metaphor-note">Those three words come back on every slide from here.</p>


---
layout: section
---

# Get started with <span class="dm-accent">Docker</span>

---
layout: default
label: 2 · The Docker CLI
---

# The Docker <span class="dm-accent">CLI</span>

<p class="mt-2 text-lg">Docker is most often used as a CLI. It manages local images and local containers.</p>

<DmColumns class="mt-6" :gap="16">
<DmColumn header="Manage local images" tone="navy">

```bash
docker image <subcommand> <param>
```

</DmColumn>
<DmColumn header="Manage local containers" tone="violet" divider>

```bash
docker container <subcommand> <param>
```

</DmColumn>
</DmColumns>

<DmBanner tone="authentic" icon="i-mdi-console" title="In practice the main command are omitted" class="mt-6">

- <code>docker build</code> is <code>docker image build</code>
- <code>docker run</code> is <code>docker container run</code>
- <code>docker ps</code> is <code>docker container ls</code>
</DmBanner>

<!--
You have other cli options, but for this course will just use Docker.
Podman, containerd, kaniko...
-->

---
layout: default
label: 2 · The Docker CLI
---

# Running and listing <span class="dm-accent">containers</span>

```bash {all|1-2|4-5|7-8|all}
# Run a container based on a given image
docker container run <options> <image>:<tag> <CMD overwriting>
# Short version
docker run <options> <image>:<tag>

# List the containers currently running (-a: also the stopped ones)
docker container ls -a
# Short version
docker ps -a
```

<DmColumns class="mt-6" :gap="16">
<DmColumn tone="plain">

- `--name` — set the container name
- `--detach` (`-d`) — run in the background

</DmColumn>
<DmColumn tone="plain" divider>

- `--interactive` (`-i`) — plug STDIN into the container
- `--tty` (`-t`) — open a TTY with the container

</DmColumn>
</DmColumns>

<!--
Animation: all → docker run → docker ps → all.
-->

---
layout: statement
---

# Exercise 1

<div class="ex-grid ex-grid--single">
<div class="ex-item">
<p class="ex-name">1 · docker CLI</p>
<p class="ex-desc">Basics of the Docker CLI: run your first containers, list them, stop and remove them</p>
<p class="exercise-path"><code>content/exercise_1</code></p>
</div>
</div>

---
layout: default
label: 2 · The Docker CLI
---

# Managing existing <span class="dm-accent">containers</span>

```bash {all|1-2|4-5|7-8|10-11|all}
# Stop / start an existing container
docker container stop|start <container name or id>

# Delete an existing container
docker container rm <container name or id>

# Watch the logs of an existing (and detached) container
docker container logs --follow <container name or id>

# Execute a command inside a running container
docker container exec <container name or id> <command>
```

<DmBanner tone="violet" icon="i-mdi-bug-outline" title="docker exec is your debugger" class="mt-6">
Extremely useful to debug a running Docker container: open a shell inside the running container, look at the filesystem, the environment and the logs from the inside.
</DmBanner>

<!--
Animation: all → stop/start → rm → logs → exec → all. Stay on exec for the debugger line.
-->

---
layout: default
label: 2 · The Docker CLI
---

# <span class="dm-accent">exec</span> vs. run --entrypoint

<DmColumns class="mt-4 code-compare">
<DmColumn header="docker exec — existing container" tone="violet">

```bash
docker exec -it looper-cont /bin/bash
```

- Executes a command **against a running container**
- The main purpose (`CMD`) of the container is **still running in parallel**
- Use it to inspect a live container

</DmColumn>
<DmColumn header="docker run --entrypoint — new container" tone="navy" divider>

```bash
docker run --entrypoint=/bin/bash -it looper-cont
```

- Modifies the entrypoint of a **new, to-be-deployed container**
- The main purpose (`CMD`) is **NOT running**
- Use it to poke at an image that crashes on start

</DmColumn>
</DmColumns>

---
layout: default
label: 2 · The Docker CLI
---

# Talking to your container: <span class="dm-accent">-p</span>

<DmColumns class="mt-4 run-flags" :gap="20">
<DmColumn tone="plain" class="col-w1">

<div class="host-box">
<p class="host-label">The machine running Docker (your laptop)</p>
<p class="port-pill">localhost:1994</p>
<div class="container-box mt-3">
<p class="container-label">Docker container</p>
<p class="text-sm mt-1"><code>main.py</code></p>
<p class="port-pill mt-2">port 8080</p>
</div>
</div>

</DmColumn>
<DmColumn tone="plain" divider class="col-w1">

**`--publish` (`-p`)**: map a port on the host to a port inside the container.

```bash
docker run -p <host>:<container> my-image:latest
docker run -p 1994:8080          my-image:latest
docker run -p 8080:8080          my-image:latest
```

Then open `http://localhost:1994/`.

Without `-p`, the container's port exists but nothing on your machine can reach it.

</DmColumn>
</DmColumns>

---
layout: default
label: 2 · The Docker CLI
---

# Sharing files with your container: <span class="dm-accent">-v</span>

<DmColumns class="mt-4 run-flags" :gap="20">
<DmColumn tone="plain" class="col-w1">

<div class="host-box">
<p class="host-label">The machine running Docker</p>
<p class="mount-pill">/path/to/my/config</p>
<div class="container-box mt-3">
<p class="container-label">Docker container</p>
<p class="text-sm mt-1"><code>main.py</code></p>
<p class="mount-pill mt-2">/repo/config</p>
</div>
</div>

</DmColumn>
<DmColumn tone="plain" divider class="col-w1">

**`--volume` (`-v`)**: mount an external volume inside the container.

```bash
docker run -v <host path>:<container path> \
  my-image:latest
docker run -v /path/to/my/config:/repo/config \
  my-image:latest
```

- data inside the container is temporary and deleted when the container is removed.
- Volumes are how data and files survive that.

</DmColumn>
</DmColumns>

---
layout: default
label: 2 · The Docker CLI
---

# Configuring your container: <span class="dm-accent">-e</span>

<DmColumns class="mt-4 run-flags" :gap="20">
<DmColumn tone="plain" class="col-w1">

<div class="host-box">
<p class="host-label">The machine running Docker</p>
<div class="container-box mt-3">
<p class="container-label">Docker container</p>
<p class="env-pill mt-1">ENV="PRO"</p>
<p class="env-pill mt-2">COURSES="ABC,DEF,HIJ"</p>
<p class="text-sm mt-2"><code>main.py</code> reads them from the environment</p>
</div>
</div>

</DmColumn>
<DmColumn tone="plain" divider class="col-w1">

**`--env` (`-e`)**: define environment variables inside the container.

```bash
docker run -e <name>=<value> my-image:latest
docker run -e ENV='PRO' my-image:latest
```

- `--env-file .env` when there are more than a handful

</DmColumn>
</DmColumns>

---
layout: default
label: 2 · The Docker CLI
---

# docker run, all <span class="dm-accent">together</span>

```bash
docker container run <options> <image name>:<tag> <CMD overwriting>
docker run <options> <image name>:<tag> <CMD overwriting>
```

<table class="dm-table dm-table--dense">
<tbody><tr><th style="width: 28%">Option</th><th>What it does</th></tr>
<tr><td><code>--name</code></td><td>Set the container name</td></tr>
<tr><td><code>--detach</code> / <code>-d</code></td><td>Run the container in detached mode</td></tr>
<tr><td><code>--interactive</code> / <code>-i</code></td><td>Plug STDIN inside the container</td></tr>
<tr><td><code>--tty</code> / <code>-t</code></td><td>Open a TTY with the container</td></tr>
<tr><td><code>--entrypoint</code></td><td>Overwrite the Dockerfile <code>ENTRYPOINT</code> clause</td></tr>
<tr><td><code>--publish</code> / <code>-p</code></td><td>Map a host port to a port inside the container</td></tr>
<tr><td><code>--volume</code> / <code>-v</code></td><td>Mount an external volume inside the container</td></tr>
<tr><td><code>--env</code> / <code>-e</code></td><td>Define environment variables inside the container</td></tr>
</tbody></table>

---
layout: statement
---

# Exercises 2 & 3

<div class="ex-grid">
<div class="ex-item">
<p class="ex-name">2 · webserver</p>
<p class="ex-desc">Use an existing image from a registry (nginx) and run a local webserver with port mapping</p>
<p class="exercise-path"><code>content/exercise_2</code></p>
</div>
<div class="ex-item">
<p class="ex-name">3 · interact</p>
<p class="ex-desc">Get inside a running container: <code>exec</code> vs. overwriting the entrypoint</p>
<p class="exercise-path"><code>content/exercise_3</code></p>
</div>
</div>

---
layout: section
---

# Images & <span class="dm-accent">registries</span>


---
layout: default
label: 4 · Images & registries
---

# Dockerfile, <span class="dm-accent">image</span>, container

<p class="mt-1 text-lg">Docker is a tool for creating and running containers.</p>

<div class="docker-flow">
  <div class="docker-flow-node">
    <img src="/intro/icon-dockerfile.svg?v=2" alt="Dockerfile" />
    <div class="docker-flow-title">Dockerfile</div>
    <div class="docker-flow-sub">A text file: OS, packages, files, the command to run.</div>
  </div>
  <div class="docker-flow-edge">
    <code>docker build<br>-t my-app .</code>
    <div class="i-mdi-arrow-right-bold docker-flow-arrow" />
  </div>
  <div class="docker-flow-node">
    <img src="/intro/icon-image.svg?v=2" alt="Docker image" />
    <div class="docker-flow-title">Image</div>
    <div class="docker-flow-sub">An immutable prototype. Built once, then shared.</div>
  </div>
  <div class="docker-flow-edge">
    <code>docker run my-app</code>
    <div class="i-mdi-arrow-right-bold docker-flow-arrow" />
  </div>
  <div class="docker-flow-node">
    <img src="/intro/icon-container.svg" alt="Docker container" />
    <div class="docker-flow-title">Container</div>
    <div class="docker-flow-sub">A running version of the image. Many from one.</div>
  </div>
</div>

<p class="docker-metaphor">
  <b>Recipe</b>
  <span class="docker-metaphor-arrow">→</span>
  <b>cake mix</b>
  <span class="docker-metaphor-arrow">→</span>
  <b>cake</b>
</p>
<p class="docker-metaphor-note">Those three words come back on every slide from here.</p>

---
layout: default
label: 4 · Images & registries
---

# Working with local <span class="dm-accent">images</span>

```bash {all|1-2|4-5|7-8|10-11|all}
# List all the images available locally
docker image ls                            # docker images

# Build an image from a Dockerfile
docker image build -t <image name> -f <Dockerfile name> <build context>

# Rename / re-tag an existing image
docker image tag <source>:<tag> <target>:<target tag>

# Delete an existing image
docker image rm <image id / complete name>  # docker rmi
```

<!--
Animation: all → ls → build → tag → rm → all.
-->

---
layout: default
label: 4 · Images & registries
---

# Image <span class="dm-accent">registries</span>

<p class="mt-2 text-lg">If Docker images are books, a registry is the library where those books are catalogued and stored.</p>

<DmColumns class="mt-6" :gap="16">
<DmColumn tone="plain">

- Images are **pulled from** and **pushed to** image registries
- Image versioning: images are **immutable objects**

</DmColumn>
<DmColumn tone="plain" divider>

<div class="registry-logos">
  <div class="registry-logo">
    <div class="i-mdi-aws registry-logo-icon registry-logo--aws" />
    <span>ECR</span>
  </div>
  <div class="registry-logo">
    <div class="i-mdi-microsoft-azure registry-logo-icon registry-logo--azure" />
    <span>ACR</span>
  </div>
  <div class="registry-logo">
    <div class="i-mdi-google-cloud registry-logo-icon registry-logo--gcp" />
    <span>GAR</span>
  </div>
  <div class="registry-logo">
    <div class="registry-logo-pair">
      <div class="i-mdi-github registry-logo-icon registry-logo--github" />
      <div class="i-mdi-gitlab registry-logo-icon registry-logo--gitlab" />
    </div>
    <span>GHCR / GitLab</span>
  </div>
  <div class="registry-logo">
    <div class="i-mdi-docker registry-logo-icon registry-logo--docker" />
    <span>Docker Hub</span>
  </div>
  <div class="registry-logo">
    <div class="i-mdi-server registry-logo-icon registry-logo--self" />
    <span>Self-hosted</span>
  </div>
</div>

</DmColumn>
</DmColumns>

<!--
Sharing and collaboration across teams and projects
-->

---
layout: default
label: 4 · Images & registries
---

# Pulling and <span class="dm-accent">pushing</span>

```bash {all|1-2|4-6|all}
# Pull an image from an image registry
docker image pull <registry host>/<image name>:<tag>              # docker pull

# Push a local image to a registry, to share it
# The name must include the remote registry host
docker image push <registry host>/<name>:<tag>   # docker push
```


```bash
docker tag my-app:latest \
  ghcr.io/datamindedacademy/my-app:1.2.0
docker push ghcr.io/datamindedacademy/my-app:1.2.0
```

<!--
Animation: all → pull → push → all. The example below is static.
-->

---
layout: section
---

# Writing <span class="dm-accent">Dockerfiles</span>

---
layout: default
label: 4 · Images & registries
---

# <span class="dm-accent">Dockerfile</span>, image, container

<p class="mt-1 text-lg">Docker is a tool for creating and running containers.</p>

<div class="docker-flow">
  <div class="docker-flow-node">
    <img src="/intro/icon-dockerfile.svg?v=2" alt="Dockerfile" />
    <div class="docker-flow-title">Dockerfile</div>
    <div class="docker-flow-sub">A text file: OS, packages, files, the command to run.</div>
  </div>
  <div class="docker-flow-edge">
    <code>docker build<br>-t my-app .</code>
    <div class="i-mdi-arrow-right-bold docker-flow-arrow" />
  </div>
  <div class="docker-flow-node">
    <img src="/intro/icon-image.svg?v=2" alt="Docker image" />
    <div class="docker-flow-title">Image</div>
    <div class="docker-flow-sub">An immutable prototype. Built once, then shared.</div>
  </div>
  <div class="docker-flow-edge">
    <code>docker run my-app</code>
    <div class="i-mdi-arrow-right-bold docker-flow-arrow" />
  </div>
  <div class="docker-flow-node">
    <img src="/intro/icon-container.svg" alt="Docker container" />
    <div class="docker-flow-title">Container</div>
    <div class="docker-flow-sub">A running version of the image. Many from one.</div>
  </div>
</div>

<p class="docker-metaphor">
  <b>Recipe</b>
  <span class="docker-metaphor-arrow">→</span>
  <b>cake mix</b>
  <span class="docker-metaphor-arrow">→</span>
  <b>cake</b>
</p>
<p class="docker-metaphor-note">Those three words come back on every slide from here.</p>

---
layout: default
label: 5 · Writing Dockerfiles
---

# A Dockerfile is a <span class="dm-accent">recipe</span>

<p class="mt-2 text-lg">It describes what needs to be run in order to create the desired isolated system.</p>

<DmColumns class="mt-6" :gap="16">
<DmColumn header="Can be very simple" tone="violet">

```dockerfile
FROM python:3.12-slim
COPY main.py .
CMD ["python", "main.py"]
```

</DmColumn>
<DmColumn header="…or very complex" tone="navy" divider>

<div class="complex-df-code">

```dockerfile
FROM python:3.12-slim AS builder
ARG POETRY_VERSION=1.8.3
ENV PIP_DISABLE_PIP_VERSION_CHECK=1 \
    PYTHONDONTWRITEBYTECODE=1
RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential libpq-dev curl \
    && pip install "poetry==${POETRY_VERSION}" \
    && apt-get clean && rm -rf /var/lib/apt/lists/*
WORKDIR /src
COPY pyproject.toml poetry.lock ./
RUN poetry export -f requirements.txt --output /tmp/req.txt \
    && pip install --prefix=/install -r /tmp/req.txt

FROM python:3.12-slim
RUN apt-get update && apt-get install -y --no-install-recommends \
        libpq5 tini \
    && rm -rf /var/lib/apt/lists/* \
    && useradd --create-home --uid 10001 app
COPY --from=builder /install /usr/local
WORKDIR /app
COPY src/ ./src/
COPY alembic.ini ./
USER app
EXPOSE 8000
HEALTHCHECK --interval=30s --timeout=3s \
    CMD python -c "import urllib.request; urllib.request.urlopen('http://127.0.0.1:8000/health')"
ENTRYPOINT ["tini", "--"]
CMD ["gunicorn", "src.main:app", "--bind", "0.0.0.0:8000"]
```

</div>

</DmColumn>
</DmColumns>

<DmColumns class="mt-6" :gap="16">
<DmColumn tone="plain">

A Dockerfile is made of a **succession of Docker instructions**.

</DmColumn>
<DmColumn tone="plain" divider>

A Dockerfile is **a file part of your repository**, reviewed like any other code.

</DmColumn>
</DmColumns>

---
layout: default
label: 5 · Writing Dockerfiles
---

# The five instructions you <span class="dm-accent">always</span> use

<DmColumns class="mt-4" :gap="20">
<DmColumn tone="plain" class="col-w1">

```dockerfile {1|2|3|4|5|all}
FROM python:3.12-slim
WORKDIR /app
COPY . .
RUN pip install -r requirements.txt
CMD ["python", "main.py"]
```

</DmColumn>
<DmColumn tone="plain" divider class="col-w1">

<ul>
<li><b>FROM</b> — specify a base image</li>
<li v-click="1"><b>WORKDIR</b> — running <code>cd</code> in the Docker world</li>
<li v-click="2"><b>COPY / ADD</b> — copy files inside the container</li>
<li v-click="3"><b>RUN</b> — run a command while building the image</li>
<li v-click="4"><b>CMD</b> — defines the command to run when the container is running</li>
</ul>

</DmColumn>
</DmColumns>

<p class="mt-6 text-sm opacity-70"><code>ADD</code> does the same as COPY. It just works also for remote files. </p>

<!--
Animation: FROM → WORKDIR → COPY → RUN → CMD → all. ADD is the quiet extra, same as COPY plus remote URLs.
-->

---
layout: default
label: 5 · Writing Dockerfiles
---

# Every instruction is a <span class="dm-accent">layer</span>

<div class="layer-cake">
  <span v-click="1" class="layer-cake-change">Changes here</span>
  <div v-click="2" class="layer-cake-rebuild"></div>
  <span v-click="2" class="layer-cake-rebuild-tip">Rebuild all these</span>

  <div class="layer-iso">FROM</div>
  <p class="layer-cake-def"><b>FROM</b> — specify a base image</p>

  <div class="layer-iso">WORKDIR</div>
  <p class="layer-cake-def"><b>WORKDIR</b> — running <code>cd</code> in the Docker world</p>

  <div class="layer-iso" :class="{ 'layer-iso--focus': $clicks >= 1 }">COPY</div>
  <p class="layer-cake-def"><b>COPY / ADD</b> — copy files inside the container</p>

  <div class="layer-iso">RUN</div>
  <p class="layer-cake-def"><b>RUN</b> — run a command while building the image</p>

  <div class="layer-iso">CMD</div>
  <p class="layer-cake-def"><b>CMD</b> — the command run when the container runs</p>
</div>

<!--
Animation: stack only → Changes here on COPY → Rebuild all these down to CMD.
Read it like a Dockerfile: FROM on top. Change COPY, and every instruction below it is rebuilt.
-->

---
layout: default
label: 5 · Writing Dockerfiles
---

# What might be <span class="dm-accent">wrong</span>?

<DmColumns class="mt-4" :gap="24">
<DmColumn tone="plain" class="col-w1">

<div v-click.hide="3" class="layer-stack layer-stack--alpine">
<div class="layer"><span>FROM alpine:3.4</span></div>
<div class="layer" :class="{ 'layer--changed': $clicks >= 1 }"><span>COPY app.py /src/app</span></div>
<div class="layer" :class="{ 'layer--dirty': $clicks >= 1 }"><span>RUN apk update</span></div>
<div class="layer" :class="{ 'layer--dirty': $clicks >= 1 }"><span>RUN apk add curl</span></div>
<div class="layer" :class="{ 'layer--dirty': $clicks >= 1 }"><span>RUN apk add vim</span></div>
<div class="layer" :class="{ 'layer--dirty': $clicks >= 1 }"><span>RUN apk add git</span></div>
</div>

<div v-click="3" class="layer-stack layer-stack--alpine">
<div class="layer"><span>FROM alpine:3.4</span></div>
<div class="layer layer--merged"><span>RUN apk update && apk add …</span></div>
<div class="layer"><span>COPY app.py /src/app</span></div>
</div>

</DmColumn>
<DmColumn tone="plain" divider class="col-w1">

<div v-click.hide="3">

```dockerfile {all|2|3-6}
FROM alpine:3.4
COPY app.py /src/app
RUN apk update
RUN apk add curl
RUN apk add vim
RUN apk add git
```

</div>

<div v-click="3">

```dockerfile
FROM alpine:3.4
RUN apk update && \
    apk add curl vim git
COPY app.py /src/app
```

</div>

<div v-click.hide="3">
<p v-click="1" class="layer-note">
<b>COPY</b> sits too early. Edit <code>app.py</code> and every <code>RUN</code> above it is rebuilt.
</p>
<p v-click="2" class="layer-note">
Four <code>RUN</code> layers for packages that could be <b>one</b> layer.
</p>
</div>
<p v-click="3" class="layer-note">
Packages in one cached layer. <code>COPY</code> last, so editing the app does not reinstall them.
</p>

</DmColumn>
</DmColumns>

<!--
Animation: ask first → COPY too early → four RUN layers → merged RUN and COPY last.
Two answers: COPY before the packages busts the cache, and four RUN layers where one would do.
-->

---
layout: default
label: 5 · Writing Dockerfiles
---

# Better usage of the <span class="dm-accent">cache</span>

<DmColumns class="mt-4 code-compare">
<DmColumn header="Slow: COPY first, one RUN per package" tone="navy">

```dockerfile
FROM alpine:3.4
COPY app.py /src/app
RUN apk update
RUN apk add curl
RUN apk add vim
RUN apk add git
```

Any change in the code copied in the `COPY` step will lead to **re-installing everything** from the
`RUN` steps.

</DmColumn>
<DmColumn header="Better usage of the cache and layers" tone="violet" divider>

```dockerfile
FROM alpine:3.4
RUN apk update && \
    apk add curl vim git
COPY app.py /src/app
```

Packages land in one cached layer. `COPY` comes last, so editing `app.py` does not rebuild them.

</DmColumn>
</DmColumns>

<!--
Check the output of docker build: it prints CACHED in front of every reused layer.
-->
---
layout: section
---

# Dockerfile <span class="dm-accent">example</span>

---
layout: default
label: 5 · Writing Dockerfiles
---

# A first <span class="dm-accent">Dockerfile</span>

<div class="df-full-code">

```dockerfile
FROM ubuntu:18.04

RUN useradd -ms /bin/bash python-api

RUN apt update && \
    apt install software-properties-common --yes && \
    add-apt-repository ppa:deadsnakes/ppa --yes && \
    apt install python3-pip --yes

USER python-api
WORKDIR /repo
COPY . /repo
RUN python3 -m pip install -r requirements.txt

EXPOSE 8080
ENTRYPOINT ["python3"]
CMD ["main.py"]
```

</div>

<p class="layer-ask">What do you think?</p>

<!--
Ask first. Heavy base, we install Python ourselves, and COPY . before pip so every
code change reinstalls the requirements.
-->

---
layout: default
label: 5 · Writing Dockerfiles
---

# A smaller image, a better <span class="dm-accent">cache</span>

<div class="df-size-row">
  <span class="df-size df-size--big">ubuntu · 495MB</span>
  <span class="df-size-arrow">→</span>
  <span class="df-size df-size--small">python:3.12-slim · 235MB</span>
</div>

<div class="df-full-code">

```dockerfile
FROM python:3.12-slim

WORKDIR /repo
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .

EXPOSE 8080
ENTRYPOINT ["python"]
CMD ["main.py"]
```

</div>

<p class="layer-note mt-3">
Small Python base, so we do not install the language. Requirements first, project files after:
edit the app, and <code>pip install</code> stays cached.
</p>

<!--
Same three files. Slim already has Python. COPY requirements.txt then pip, then COPY the
project. That is the inverse of the previous slide, and about half the image.
-->

---
layout: default
label: 5 · Writing Dockerfiles
---

# Dockerfile <span class="dm-accent">instructions</span>: the full picture

<DmColumns class="mt-4" :gap="24">
<DmColumn tone="plain" class="col-w1">

<div class="layer-stack">
<div class="layer"><span>FROM</span></div>
<div class="layer"><span>WORKDIR</span></div>
<div class="layer"><span>COPY</span></div>
<div class="layer"><span>RUN</span></div>
<div class="layer"><span>CMD</span></div>
</div>

</DmColumn>
<DmColumn tone="plain" divider class="col-w1">

| Instruction | What it does |
| --- | --- |
| `FROM` | Specify a base image |
| `WORKDIR` | Running `cd` in the Docker world |
| `COPY` / `ADD` | Copy files inside the container |
| `RUN` | Run a command while building the image |
| `CMD` | The command run when the container runs |
| `ENTRYPOINT` | The executable that runs the `CMD` |
| `EXPOSE` | Declare the port used by the container |
| `USER` | Change the terminal to an existing user |

</DmColumn>
</DmColumns>

<p class="mt-4 text-center">Design your layers wisely, for speed and for image size.</p>

---
layout: statement
---

# Exercises 4 & 5

<div class="ex-grid">
<div class="ex-item">
<p class="ex-name">4 · streamlit</p>
<p class="ex-desc">Write the Dockerfile of a simple Python application and serve it over a published port</p>
<p class="exercise-path"><code>content/exercise_4</code></p>
</div>
<div class="ex-item">
<p class="ex-name">5 · spring</p>
<p class="ex-desc">Write the Dockerfile of a simple Spring (Java) application: build step, jar, runtime</p>
<p class="exercise-path"><code>content/exercise_5</code></p>
</div>
</div>

---
layout: section
---

# Custom <span class="dm-accent">builds</span>

---
layout: default
label: 6 · Custom builds
---

# Build <span class="dm-accent">arguments</span>

<p class="mt-2">With <code>-e</code>, environment variables can be made available to <b>running</b> containers. But what if external variables are required at <b>build</b> time?</p>

<DmColumns class="mt-6" :gap="20">
<DmColumn tone="plain" class="col-w1">

```dockerfile
ARG PYTHON_VERSION=3.12
FROM python:${PYTHON_VERSION}-slim
```

```bash
docker build --build-arg="PYTHON_VERSION=3.11" .
```

</DmColumn>
<DmColumn tone="plain" divider class="col-w1">

**When to use**: when you want to create different versions of your container from one Dockerfile.

<DmBanner tone="navy" icon="i-mdi-alert-outline" title="Do not use for secrets" class="mt-4"></DmBanner>

</DmColumn>
</DmColumns>

---
layout: default
label: 6 · Custom builds
---

# Build <span class="dm-accent">secrets</span>

<p class="mt-2">Secrets required at build time are exposed through a mount that never lands in a layer.</p>

<DmColumns class="mt-4" :gap="20">
<DmColumn tone="plain" class="col-w1">

```dockerfile
RUN --mount=type=secret,id=pip_token \
    PIP_TOKEN=$(cat /run/secrets/pip_token) \
    pip install --index-url \
      https://$PIP_TOKEN@private.repo/simple my-lib
```

```bash
docker build \
  --secret id=pip_token,env=PIP_TOKEN .
```

</DmColumn>
<DmColumn tone="plain" divider class="col-w1">

- The secret is written to a **file** that is mounted only while that step runs
- It has to be mounted in **every step** that needs it
- Nothing about it is stored in the resulting image

</DmColumn>
</DmColumns>

---
layout: default
label: 6 · Custom builds
---

# Multi-stage <span class="dm-accent">images</span>

<DmColumns class="mt-4" :gap="20">
<DmColumn tone="plain" class="col-w1">

```dockerfile
FROM python:3.12 AS builder
RUN pip install poetry
COPY pyproject.toml poetry.lock ./
RUN poetry export -o requirements.txt \
 && pip install --prefix=/install \
      -r requirements.txt

FROM python:3.12-slim
COPY --from=builder /install /usr/local
COPY src/ /app
CMD ["python", "/app/main.py"]
```

</DmColumn>
<DmColumn tone="plain" divider class="col-w1">

**The problem**: I use Poetry for local package management, so I want to install packages with
Poetry — but Poetry itself should not be in the final image.

**The solution**:

1. Install the packages using an image that includes Poetry
2. Start a clean stage and copy the installed packages from the first one

`docker build` builds the **last stage** found in the Dockerfile. To stop earlier:
`docker build --target builder .`

</DmColumn>
</DmColumns>

<!--
Build tools not needed during runtime
-->

---
layout: section
---

# Containerize a web <span class="dm-accent">application</span>

---
layout: default
label: 7 · Web application
---

<div class="app-arch-wrap">
<div class="app-arch app-arch--lg">
  <div class="app-arch-users">
    <img src="/intro/webapp/users.png" alt="" />
    <p>Users in a browser</p>
  </div>
  <div class="app-arch-brace" aria-hidden="true">{</div>
  <div class="app-arch-stack">
    <div class="app-arch-row">
      <div class="app-arch-dbl"></div>
      <div class="app-arch-svc">
        <div class="app-arch-logos">
          <img src="/intro/webapp/docker.png" alt="Docker" />
          <img src="/intro/webapp/nodejs.png" alt="Node.js" />
        </div>
        <img class="app-arch-icon" src="/intro/webapp/frontend.png" alt="" />
        <p>Frontend</p>
      </div>
    </div>
    <div class="app-arch-row">
      <div class="app-arch-dbl"></div>
      <div class="app-arch-svc">
        <div class="app-arch-logos">
          <img src="/intro/webapp/docker.png" alt="Docker" />
          <img src="/intro/webapp/go.svg" alt="Go" />
        </div>
        <img class="app-arch-icon" src="/intro/webapp/backend.png" alt="" />
        <p>Backend</p>
      </div>
      <div class="app-arch-dbl"></div>
      <div class="app-arch-svc">
        <div class="app-arch-logos">
          <img src="/intro/webapp/docker.png" alt="Docker" />
          <img src="/intro/webapp/postgres.png" alt="PostgreSQL" />
        </div>
        <img class="app-arch-icon" src="/intro/webapp/database.png" alt="" />
        <p>Database</p>
      </div>
    </div>
  </div>
</div>
</div>

---
layout: default
label: 7 · Web application
---

# One service = one <span class="dm-accent">container</span>

<div class="one-svc-reasons">
  <div>
    <img src="/intro/webapp/scale.png" alt="" />
    <p>Scaling<br>&amp; efficiency</p>
  </div>
  <div>
    <img src="/intro/webapp/reuse.png" alt="" />
    <p>Re-usability<br>&amp; modularity</p>
  </div>
  <div>
    <img src="/intro/webapp/isolate.png" alt="" />
    <p>Isolation<br>&amp; security</p>
  </div>
  <div>
    <img src="/intro/webapp/build.png" alt="" />
    <p>Easier<br>to build</p>
  </div>
</div>

<div class="app-arch-wrap app-arch-wrap--compact">
<div class="app-arch">
  <div class="app-arch-users">
    <img src="/intro/webapp/users.png" alt="" />
    <p>Users in a browser</p>
  </div>
  <div class="app-arch-brace" aria-hidden="true">{</div>
  <div class="app-arch-stack">
    <div class="app-arch-row">
      <div class="app-arch-dbl"></div>
      <div class="app-arch-svc">
        <div class="app-arch-logos">
          <img src="/intro/webapp/docker.png" alt="Docker" />
          <img src="/intro/webapp/nodejs.png" alt="Node.js" />
        </div>
        <img class="app-arch-icon" src="/intro/webapp/frontend.png" alt="" />
        <p>Frontend</p>
      </div>
    </div>
    <div class="app-arch-row">
      <div class="app-arch-dbl"></div>
      <div class="app-arch-svc">
        <div class="app-arch-logos">
          <img src="/intro/webapp/docker.png" alt="Docker" />
          <img src="/intro/webapp/go.svg" alt="Go" />
        </div>
        <img class="app-arch-icon" src="/intro/webapp/backend.png" alt="" />
        <p>Backend</p>
      </div>
      <div class="app-arch-dbl"></div>
      <div class="app-arch-svc">
        <div class="app-arch-logos">
          <img src="/intro/webapp/docker.png" alt="Docker" />
          <img src="/intro/webapp/postgres.png" alt="PostgreSQL" />
        </div>
        <img class="app-arch-icon" src="/intro/webapp/database.png" alt="" />
        <p>Database</p>
      </div>
    </div>
  </div>
</div>
</div>

<!--
Each box is its own container. Scale the busy one, swap one, contain a blast, write a small
Dockerfile. The next slide is what it looks like to run that by hand.
-->

---
layout: default
label: 7 · Web application
---

# Three containers, by <span class="dm-accent">hand</span>

```bash
docker network create app-net
docker run -d --name db   --network app-net -e POSTGRES_PASSWORD=... postgres:16
docker run -d --name api  --network app-net -e DB_HOST=db -p 8000:8000 my-backend
docker run -d --name web  --network app-net -e API_URL=http://api:8000 -p 3000:3000 my-frontend
```

<DmBanner tone="authentic" icon="i-mdi-emoticon-confused-outline" title="This starts getting tedious…" class="mt-6">
…even if we can run in detached mode. Four commands, in the right order, every time, on every
machine, on every deployment.
</DmBanner>

---
layout: section
---

# Introduce the <span class="dm-accent">orchestration</span>!

---
layout: quote
---

# "Container orchestration is the automation of much of the operational effort required to run containerized workloads: <span class="dm-accent">provisioning, deployment, scaling, networking</span> and load balancing."

---
layout: default
label: 8 · Orchestration
---

# The orchestration <span class="dm-accent">ladder</span>

<p class="mt-2">Different orchestration tools exist in the Docker ecosystem. They differ mainly by their complexity and feature richness.</p>

<div class="ladder">
<div class="ladder-step ladder-step--1">
<h3>Docker Compose</h3>
<p>Single-host based, and not made for production. The developer's tool: one YAML file, one command.</p>
</div>
<div class="ladder-step ladder-step--2">
<h3>Docker Swarm</h3>
<p>Cluster-based. Docker's own scheduler across several machines; largely superseded in practice.</p>
</div>
<div class="ladder-step ladder-step--3">
<h3>Kubernetes (K8s)</h3>
<p>Cluster-based, or serverless. The industry default, and its contenders.</p>
</div>
</div>

<p class="ladder-axis">→ feature richness · production readiness · scalability potential</p>

---
layout: default
label: 8 · Orchestration
---

# Three runs, one <span class="dm-accent">file</span>

<DmColumns class="compose-map" :gap="16">
<DmColumn tone="plain" class="col-w1">

```bash
docker run -it \
  -p 3000:3000 \
  -e BACKEND_URL=http://localhost:8080 \
  hello_frontend
```

```bash
docker run \
  -p 8080:8080 \
  -e REQUEST_ORIGIN=http://localhost:3000 \
  -e POSTGRES_HOST=host.docker.internal \
  -e POSTGRES_USER=frontend_backend \
  -e POSTGRES_PASSWORD=helloworld1234 \
  hello_backend
```

```bash
docker run \
  -p 5432:5432 \
  -e POSTGRES_USER=frontend_backend \
  -e POSTGRES_PASSWORD=helloworld1234 \
  postgres:13.2-alpine
```

</DmColumn>
<DmColumn header="docker-compose.yaml" tone="violet" divider class="col-w1">

```yaml
services:
  frontend:
    image: hello_frontend:latest
    ports:
      - "3000:3000"
    environment:
      - BACKEND_URL=http://localhost:8080
  backend:
    image: hello_backend:latest
    ports:
      - "8080:8080"
    environment:
      - REQUEST_ORIGIN=http://localhost:3000
      - POSTGRES_HOST=db
      - POSTGRES_USER=frontend_backend
      - POSTGRES_PASSWORD=helloworld1234
  db:
    image: postgres:13.2-alpine
    ports:
      - "5432:5432"
    environment:
      - POSTGRES_USER=frontend_backend
      - POSTGRES_PASSWORD=helloworld1234
```

</DmColumn>
</DmColumns>

<!--
Same three containers. Compose gives you the network: POSTGRES_HOST is db, the service
name, not host.docker.internal. Point at that line.
-->

---
layout: default
label: 8 · Orchestration
---

# docker-compose.yaml, <span class="dm-accent">step by step</span>

<div class="tight-code">

```yaml {all|1|3-8|10-16|18-22|24-25|all}
services:

  database:
    image: postgres:16
    environment:
      - POSTGRES_PASSWORD=${POSTGRES_PASSWORD}
    volumes:
      - pgdata:/var/lib/postgresql/data

  backend:
    build: ./example-backend
    depends_on: [database]
    environment:
      - DB_HOST=database
    ports:
      - "8000:8000"

  frontend:
    build: ./example-frontend
    depends_on: [backend]
    ports:
      - "3000:3000"

volumes:
  pgdata:
```

</div>

<!--
Animation: all → services → database → backend → frontend → volumes → all.
Compose can build an image from a Dockerfile as well as pull one.
-->

---
layout: default
label: 8 · Orchestration
---

# Running the whole <span class="dm-accent">stack</span>

<DmColumns class="mt-4" :gap="20">
<DmColumn tone="plain" class="col-w1">

```bash
docker compose up -d      # start everything
docker compose logs -f    # follow all logs
docker compose ps         # what is running
docker compose down -v    # stop and clean volumes
```

</DmColumn>
<DmColumn tone="plain" divider class="col-w1">

- Services reach each other **by service name**: the backend connects to `database`slid.
- `build:` builds from a Dockerfile, `image:` pulls from a registry

</DmColumn>
</DmColumns>

<DmBanner tone="navy" icon="i-mdi-alert-outline" title="Never hard-code a password in the YAML" class="mt-6">
Use environment variables from the host system instead:
<code>- POSTGRES_PASSWORD=${POSTGRES_PASSWORD}</code>, read from your shell or a
<code>.env</code> file that is git-ignored.
</DmBanner>

---
layout: default
label: 8 · Orchestration
---

# Compose while <span class="dm-accent">developing</span>

<DmColumns class="mt-4" :gap="20">
<DmColumn tone="plain" class="col-w1">

```yaml
  frontend:
    build: ./example-frontend
    volumes:
      - ./example-frontend/src:/app/src
    command: npm run dev
    ports:
      - "3000:3000"
```

</DmColumn>
<DmColumn tone="plain" divider class="col-w1">

When you are working **on** the frontend, mount your source into its container and run the dev
server: edit locally, the container reloads.

The other services keep running as built images, so you develop one service against a realistic
version of all the others.

</DmColumn>
</DmColumns>

---
layout: statement
---

# Exercise 6

<div class="ex-grid ex-grid--single">
<div class="ex-item">
<p class="ex-name">6 · compose</p>
<p class="ex-desc">Run a frontend-backend stack: write the Compose file that wires the services together</p>
<p class="exercise-path"><code>content/exercise_6</code></p>
</div>
</div>

---
layout: section
---

# DevOps in practice: <span class="dm-accent">CI/CD</span>

---
layout: default
label: 9 · CI/CD
---

# The DevOps <span class="dm-accent">loop</span>

<div class="cicd-flow">
  <div class="cicd-bracket cicd-bracket--ci">Continuous integration (CI)</div>
  <div class="cicd-bracket cicd-bracket--cd">Continuous delivery (CD)</div>
  <div class="cicd-org cicd-org--company">
    <img src="/intro/devops/company.png" alt="" />
    Company
  </div>
  <div class="cicd-step cicd-step--build">Build</div>
  <div class="cicd-step cicd-step--test">Test</div>
  <div class="cicd-step cicd-step--release">Release</div>
  <div class="cicd-org cicd-org--customers">
    <img src="/intro/devops/customers.png" alt="" />
    Customers
  </div>
  <div class="cicd-step cicd-step--plan">Plan</div>
  <div class="cicd-step cicd-step--monitor">Monitor</div>
</div>

<img class="cicd-infinity" src="/intro/devops/infinity.png" alt="Dev and Ops infinity loop: plan, code, build, test, release, deploy, operate, monitor" />

---
layout: default
label: 9 · CI/CD
---

# The DevOps <span class="dm-accent">loop</span>

<div class="cicd-flow">
  <div class="cicd-bracket cicd-bracket--ci">Continuous integration (CI)</div>
  <div class="cicd-bracket cicd-bracket--cd cicd-dim">Continuous delivery (CD)</div>
  <div class="cicd-org cicd-org--company">
    <img src="/intro/devops/company.png" alt="" />
    Company
  </div>
  <div class="cicd-step cicd-step--build">Build</div>
  <div class="cicd-step cicd-step--test">Test</div>
  <div class="cicd-step cicd-step--release cicd-dim">Release</div>
  <div class="cicd-org cicd-org--customers cicd-dim">
    <img src="/intro/devops/customers.png" alt="" />
    Customers
  </div>
  <div class="cicd-step cicd-step--plan cicd-dim">Plan</div>
  <div class="cicd-step cicd-step--monitor cicd-dim">Monitor</div>
</div>

<img class="cicd-infinity" src="/intro/devops/infinity.png" alt="Dev and Ops infinity loop" />

<!--
Today we stay on the Dev side: build and test the image on every change. Release is the next
course. Same image the developers used, same image the tests used.
-->

---
layout: default
label: 9 · CI/CD
---

<img class="gha-logo" src="/intro/devops/actions-logo.png" alt="GitHub Actions" />

<img class="gha-shot" src="/intro/devops/actions-run.jpg" alt="Successful Master CICD Pipeline: checkout, build the Docker image, test the Docker image, login and push" />

<!--
Walk the job: checkout, build the image, test that image, then login and push. That is exercise 7.
-->

---
layout: default
label: 9 · CI/CD
---

# Adapt when the job is <span class="dm-accent">run</span>

<DmColumns class="gha-code mt-2" :gap="16">
<DmColumn header="Master CICD Pipeline" tone="navy">

```yaml {all|2-4|all}
name: Master CICD Pipeline
on:
  push:
    branches: [main]
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Build the Docker image
        run: |
          git_hash=$(git rev-parse --short HEAD)
          docker build . -t ghcr.io/$USER/project-api:$git_hash
      - name: Test the Docker image
        run: |
          docker run --entrypoint=/bin/bash \
            ghcr.io/$USER/project-api:$git_hash \
            ./script/test
      - name: Login and push
        run: |
          docker login ghcr.io -u ${{ github.actor }} \
            -p ${{ secrets.GITHUB_TOKEN }}
          docker push ghcr.io/$USER/project-api:$git_hash
```

</DmColumn>
<DmColumn header="./script/test" tone="violet" divider>

```bash
#!/bin/bash
set -e
cd "$(dirname "$0")/.."
python -m pip install -r .ci/requirements.txt
python -m pip install -r requirements.txt
flake8 app/
pytest
```

</DmColumn>
</DmColumns>

<p class="layer-note">
<b>on:</b> change when the job runs, a PR update, a merge to main, a tag. Tests run <b>inside</b> the
image you just built, not on the runner's Python.
</p>

<!--
Animation: all → the on: trigger → all.
Adapt to change when the CI job is run. The test step is docker run of the image, then flake8 and pytest.
-->

---
layout: statement
---

# Exercise 7

<div class="ex-grid ex-grid--single">
<div class="ex-item">
<p class="ex-name">7 · CI/CD</p>
<p class="ex-desc">Implement a CI/CD pipeline with GitHub Actions and publish the image to the GitHub container registry</p>
<p class="exercise-path"><code>content/exercise_7</code></p>
</div>
</div>

---
layout: section
---

# <span class="dm-accent">Conclusion</span>

---
layout: default
label: 10 · Wrap-up
---

# What we <span class="dm-accent">learned</span>

<p class="mt-2 text-lg">How to work with containers, and how they change the way we approach application development and deployment.</p>

<DmSteps dir="vertical" class="mt-6">
<DmStep :n="1" label="Containers & Docker">

What a container is, how it differs from a VM, and the Dockerfile → image → container triad.

</DmStep>
<DmStep :n="2" label="Docker in practice">

The CLI, ports, volumes and environment variables, writing Dockerfiles, layers and caching, build
args, secrets and multi-stage builds.

</DmStep>
<DmStep :n="3" label="Orchestration & CI/CD">

A first contact with orchestration concepts and with pipelines that build and publish your images.

</DmStep>
</DmSteps>

---
layout: thanks
---

# See you soon for more <span class="dm-accent">adventures</span>!

---
layout: section
---

# <span class="dm-accent">Cheatsheets</span>

---
layout: default
label: Cheatsheet
---

# <span class="dm-accent">docker container</span>

<div class="cheat-grid">
<div class="cheat-item"><b>List running containers (-a: all)</b><code>docker container ls -a  ·  docker ps -a</code></div>
<div class="cheat-item"><b>Run a container from an image</b><code>docker container run &lt;options&gt; &lt;image&gt;:&lt;tag&gt; &lt;CMD&gt;</code></div>
<div class="cheat-item"><b>Stop / start a container</b><code>docker container stop|start &lt;name or id&gt;</code></div>
<div class="cheat-item"><b>Delete a container</b><code>docker container rm &lt;name or id&gt;</code></div>
<div class="cheat-item"><b>Follow the logs</b><code>docker container logs --follow &lt;name or id&gt;</code></div>
<div class="cheat-item"><b>Run a command inside a container</b><code>docker container exec -it &lt;name or id&gt; /bin/bash</code></div>
</div>

<table class="dm-table dm-table--dense mt-4">
<tbody><tr><th style="width: 26%">Option</th><th>What it does</th></tr>
<tr><td><code>--name</code> · <code>-d</code></td><td>Set the container name · run detached</td></tr>
<tr><td><code>-i</code> · <code>-t</code></td><td>Plug STDIN into the container · open a TTY</td></tr>
<tr><td><code>--entrypoint</code></td><td>Overwrite the Dockerfile <code>ENTRYPOINT</code> clause</td></tr>
<tr><td><code>-p</code> · <code>-v</code> · <code>-e</code></td><td>Publish a port · mount a volume · set an environment variable</td></tr>
</tbody></table>

---
layout: default
label: Cheatsheet
---

# <span class="dm-accent">docker image</span>

<div class="cheat-grid">
<div class="cheat-item"><b>List local images</b><code>docker image ls  ·  docker images</code></div>
<div class="cheat-item"><b>Build an image from a Dockerfile</b><code>docker image build -t &lt;name&gt; -f &lt;Dockerfile&gt; .</code></div>
<div class="cheat-item"><b>Rename / re-tag an image</b><code>docker image tag &lt;source&gt;:&lt;tag&gt; &lt;target&gt;:&lt;tag&gt;</code></div>
<div class="cheat-item"><b>Delete an image</b><code>docker image rm &lt;id or name&gt;  ·  docker rmi</code></div>
<div class="cheat-item"><b>Pull an image from a registry</b><code>docker image pull &lt;name&gt;  ·  docker pull</code></div>
<div class="cheat-item"><b>Push an image to a registry</b><code>docker image push &lt;registry&gt;/&lt;name&gt;:&lt;tag&gt;</code></div>
<div class="cheat-item"><b>Inspect how an image was built</b><code>docker image history &lt;name&gt;:&lt;tag&gt;</code></div>
<div class="cheat-item"><b>Reclaim disk space</b><code>docker system prune -a</code></div>
</div>

<table class="dm-table dm-table--dense mt-4">
<tbody><tr><th style="width: 26%">Build option</th><th>What it does</th></tr>
<tr><td><code>-t</code> · <code>-f</code></td><td>Name and tag the image · point at a Dockerfile</td></tr>
<tr><td><code>--build-arg</code></td><td>Pass an <code>ARG</code> into the build (never a secret)</td></tr>
<tr><td><code>--secret</code></td><td>Mount a secret for one build step only</td></tr>
<tr><td><code>--target</code></td><td>Stop at a named stage of a multi-stage build</td></tr>
</tbody></table>

---
layout: default
label: Cheatsheet
---

# <span class="dm-accent">Dockerfile</span> instructions

<DmColumns class="mt-4" :gap="24">
<DmColumn tone="plain" class="col-w1">

```dockerfile
FROM python:3.12-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY src/ .
EXPOSE 8080
USER appuser
ENTRYPOINT ["python"]
CMD ["main.py"]
```

</DmColumn>
<DmColumn tone="plain" divider class="col-w1">

| Instruction | What it does |
| --- | --- |
| `FROM` | Specify a base image |
| `WORKDIR` | Running `cd` in the Docker world |
| `COPY` / `ADD` | Copy files inside the container |
| `RUN` | Run a command while building the image |
| `CMD` | The command run when the container runs |
| `ENTRYPOINT` | The executable that runs the `CMD` |
| `EXPOSE` | Declare the port used by the container |
| `USER` | Change the terminal to an existing user |
| `ARG` | A variable available at build time |

</DmColumn>
</DmColumns>
