git clone -b $COPASI_VERSION https://github.com/copasi/COPASI.git
pushd COPASI
git pull --rebase
./gitTools/UpdateCopasiVersion -force
popd
