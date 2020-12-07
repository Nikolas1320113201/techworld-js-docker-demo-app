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
        stage('Run back-end') {
            steps {
                echo 'executing gradle'
                withGradle(){
                    sh './gradlew -v'
                }
            }
        }
        stage('Run testing') {
            steps {
                echo 'Test are sucsesful...'
            }
        }
    }
}
