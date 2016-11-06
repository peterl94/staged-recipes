mkdir build
cd build

cmake .. -G "Ninja" ^
	-DCMAKE_BUILD_TYPE=Release ^
	-DCMAKE_INSTALL_PREFIX:FILEPATH="%LIBRARY_PREFIX%" ^
    -DINSTALL_DIR="%LIBRARY_PREFIX%" ^
    -DUSE_OCC=ON ^
    -DUSE_PYTHON=ON ^
    -DUSE_GUI=ON ^
    -DOCC_INCLUDE_DIR:FILEPATH="%LIBRARY_INC%\opencascade" ^
    -DOCC_LIBRARY_DIR:FILEPATH="%LIBRARY_PREFIX%" ^
    -DPYBIND_INCLUDE_DIR:FILEPATH="%LIBRARY_INC%\pybind11"
     
if errorlevel 1 exit 1

ninja install
if errorlevel 1 exit 1

mkdir "%LIBRARY_PREFIX%\include\netgen"

rsync -avm --include='*.h*' -f 'hide,! */' . ${PREFIX}/include/netgen
