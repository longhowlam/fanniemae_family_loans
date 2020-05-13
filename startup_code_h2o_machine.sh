git clone https://github.com/longhowlam/fanniemae_family_loans.git
mkdir fanniemae_family_loans/data
gsutil cp gs://lhlbucket/data/acquisition2010.zip fanniemae_family_loans/data/acquisition2010.zip 
gsutil cp gs://lhlbucket/data/performance2010.zip fanniemae_family_loans/data/performance2010.zip 

##### anaconda
wget https://repo.anaconda.com/archive/Anaconda3-2020.02-Linux-x86_64.sh  -O ~/anaconda.sh 
bash ~/anaconda.sh -b -f -p  $HOME/anaconda 

#### h2o needs java
sudo apt-get update
sudo apt-get install -y default-jdk

#eval "$($HOME/anaconda/bin/conda shell.bash hook)"
export PATH=~/anaconda/bin:$PATH
conda init

###### install h2o
pip install requests
pip install tabulate
pip install "colorama>=0.3.8"
pip install future

pip install -f http://h2o-release.s3.amazonaws.com/h2o/latest_stable_Py.html h2o
