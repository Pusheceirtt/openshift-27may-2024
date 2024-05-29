# Day 3

## Lab - Deploying mariadb db server into openshift
Let's generate the mariadb deployment manifest file
```
oc create deployment mariadb --image=bitnami/mariadb:latest -o yaml --dry-run=client > mariadb-deploy.yml
oc apply -f mariadb-deploy.yml
oc get deploy,po
```

To troubleshoot why the pod is crashing, you could check the pod logs
```
oc logs mariadb-f5b894b56-2q8k8
```

As we can see, we didn't provide the root password, mariadb is crashing and deployment controller seem to attempt repair the issue by restarting the pod.  But the whole thing repeats again and it crashes.  So unless we fix the root cause openshift won't be able to run the mariadb pod.

Let's ensure the mariadb-deploy.yml supplies the MARIADB_ROOT_PASSWORD as an environment as shown below
<pre>
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    app: mariadb
  name: mariadb
spec:
  replicas: 1
  selector:
    matchLabels:
      app: mariadb
  template:
    metadata:
      labels:
        app: mariadb
    spec:
      containers:
      - image: bitnami/mariadb:latest
        name: mariadb
        env:
        - name: MARIADB_ROOT_PASSWORD
          value: root@123  
</pre>

Now you may deploy mariadb into openshift
```
oc apply -f mariadb-deploy.yml
oc get deploy,rs,po
```

Getting inside the mariadb pod container shell.  When it prompts for password, type 'root@123' without the quotes.
```
oc rsh deploy/mariadb
mysql -u root -p
SHOW DATABASES;
CREATE DATABASE tektutor;
USE tektutor;
CREATE TABLE training ( id INT NOT NULL, name VARCHAR(200) NOT NULL, duration VARCHAR(200) NOT NULL, PRIMARY KEY(id) );
INSERT INTO training VALUES ( 1, "DevOps", "5 Days" );
INSERT INTO training VALUES ( 2, "Developing Linux Device Drivers", "5 Days" );
INSERT INTO training VALUES ( 3, "Advanced OpenShift Administration", "5 Days" );
SELECT INTO training;
exit
exit
```

Expected output
![mariadb](mariadb1.png)
![mariadb](mariadb2.png)

## Lab - Deploying mariadb db server that uses external nfs storage
```
cd ~/openshift-27may-2024
git pull
cd Day3/persistent-volume
oc apply -f pv.yml

oc get pv

oc apply -f pvc.yml

oc get pv,pvc
oc apply -f mariadb-deploy.yml
oc get po
```
Getting inside the mariadb pod container shell.  When it prompts for password, type 'root@123' without the quotes.
```
oc rsh deploy/mariadb
mysql -u root -p
SHOW DATABASES;
CREATE DATABASE tektutor;
USE tektutor;
CREATE TABLE training ( id INT NOT NULL, name VARCHAR(200) NOT NULL, duration VARCHAR(200) NOT NULL, PRIMARY KEY(id) );
INSERT INTO training VALUES ( 1, "DevOps", "5 Days" );
INSERT INTO training VALUES ( 2, "Developing Linux Device Drivers", "5 Days" );
INSERT INTO training VALUES ( 3, "Advanced OpenShift Administration", "5 Days" );
SELECT INTO training;
exit
exit
```

Let's delete the mariadb pod and observe that openshift automatically creates a new pod in the place of the old pod that we deleted.

Try to login to the new mariadb pod, mariadb root password is 'root@123'
```
oc rsh deploy/mariadb
mysql -u root -p
SHOW DATABASES;
USE tektutor;
SHOW TABLES;
SELECT * FROM training;
```

The expectation is, you should be able to see the tektutor database with training table. The records we inserted via the previous mariadb pod should be seen intact as we are using an external NFS storage.

![mariadb](mariadb-deployment.png)

## Lab - Deploying a multi-pod wordpress with mariadb application

```
cd ~/openshift-27may-2024
git pull
cd Day3/persistent-volume/wordpress
./deploy.sh
```

Expected output
![wordpress](wordpress1.png)
![wordpress](wordpress2.png)
![wordpress](wordpress3.png)
![wordpress](wordpress4.png)
![wordpress](wordpress5.png)
![wordpress](wordpress6.png)
![wordpress](wordpress7.png)
![wordpress](wordpress8.png)

Once you are done with the wordpress lab exercise, you can clean up the resources
```
cd ~/openshift-27may-2024
git pull
cd Day3/persistent-volume/wordpress
./delete-all.sh
```

Expected output
![wordpress](wordpress9.png)
