echo "\nDeleting wordpress resources ..."
oc delete -f wordpress-route.yml
oc delete -f wordpress-svc.yml
oc delete -f wordpress-deploy.yml
oc delete -f wordpress-pvc.yml
oc delete -f wordpress-pv.yml

echo "\nDeleting mysql resources ..."
oc delete -f mysql-svc.yml
oc delete -f mysql-deploy.yml
oc delete -f mysql-pvc.yml
oc delete -f mysql-pv.yml
