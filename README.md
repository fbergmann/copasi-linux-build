## Build COPASI
This project holds a couple of scripts for building COPASI with the graphical user interface. 
It is based on Qt6. To modify the Versions of dependencies to be used, modify the `variables` file
in the `./scripts` folder.

## docker
you could build the whole project in docker, for that just mount the current directory into the image when running: 

```bash
sudo docker run -it --rm -v `pwd`:/io ubuntu:24.04
cd /io
```

## run the build
First change to the directory where everything ought to be build

```bash
source ./scripts/variables 
./scripts/0_apt-packages.sh  
./scripts/1_install_dependencies.sh  
./scripts/2_checkout-dependencies.sh  
./scripts/3_build-dependencies.sh  
./scripts/4_checkout_copasi.sh  
./scripts/5_build-copasi.sh 
```

There is also a deploy script, that tries to use linuxdeployqt to collect dependencies. Note that that script requires an older linux distribution though. 


## using system qt6
if  `QT_VERSION=system`, the Qt6 from the system will be used (and the packages installed by the `0_` script)
