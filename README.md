# Ruby project

This set of scripts will install ruby project.
Just clone config-scripts branch and use scripts in this order.

### install_ruby.sh
It installs rmv, ruby and bundler.

### install_mongodb.sh
It installs, starts and enables mongodb. You have to run it with root privileges.

### deploy.sh
It deploys ruby project and starts puma web server to run it. You have to open tcp 9292 port in your firewall.

### GCP instance creation with startup script 
You can also apply startup script with GCP instance creation. You can run gcloud with `--metadata-from-file startup-script=startup-script.sh` key like this
```
gcloud compute instances create --boot-disk-size=10GB --image=ubuntu-1604-xenial-v20170815a --image-project=ubuntu-os-cloud --machine-type=g1-small --tags puma-server --restart-on-failure --zone=europe-west1-b --metadata-from-file startup-script=startup-script.sh PROJECT_NAME
```
