pipeline{
    agent any
    environment{
        IMAGE_TAG = 'pipeline-project'
        VERSION = 'v1.0'
        USER_ID =  'venkatsai0779'
    }
    stages{
        stage('pull repo'){
            steps{
                git branch: 'main', changelog: false, poll: false, url: 'https://github.com/venkat-0-7/jenkins-pipeline.git'
            }
        }
        stage('build code'){
            steps{
                sh 'mvn clean package'
            }
        }
        stage('build & push image'){
            steps{
                withCredentials([usernamePassword(credentialsId: 'docker-creds', passwordVariable: 'docker_pass', usernameVariable: 'docker_user')]) {
                    sh ''' docker login -u ${docker_user} -p ${docker_pass}
                           docker build -t ${USER_ID}/${IMAGE_TAG}:${VERSION} .
                           docker push ${USER_ID}/${IMAGE_TAG}:${VERSION} 
                        '''
                }
            }
        }
        stage('deploy container'){
            steps{
                sh 'docker run -d ${USER_ID}/${IMAGE_TAG}:${VERSION}'
            }
        }
        stage('clean up'){
            steps{
            cleanWs()
            }
        }
    }
}
