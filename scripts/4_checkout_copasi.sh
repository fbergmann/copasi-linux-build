
# if COPASI directory does not exist, clone it
if [ ! -d "COPASI" ]; then
    git clone -b $COPASI_VERSION https://github.com/copasi/COPASI.git
fi

pushd COPASI
git pull --rebase
./gitTools/UpdateCopasiVersion -force
popd
