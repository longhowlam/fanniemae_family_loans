
## If you need more power you can spin up a VM on GCP with this startup script 
## during the start of the VM GCP allows you to execute some commands.

## In this example I copy a script 'startup_code_h2o_machine.sh' that I have already put on a gcs bucket.
## This script will install anaconda and h2o 
gcloud compute instances list

export INSTANCE_NAME="h2o-super-computer"

### creating one with pd-ssd disk type which is more expensive, but faster....  

gcloud compute instances create $INSTANCE_NAME --tags http-server  \
--machine-type=n1-standard-16 --boot-disk-size=200GB  --boot-disk-type=pd-ssd \
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

### ssh into the machine (ssh keys need to be set up on your GCP)
ssh -i ~/.ssh/google_cloud longhowlam@$(gcloud compute instances describe $INSTANCE_NAME  --format='get(networkInterfaces[0].accessConfigs[0].natIP)')

### forwarding port h2o
gcloud compute ssh $INSTANCE_NAME -- -L 54321:localhost:54321

### delete the machine to stop incuring costs 
### preemptible machines on GCP stop after 24 hours anyway (or earlier.....)

gcloud compute instances delete  $INSTANCE_NAME 
