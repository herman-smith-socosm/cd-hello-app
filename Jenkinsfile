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
    stage('DOCKER VERSION') {
      steps {
        container('docker') {
          sh """
            docker --version
          """
        }
      }
    }
    stage('GO VERSION') {
      steps {
        container('golang') {
          sh """
            go version
            ln -s `pwd` /go/src/$appName
            cd /go/src/$appName
          """
        }
      }
    }
  }
}
