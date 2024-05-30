# Day 5

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
![JFrog](jfrog13.png)

<pre>
 jegan@tektutor.org  ~/openshift-may-2024/Day5   main  docker login -umail2tektutor@gmail.com openshiftjegan.jfrog.io
Password: 
WARNING! Your password will be stored unencrypted in /home/jegan/.docker/config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credentials-store

Login Succeeded
 jegan@tektutor.org  ~/openshift-may-2024/Day5   main  docker pull openshiftjegan.jfrog.io/jegan-docker/hello-world:latest
latest: Pulling from jegan-docker/hello-world
Digest: sha256:266b191e926f65542fa8daaec01a192c4d292bff79426f47300a046e1bc576fd
Status: Downloaded newer image for openshiftjegan.jfrog.io/jegan-docker/hello-world:latest
openshiftjegan.jfrog.io/jegan-docker/hello-world:latest
 jegan@tektutor.org  ~/openshift-may-2024/Day5   main  docker tag openshiftjegan.jfrog.io/jegan-docker/hello-world openshiftjegan.jfrog.io/jegan-docker/hello-world:1.0.0
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
