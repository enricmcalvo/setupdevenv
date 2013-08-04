
if [ `which docker` ]; then
    echo '*** Skipping Docker installation, heroku seems to be already installed in the system.'

elif [ "3.8" != "$(uname -r | cut -f 1,2 -d '.')" ]  ; then 
    echo " --==>> WARNING: Docker requires kernel 3.8, upgrade is necessary!"
else
    echo "This script requires superuser access to install apt packages."
    echo "You will be prompted for your password by sudo."

    # clear any previous sudo permission
    sudo -k

    #  run inside sudo
    sudo sh <<SCRIPT

      #Require *-software-properties to get apt-add-repository command
      sudo apt-get update 
      sudo apt-get install -y software-properties-common  python-software-properties
      
      # Install Docker for 12.04LTS and required package to load toolboxes
      sudo apt-add-repository ppa:dotcloud/lxc-docker
      sudo apt-get update 
      sudo apt-get install -y lxc-docker

SCRIPT
fi
