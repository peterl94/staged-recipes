mkdir build
cd build

cmake .. -G "Ninja" ^
    -DCMAKE_PREFIX_PATH:FILEPATH="%PREFIX%" ^
    -DCMAKE_INSTALL_PREFIX:FILEPATH="%LIBRARY_PREFIX%" ^
    -D3RDPARTY_DIR:FILEPATH="%LIBRARY_PREFIX%" ^
    -DMAKE_PYTHON_BINDINGS=ON ^
    -DCMAKE_BUILD_TYPE="Release"

if errorlevel 1 exit 1

ninja install
if errorlevel 1 exit 1
