pipeline {
    agent any
  
    stages {
        stage('Run front-end') {
            steps {
                echo 'executing yarn'
                nodejs('Node-10.17'){
                    sh 'yarn install'
                }
            }
        }
        stage('Build') {
            steps {
                sh 'make' 
                archiveArtifacts artifacts: '**/target/*.jar', fingerprint: true 
            }
        }
        stage('Run testing') {
            agent{ 
                docker { image 'alpine' args '-u=\"root\"'}
            }
        steps {
                sh 'make check || true' 
                junit '**/target/*.xml' 
            }
            post{
                always{
                    junit '**/target/*.xml' 
                }
                success{
                    echo 'Test are sucsesful...'
                }
                failure{
                    echo 'Test are failed...'
                }
            }
        }
        stage('Deploy') {
            when {
              expression {
                currentBuild.result == null || currentBuild.result == 'SUCCESS' 
              }
            }
            steps {
                sh 'make publish'
            }
        }
    }
}
