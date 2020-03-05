Run Folding@Home in a Docker container

Edit debconf to set your Folding@Home username and team.

    docker build -t fah .
    ./start.sh

Point a browser to http://localhost:8080/ for status.
