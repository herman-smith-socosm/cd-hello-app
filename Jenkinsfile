
def publisher = 'trustlab'
def  appName = 'cd-hello'
def  imageName = "${publisher}/${appName}"

def builtImage
def currentBranch

node {

  #stage('SCM') {
  #    checkout scm
  #}

  stage('Build Docker Image') {
      sh 'pwd'
      dir('src/github.com/source-code-smith/cd-hello-app') {
          builtImage = docker.build("${imageName}:master")
      }
  }

  builtImage.inside {
      sh 'make test'
  }
}
