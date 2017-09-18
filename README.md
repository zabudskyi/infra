# Ruby project

This set of scripts installs ruby project.
You can run *install_ruby.sh* and *install_mongodb.sh* in any order but *deploy.sh* has to be the last one.

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

## GCP image creation with packer
### Bake image with ruby and mongodb
`packer build -var-file=variables.json ubuntu16.json`

Put your varialbes in varialbes.json file or use `packer build -var 'project_id=foo' -var 'source_image=bar' ubuntu16.json` command.
You can specify machine_type as well.

### Bake image with ruby, mongodb and reddit app
`packer build -var-file=variables.json immutable.json`

## Create VM instance with reddit app and apply firewall rules with Terraform
### Check what will be done
`terraform plan`
### Do it
`terraform apply`
### Destroy it
`terraform destroy`
