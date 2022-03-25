pipeline{
	agent any

	stages{
		stage("build"){
			steps{
				sh """docker network create testing-net"""
				sh """docker build %WORKSPACE%/Nodedocker -t testing-app"""
				echo "Starting node!"
				sh """docker run --rm --net testing-net --name nodeJS -p 3000:3000 testing-app"""
			}
		}
	}
}
