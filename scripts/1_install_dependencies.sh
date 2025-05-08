source ./scripts/variables
python3 -m venv env-build
source ./scripts/variables
pip install aqtinstall swig==$SWIG_VERSION cmake==$CMAKE_VERSION ninja  mkl-static


# if $QT_VERSION does not exist, install it
if [ ! -d "$QT_VERSION" ]; then
    aqt install-qt linux desktop $QT_VERSION linux_gcc_64 -m qt5compat qtcharts qtdatavis3d      
fi
