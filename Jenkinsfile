#!groovy

pipeline {
  agent none
  stages {
    stage('Go Install') {
      agent {
        docker {
          image 'golang:1.10'
        }
      }
      steps {
        sh 'go install'
      }
    }
    stage('Docker Build') {
      agent any
      steps {
        sh 'docker build -t trustlab/cd-hello:latest .'
      }
    }
  }
}
