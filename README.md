Setup Dev. Env. in a Linux Box (AWS EC2, VPS, etc.)
====================================
Clone and run this on a new EC2 instance (or any other VPS) running Ubuntu 12.04.2 LTS to
configure both the machine and your individual development environment as
follows:

```sh
cd $HOME
sudo apt-get install -y git-core
git clone https://github.com/enricmcalvo/setupdevenv.git
./setup/setup.sh   
```

See also http://github.com/startup-class/dotfiles and
[Startup Engineering Video Lectures 4a/4b](https://class.coursera.org/startup-001/lecture/index)
for more details.

TODO
====
Break installation into small pieces:
+ Dotfiles
+ Heroku
+ Node.js, nvm
+ Emacs24

Integrate:
+ Octave
+ Docker

Add:
+ Command-line arguments to install a subset of any of the available pieces by hand, so:
  ./setup.sh emacs24 octave docker

Fix:
+ Integrate with more elaborate dotfiles (like add colours in git)

