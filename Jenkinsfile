pipeline {
    agent any 
    
    tools{
        jdk 'jdk17'
        maven 'maven3'
    }
    
     stages{
        stage("Compile"){
            steps{
                sh "mvn clean compile"
            }
        }
        
         stage("Test Cases"){
            steps{
                sh "mvn test"
            }
        }
     }
}