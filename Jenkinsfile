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
        stage('Run testing') {
            steps {
                echo 'Test are sucsesful...'
            }
        }
    }
}
