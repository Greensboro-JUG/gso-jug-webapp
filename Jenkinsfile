@Library('openshift-jenkins') _
/*
    This is a Jenkins scripted pipeline.
    Jenkins pipelines are written in the Groovy language.
    Features used are provided via Jenkins Plugins.
    
    Nearly everything you want to change can be done in
    the 'variables definitions' at the top of this Pipeline.
    Most variable definitions can be overriden with Jenkins
    environment variables (which are also set by 'parameters').

    podTemplate from Kubernetes Plugin: https://github.com/jenkinsci/kubernetes-plugin
    openshift.* from Openshift Client Plugin: https://github.com/openshift/jenkins-client-plugin
*/

//// Variable Definitions Begin ////

// base name of application in openshift
def appName = env.APP_BASE_NAME ?: 'esi-fuse-wiki'

// base name of projects in openshift
def projectBase = env.PROJECT_BASE_NAME ?: 'esi'

// nexus iq app id for the image scan - set to empty to skip
def iqApplication = env.IQ_APP_ID ?: ''

// the image that be used for the build-container
def containerBuildImage = env.CONTAINER_BUILD_IMAGE ?: "nexus.cmgmi.local:18079/archmi/openjdk-8:latest"

// base image that the build artifacts will get 'deployed' into
def appBaseImage = env.APP_BASE_IMAGE ?: "nexus.cmgmi.local:18079/archmi/openjdk-8:latest"

// extra options for the mvn install step
def mvnBuildOpts = env.MVN_BUILD_OPTS ?: ""

env.JAVA_TOOLS_OPTIONS="-Dfile.encoding=UTF-8";
env.LANG="en_US.UTF-8";
env.LC_ALL="en_US.UTF-8";

// if you checkout the Jenkinsfile from scm, we'll use that, but you can set gitUrl to override

// the git repo url
def gitUrl = env.SCM_GIT_URL ?: ''
// source code branch
def gitBranch = env.SCM_GIT_BRANCH ?: ''
// credentals for source code checkout
def gitCredentials = env.SCM_GIT_CREDENTIALS ?: ''

//// Variable Definitions End ////

// nodes in jenkins are referenced by a label - you'll want to generate a unique label if you don't want pod reuse
def jenkinsNodeId = UUID.randomUUID().toString() // random node id
// or allow node reuse by specifying a stable name/id/label (if you allow reuse, remember that pod template is only applied at initial pod startup)
// you'll need to change idleMinutes to some sensible default if you do this
// def jenkinsNodeId = java.security.MessageDigest.getInstance("MD5").digest(env.JOB_NAME.bytes).encodeHex().toString()

