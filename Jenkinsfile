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
            agent{ 
                docker { image 'alpine' args '-u=\"root\"'}
            }
            steps {
                sh 'install xmlrunner'
               
            }
            post{
                always{
                    junit 'test-reports/*.xml'
                }
                success{
                    echo 'Test are sucsesful...'
                }
                failure{
                    echo 'Test are failed...'
                }
            }
        }
    }
}
