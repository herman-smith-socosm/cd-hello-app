
def publisher = 'trustlab'
def  appName = 'cd-hello'
def  imageName = "${publisher}/${appName}"

def builtImage
def currentBranch

node {

  stage('SCM') {
      checkout scm
      currentBranch = scm.branches[0].name.drop(2)
      echo 'Branch Name: ' + currentBranch
  }

  stage('Build Docker Image') {
      sh 'pwd'
      dir('src/github.com/source-code-smith/cd-hello-app') {
          builtImage = docker.build(${imageName}: + branch)
      }
  }

  builtImage.inside {
      sh 'make test'
  }
}
