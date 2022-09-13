pipeline {
    agent none 
    stages {
        stage('non-parallel stage '){
            agent {
                label 'master'
            }
            steps{
                echo "this step will run first from agent master !"
            }

        }
        stage ('run Tests){
            parallel{
                stage('run on windows'){
                    agent {
                        label 'windows node'
                    }
                    steps{
                        echo "test on windows !"
                    }
                }
                stage('run on master'){
                    agent {
                        label 'master node'
                    }
                    steps{
                        echo "test on master !"
                    }
                }
            }
        }
    }
}