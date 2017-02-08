node {
    checkout scm // <1>

    /* .. snip .. */

    stage('Build') {
        sh 'chmod +x ./ci-package.sh'
        sh './ci-package.sh'
    }

    stage('Test'){
        println "TODO Tests!"
    }

    stage('Deploy'){
        sh 'chmod +x ./update-function.sh'
        sh './update-function.sh'
    }


}