# Day 5
## Info - What is an ImageStream in OpenShift?
<pre>
- ImageStream is a resource supported only in OpenShift
- ImageStream is connected with OpenShift's Internal Private Container Image Registry
- We can store multiple versions of same container image within an ImageStream
</pre>
	

## Lab - Buildconfig 

<pre>
- This is a new feature added in Openshift and not supported in Kubernetes
- In this lab exercise, we will create an imagestream to push our custom docker image
- We will create a buildconfig using Docker strategy
- Build config with docker strategy will pick the Dockerfile present in our Day5/BuildConfig and starts the build
- The Dockerfile is a multi-stage Dockeerfile, in the first stage it builds the springboot sample microservice source code to create the application execuable jar file. The second stage copies the application jar and builds the final custom container image.
- The container image is saved to ImageStream.
- As the image stream is pointing to Openshift's Private Registry, eventually the image is stored in Openshift's Private Container Registry.
- The output of this Buildconfig is a Docker image, which will be pushed to openshift's private registry.
</pre>

Let's create an image stream
```
cd ~/openshift-27may-2024
git pull
cd Day5/BuildConfig

oc apply -f imagestream.yml
oc get imagestreams
oc get imagestream
oc get is
```

Let's create the buildconfig
```
cd ~/openshift-27may-2024
git pull
cd Day5/BuildConfig
oc delete -f buildconfig.yml
oc apply -f buildconfig.yml
oc get buildconfigs
oc get buildconfig
oc get bc

oc get builds
oc get build

oc logs -f bc/spring-hello
```

## CI/CD

You need to create a trial JFrog Artifactory (14-days Cloud Trial) @ https://jfrog.com/start-free/#trialOptions with your personal gmail account (No credit cards required)
![JFrog](jfrog1.png)

You could choose AWS ( they use their cloud account hence no charges are applicable to us - I didn't give my mobile number )
![JFrog](jfrog2.png)
![JFrog](jfrog3.png)
![JFrog](jfrog4.png)
![JFrog](jfrog5.png)

Now you should be able to login to your jfrog cloud with your gmail account that your registered with JFrog trial
![JFrog](jfrog6.png)
![JFrog](jfrog7.png)
![JFrog](jfrog8.png)
![JFrog](jfrog9.png)
![JFrog](jfrog10.png)
![JFrog](jfrog11.png)
![JFrog](jfrog12.png)
![JFrog](jfrog12.5.png)
![JFrog](jfrog13.png)

<pre>
jegan@tektutor.org $ docker login -u mail2tektutor@gmail.com openshiftjegan.jfrog.io
Password: 
WARNING! Your password will be stored unencrypted in /home/jegan/.docker/config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credentials-store

Login Succeeded
jegan@tektutor.org $ docker pull openshiftjegan.jfrog.io/jegan-docker/hello-world:latest
latest: Pulling from jegan-docker/hello-world
Digest: sha256:266b191e926f65542fa8daaec01a192c4d292bff79426f47300a046e1bc576fd
Status: Downloaded newer image for openshiftjegan.jfrog.io/jegan-docker/hello-world:latest
openshiftjegan.jfrog.io/jegan-docker/hello-world:latest
	
jegan@tektutor.org $ docker tag openshiftjegan.jfrog.io/jegan-docker/hello-world openshiftjegan.jfrog.io/jegan-docker/hello-world:1.0.0
 jegan@tektutor.org  ~/openshift-may-2024/Day5   main  docker push openshiftjegan.jfrog.io/jegan-docker/hello-world:1.0.0
The push refers to repository [openshiftjegan.jfrog.io/jegan-docker/hello-world]
ac28800ec8bb: Layer already exists 
1.0.0: digest: sha256:d37ada95d47ad12224c205a938129df7a3e52345828b4fa27b03a98825d1e2e7 size: 524
</pre>

Deploy Jenkins Ephemeral from Develop context and login to Jenkins
![jenkins](jenkins0.png)
![jenkins](jenkins1.png)
![jenkins](jenkins2.png)
![jenkins](jenkins3.png)
![jenkins](jenkins4.png)

Select "pipeline" project
![jenkins](jenkins5.png)
![jenkins](jenkins6.png)
![jenkins](jenkins7.png)
![jenkins](jenkins8.png)
![jenkins](jenkins9.png)
![jenkins](jenkins10.png)
![jenkins](jenkins11.png)
![jenkins](jenkins12.png)
![jenkins](jenkins13.png)
![jenkins](jenkins14.png)
![jenkins](jenkins15.png)
