#!/bin/bash
docker network create testing-net
docker build ./Nodedocker -t testing-app
echo "Starting node!"
docker run --rm --net testing-net --name nodeJS -p 3000:3000 testing-app& 

sleep 10; docker run --rm --net testing-net -v ${PWD}/Testes/reports:/opt/robotframework/reports:Z -v ${PWD}/Testes/test:/opt/robotframework/tests:Z -e BROWSER=chrome ppodgorsek/robot-framework:latest
echo "Showing logs!"; python3 -m webbrowser Testes/reports/log.html

docker stop nodeJS
