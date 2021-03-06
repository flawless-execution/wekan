# Usage: ./release.sh 3.95

# Delete old stuff
#cd ~/repos/wekan
#./releases/release-cleanup.sh

# Build Source
#cd ~/repos/wekan
#./releases/rebuild-release.sh

REPODIR=/home/wekan/repos
WEKANDIR=/home/wekan/repos/wekan

# Ensure sudo access
sudo echo .
rm -rf ~/repos/wekan/.meteor-spk
sudo systemctl enable sandstorm
sudo sandstorm start
sudo sandstorm update
# Build Sandstorm
#cd $REPODIR
#rm -rf $WEKANDIR
#git clone git@github.com:wekan/wekan.git
#cd $WEKANDIR
#sudo n 12.20.2
#sudo mkdir -p /usr/local/lib/node_modules/fibers/.node-gyp
# Build Wekan
#./releases/rebuild-release.sh
#cd .build/bundle/programs/server
#npm install node-gyp node-pre-gyp fibers
cd $WEKANDIR
# Build Sandstorm
meteor-spk pack wekan-$1.spk
spk publish wekan-$1.spk
rm -rf ~/repos/wekan/.meteor-spk
#scp wekan-$1.spk x2:/var/snap/wekan/common/releases.wekan.team/
