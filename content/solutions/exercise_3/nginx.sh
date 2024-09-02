#!/bin/bash
# Run the container and expose port 80
docker run -p 80:80 nginx:1.25.5

# find the port where the website is running
gp url 80

# Mount the content folder 
docker -v /content:/usr/share/nginx/html:ro -p 80:80 nginx:1.25.5