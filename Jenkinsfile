def publisher = 'trustlab'
def  appName = 'cd-hello'
def  feSvcName = "${appName}-frontend"
def  imageTag = "${publisher}/${appName}:${env.BRANCH_NAME}"
def srcDir = '/go/src/sample-app'

pipeline {
  agent {
    kubernetes {
      label 'kubernetes-ag3nt-pod'
      defaultContainer 'jnlp'
      yamlFile 'KubernetesSuperPod.yaml'
    }
  }
  stages {
    stage('GO GET') {
      steps {
        container('golang') {
          sh """
            echo 'Symbolically Linking'
            ln -s `pwd` $srcDir
            go version
            docker images
          """
        }
      }
    }
    stage('BUILD') {
      steps {
        container('golang') {
          sh """
            echo 'Pulling Dependencies'

            cd $srcDir
            go get -u github.com/source-code-smith/cd-hello-app
            ls -lah
            go build
          """
        }
      }
    }

  }
}
