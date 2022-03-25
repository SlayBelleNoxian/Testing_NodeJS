pipeline{
	agent any

	stages{
		stage("build"){
			steps{
				docker network create testing-net;
				docker build %WORKSPACE%/Nodedocker -t testing-app;
				echo "Starting node!";
				docker run --rm --net testing-net --name nodeJS -p 3000:3000 testing-app;
			}
		}
		stage("test"){
			steps{
				echo "Testing app!!";
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
