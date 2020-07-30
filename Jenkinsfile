pipeline {
  agent {label 'master'}
      tools { 
        maven 'maven' 
        jdk 'java8' 
    }
    
    stages {
        stage('git clone') {
            steps {
                echo 'cloning git repo'
                git 'https://github.com/siva564/automaticdeployment.git'
            }
        }
    
        stage('Build') {
            steps {
                echo 'Building..'
                sh 'mvn clean'
                sh 'mvn install'
                }  
             }
        stage('Test') {
            steps {
                echo 'Testing..'
                echo 'all test cases passed'
          }
        }
        
        stage('Deploy Artifacts') { 
             steps {
                script {			 
                     def server = Artifactory.server 'jfro' 
                     def uploadSpec = """{
                       "files": [
                            {
                              "pattern": "/var/lib/jenkins/workspace/MyTestJob/target/*.war",
                              "target": "myrepo/"
                            }
                                ]
                    }"""
	                server.upload(uploadSpec)
	            }
	          }
	        }
	        stage('Build Docker Image') {
             steps {
               echo 'Building Docker image'
               sh 'docker build -t test .'
                }
            }
	    }
         
  }
