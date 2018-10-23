#!groovy

def publisher = 'trustlab'
def  appName = 'cd-hello'
def  feSvcName = "${appName}-frontend"
def  imageName = "${publisher}/${appName}"

pipeline {
  agent {
    kubernetes {
      label 'kubernetes-ag3nt-pod'
      defaultContainer 'jnlp'
      yamlFile 'KubernetesSuperPod.yaml'
    }
  }
  stages {
    stage('GO') {
      steps {
        container('golang') {
          sh """
            go version
            ln -s `pwd` /go/src/$appName
            cd /go/src/$appName
            go install -v
          """
        }
      }
    }
    stage('DOCKER') {
      steps {
        container('docker') {
          sh """
            docker --version

            pwd
            ls -lsh
            
            COMMIT_HASH=$(git rev-parse --short HEAD)
            echo $COMMIT_HASH
          """
        }
      }
    }
  }
}
