mkdir build
cd build

if [ `uname` == Darwin ]; then
    CXXFLAGS="$CXXFLAGS -std=c++11"
fi

cmake .. \
      -DCMAKE_INSTALL_PREFIX=$PREFIX \
      -DCMAKE_PREFIX_PATH=$PREFIX \
      -DMAKE_PYTHON_BINDINGS=ON \
      -DCMAKE_BUILD_TYPE="Release"

make -j2 2>&1 | tee output.txt
make -j2 install
