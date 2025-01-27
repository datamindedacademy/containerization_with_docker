FROM mcr.microsoft.com/vscode/devcontainers/base:bullseye 

# This env var is used to force the 
# rebuild of the Codespaces environment when needed
ENV TRIGGER_REBUILD 1

USER root

RUN apt-get update && \
    apt-get install -y wget git tree ssh nano sudo nmap man tmux curl && \
    apt-get clean && \
    rm -rf /var/cache/apt/* && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

ENV HOME=/home/vscode
# Copy exercices content into the image
COPY --chown=vscode content/ $HOME/docker-exercises

# Set up the exercices
# Set lock permissions for exercise 6
# Copy solutions of exercises in hidden spots
RUN mkdir /bin/abstergo && \
    mkdir /bin/piper && \
    mkdir /bin/blizzard && \
    mkdir /bin/acme && \
    mkdir /bin/glados && \
    mkdir /bin/dataminded && \
    mv $HOME/docker-exercises/solutions/exercise_2 /bin/dataminded && \
    mv $HOME/docker-exercises/solutions/exercise_3 /bin/acme && \
    mv $HOME/docker-exercises/solutions/exercise_4 /bin/blizzard && \
    mv $HOME/docker-exercises/solutions/exercise_5 /bin/piper && \
    mv $HOME/docker-exercises/solutions/exercise_6 /bin/abstergo && \
    mv $HOME/docker-exercises/solutions/exercise_7 /bin/glados && \
    rm -rf $HOME/docker-exercises/solutions

USER vscode