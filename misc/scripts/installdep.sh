if [ -z "$1" ]
  then
  echo ''
  else
  echo 'Installing Needed Dependencies'
sudo apt update && sudo apt upgrade -y
 echo 'installing AOSP dependencies'
sudo apt-get install openssh-server screen python git openjdk-8-jdk android-tools-adb bc bison \
build-essential curl flex g++-multilib gcc-multilib gnupg gperf imagemagick lib32ncurses-dev \
lib32readline-dev lib32z1-dev  liblz4-tool libncurses5-dev libsdl1.2-dev libssl-dev \
libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc yasm zip zlib1g-dev \
libtinfo5 libncurses5 neofetch htop mc pip -y
echo 'Installing Github'
sudo apt install git python pip -y
pip install PyGithub
echo 'Installation was successful!'
  fi