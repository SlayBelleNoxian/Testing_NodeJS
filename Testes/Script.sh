#!/bin/bash
docker run --rm --net testing-net -v ${PWD}/reports:/opt/robotframework/reports:Z -v ${PWD}/test:/opt/robotframework/tests:Z -e BROWSER=chrome ppodgorsek/robot-framework:latest
