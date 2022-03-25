pipeline{
	agent any

	stages{
		stage("build"){
			steps{
				docker network create testing-net;
				docker build ./Nodedocker -t testing-app;
				echo "Starting node!";
				docker run --rm --net testing-net --name nodeJS -p 3000:3000 testing-app;
			}
		}
		stage("test"){
			steps{
				echo "Testing app!!";
				docker run --rm --net testing-net -v ./Testes/reports:/opt/robotframework/reports:Z -v ./Testes/test:/opt/robotframework/tests:Z -e BROWSER=chrome ppodgorsek/robot-framework:latest;
			}
		}
		stage("deploy"){
			steps{
				echo "Stopping containers!";
				docker stop nodeJS;
			}
		}
	}
}
