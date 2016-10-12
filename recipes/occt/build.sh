mkdir build
cd build

if [ `uname` == Darwin]; then
    CXXFLAGS=$CXXFLAGS-std=c++11
fi


cmake -DCMAKE_INSTALL_PREFIX=$PREFIX \
      -DCMAKE_PREFIX_PATH=$PREFIX \
      -DCMAKE_3RDPARTY_DIR=$PREFIX \
      -D3RDPARTY_TK_DIR=$PREFIX \
      -D3RDPARTY_TCL_DIR=$PREFIX \
      -D3RDPARTY_TK_LIBRARY_DIR=$PREFIX/lib \
      -D3RDPARTY_TCL_LIBRARY_DIR=$PREFIX/lib \
      ..

make -j2 2>&1 | tee output.txt
make -j2 install
