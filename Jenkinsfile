def publisher = 'trustlab'
def  appName = 'cd-hello'
def  feSvcName = "${appName}-frontend"
def  imageTag = "${publisher}/${appName}:${env.BRANCH_NAME}"

pipeline {
  agent {
    kubernetes {
      label 'kubernetes-ag3nt-pod'
      defaultContainer 'jnlp'
      yamlFile 'KubernetesSuperPod.yaml'
    }
  }
  stages {
    stage('Test') {
      steps {
        container('golang') {
          sh """
            ln -s `pwd` /go/src/sample-app
            cd /go/src/sample-app
            go test
          """
        }
      }
    }
  }
}
