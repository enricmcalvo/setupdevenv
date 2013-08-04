
if [ `which octave` ]; then
    echo '*** Skipping Octave installation, heroku seems to be already installed in the system.'
else
    echo "This script requires superuser access to install apt packages."
    echo "You will be prompted for your password by sudo."

    # clear any previous sudo permission
    sudo -k

    #  run inside sudo
    sudo sh <<SCRIPT


      #Require *-software-properties to get apt-add-repository command
      sudo apt-get install -y software-properties-common  python-software-properties
      
      # Install Octave 3.6 for 12.04LTS and required package to load toolboxes
      sudo apt-add-repository ppa:dr-graef/octave-3.6.precise 
      sudo apt-get update 
      sudo apt-get install -y octave liboctave-dev

SCRIPT
fi
