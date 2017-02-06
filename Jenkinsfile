node {
    checkout scm // <1>

    /* .. snip .. */
    println "It started!"

    stage('Build') {
        sh '- chmod +x ./ci-package.sh'
        sh('ci-package.sh')
    }

    stage('Test'){
        println "TODO Tests!"
    }

    stage('Deploy'){

    }


}