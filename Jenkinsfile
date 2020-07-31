pipeline {
  agent {label 'master'}
      tools { 
        maven 'sivamaven' 
        jdk 'java' 
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
        stage('Build Docker Image') {
             steps {
               echo 'Building Docker image'
               sh 'docker build -t test'
                }
            }
	    }
         
  }
