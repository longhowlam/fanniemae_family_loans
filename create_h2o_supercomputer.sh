## If you need more power you can spin up a VM with a startup script that retrieves
## another script from a google cloud bucket. This script will install anaconda and h2o 

export INSTANCE_NAME="h2o-super-computer"

gcloud compute instances create $INSTANCE_NAME --tags http-server  \
--machine-type=n1-standard-16 --boot-disk-size=100GB \
--image-family ubuntu-1804-lts --image-project ubuntu-os-cloud  \
--scopes=https://www.googleapis.com/auth/cloud-platform \
--preemptible \
--metadata startup-script='#! /bin/bash
sudo -u longhowlam bash -c "cd ~/;
 gsutil cp gs://lhlbucket/startup_code_h2o_machine.sh startup_code.sh;
 sudo chmod +x startup_code.sh;
 ./startup_code.sh" 
'


# region ########### port for h2o #############################################
gcloud compute instances add-tags $INSTANCE_NAME --tags p54321

gcloud compute firewall-rules create h2oport --allow tcp:54321 \
--source-ranges=0.0.0.0/0 --description="open port 54321" --target-tags "p54321"
# endregion ####################################################################

### login if needed with a proper key
ssh -i ~/.ssh/google_cloud longhowlam@$(gcloud compute instances describe $INSTANCE_NAME  --format='get(networkInterfaces[0].accessConfigs[0].natIP)')