podTemplate(
    label: jenkinsNodeId, // used for reference by node()
    cloud: 'nonprod', // in which openshift environment to start this pod
    namespace: "${projectBase}-build", // which project this pod will run inside
    name: "jenkins-kube-${env.JOB_BASE_NAME}", // prefix of pod name for logging and metrics purposes - shows up as a Jenkins worker too
    nodeSelector: '', // if this build needs to run on specific nodes on the cluster, set this
    serviceAccount: 'builder', // which service account for this pod to run as - "builder" is a good default
    inheritFrom: 'default', // default podTemplate provides a minimal "jnlp" container that jenkins uses for coordination with openshift
    // podRetention: onFailure(), // defaults to never(), if your jenkins logs don't contain enough information, try changing to always() or onFailure() and looking at 'events' for this pod in openshift
    // activeDeadlineSeconds: 86400, // If podRetention is set to 'never()' or 'onFailure()', pod is deleted after this deadline is passed.
    // idleMinutes: 240,// Allows the Pod to remain active for reuse until the configured number of minutes has passed since the last step was executed on it.
    containers: [
        containerTemplate(
            name: 'build-container', // name to use when referencing the container below
            image: containerBuildImage, // this image will be used for your build commands
            alwaysPullImage: true, // you usually want this, otherwise a non-latest tag won't check for updates
            resourceRequestCpu: env.CONTAINER_BUILD_REQUEST_CPU ?: '100m', // initial amount of cpu to allocate to this container
            resourceLimitCpu: env.CONTAINER_BUILD_LIMIT_CPU ?: '1000m', // maximum amount of cpu to use for this container
            resourceRequestMemory: env.CONTAINER_BUILD_REQUEST_MEMORY ?: '128Mi', // initial amount of memory to allocate to this container
            resourceLimitMemory: env.CONTAINER_BUILD_LIMIT_MEMORY ?: '1024Mi', // maximum amount of memory to allow this container to use
            ttyEnabled: true, // required for jenkins communication with container
            command: 'cat' // required for most containers to not run the default command (which may exit)
        )
    ])
{
    node(jenkinsNodeId) { // jenkins requires this to know which worker to use - this must match the podTemplate
        container('build-container') {
            sh "rm -rf *" // if we re-use the node, it's pretty important to make sure we have a clean workspace
            sh "echo \$LANG"
            sh "echo \$LC_ALL"
            sh "export LC_ALL=pt_PT.utf8" // Setting the encoding to UTF-8
            sh "export LANG=pt_PT.utf8" // Setting the encoding to UTF-8
            
            stage('Checkout Source') {
                // checks out git repository with Jenkins "checkout"
                def gitinfo;
                if (gitUrl) {
                    gitinfo = checkout ([$class: 'GitSCM', branches: [[name: "refs/heads/${gitBranch}"]], userRemoteConfigs: [[url: gitUrl, credentialsId: gitCredentials]]])
                } else {
                    // scm is a special variable which instructs the checkout step to clone the specific revision which triggered this Pipeline run.
                    gitinfo = checkout scm
                }

                // set environment variables for build to reference
                env.GIT_BRANCH = gitinfo.GIT_BRANCH
                env.GIT_COMMIT = gitinfo.GIT_COMMIT
            }
            
            stage('Build and Test') {
                
                sh """
                    mvn ${mvnBuildOpts} clean package -DskipTests -Dfile.encoding=UTF-8
                """
            }
            stage('Stash Artifacts') {
                dir('target/') {
                    // if we have a standalone war file, rename it to ROOT.war for app server
                    sh "mv *.war ROOT.war 2>/dev/null || echo single war not found, skipping"

                    sh """
                        cp -a ../extensions ./ 2>/dev/null || echo no extensions directory
                        cp -a ../deployments ./ 2>/dev/null || echo no deployments directory
                        cp -a ../modules ./ 2>/dev/null || echo no modules directory
                        cp -a ../configuration ./ 2>/dev/null || echo no configuration directory
                    """

                    // we'll stash the built artifacts we need for the remaining steps
                    // we also include all deployments, modules, and configuration directories
                    stash(
                        name: 'artifacts',
                        includes: 'deployments/**/*, modules/**/*, configuration/**/*, extensions/**/*, *.war, *.ear, *.rar, *.jar, *.tar, *.tar.gz, *.zip, *.tar.bz2',
                        excludes: '*-javadoc.*, *-sources.*, original-*'
                    )
                }
            }
        }
        container('jnlp') { // default container with jnlp runtime and deployment libraries
            ocpBuildWithArtifacts(
                appName: appName, // buildConfig name
                appBaseImage: appBaseImage, // image build config will use for s2i
                iqApplication: iqApplication, // configured on https://nexus-iq.cmgmi.local/
                // cluster: 'nonprod', // cluster this project env is on (demo, nonprod, prod, etc.)
                // project: "${projectBase}-build", // name of project in cluster
                // credentials: "nonprod-${projectBase}-build-jenkins-helper", // jenkins credential to use for actions in this project
                projectBase: projectBase // base name of project and other resources
            )

            ocpDeployDev(
                appName: appName, // deploymentConfig name
                // cluster: 'nonprod', // cluster this project env is on (demo, nonprod, prod, etc.)
                // credentials: "nonprod-${projectBase}-build-jenkins-helper", // jenkins credential to use for actions in this project
                projectBase: projectBase // base name of project and other resources
            )
        }
    }
}