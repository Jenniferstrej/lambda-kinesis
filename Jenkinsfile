node {
    checkout scm // <1>

    /* .. snip .. */
    println "It started!"

    stage('Build') {
        sh 'chmod +x ci-package.sh'
        sh('ci-package.sh')
    }

    stage('Test'){
        println "TODO Tests!"
    }

    stage('Deploy'){
        ls
        pwd
        sh 'chmod +x update-function.sh'
        sh('update-function.sh')
        println "Finished deploy!"
    }


}