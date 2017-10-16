# Ruby project

This set of scripts installs ruby project.
You can run *install_ruby.sh* and *install_mongodb.sh* in any order but *deploy.sh* has to be the last one.

### install_ruby.sh
It installs rmv, ruby and bundler.

### install_mongodb.sh
It installs, starts and enables mongodb. You have to run it with root privileges.

### deploy.sh
It deploys ruby project and starts puma web server to run it. You have to open tcp 9292 port in your firewall.


## GCP instance creation with startup script
You can also apply startup script with GCP instance creation. You can run gcloud with `--metadata-from-file startup-script=startup-script.sh` key like this
```
gcloud compute instances create --boot-disk-size=10GB --image=ubuntu-1604-xenial-v20170815a --image-project=ubuntu-os-cloud --machine-type=g1-small --tags puma-server --restart-on-failure --zone=europe-west1-b --metadata-from-file startup-script=startup-script.sh PROJECT_NAME
```

## Service account key creation
You have to place your GCP Service account key in infra root and name it `account.json`. Packer and terraform will use it for Google cloud authentication.
 [Check this link](https://cloud.google.com/iam/docs/creating-managing-service-account-keys)

## GCP image creation with packer
### Bake image with ruby and mongodb
`packer build -var-file=variables.json ubuntu16.json`

Put your varialbes in varialbes.json file or use `packer build -var 'project_id=foo' -var 'source_image=bar' ubuntu16.json` command.
You can specify machine_type as well.

### Bake image with ruby, mongodb and reddit app
`packer build -var-file=variables.json immutable.json`

## Create VM instances with base app and db images and apply firewall rules with Terraform
### Check what will be done
`terraform plan`
### Do it
`terraform apply`
### Destroy it
`terraform destroy`

### Moving state file to google cloud bucket
Remove "example" part from `backend.tf.example`. Bucket names reside in a single Cloud Storage namespace, which means that every bucket name must be unique.

## Configure and deploy reddit app with ansible playbook
### 1. In one play in one file, define hosts with `--limit` and play part with `--tags`
###   - Configure mondoDB
      ansible-playbook reddit_app_one_play.yml --tags db-tag --limit tag_reddit-db
###   - Configure puma service
      ansible-playbook reddit_app_one_play.yml --tags app-tag --limit tag_reddit-app
###   - Deploy reddit app
      ansible-playbook reddit_app_one_play.yml --tags deploy-tag --limit tag_reddit-app
### 2. In three plays in one file, hosts are defined. You can run plays with `--tags` or just run all three plays at once
      ansible-playbook reddit_app_multiple_plays.yml
### 3. In three plays in three files gathered with main site.yml playbook
      ansible-playbook site.yml
## DB role testing
Install requirements for testing
```
pip install -r requirements.txt
```
Create testing VM
```
molecule create
```
Apply testing playbook
```
molecule converge
```
Run tests
```
molecule verify
```
