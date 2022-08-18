@echo off

where /q cmake
IF ERRORLEVEL 1 (
	echo Cmake is not present on the PATH.
	echo Please make sure to select the add to path option in the installer.
	echo Downloading installer...
	powershell -Command "Invoke-WebRequest https://github.com/Kitware/CMake/releases/download/v3.24.1/cmake-3.24.1-windows-x86_64.msi -OutFile cmake.msi"
	msiexec /i "cmake.msi"
	del "cmake.msi"
)

cmake -DCMAKE_BUILD_TYPE=Debug -Wno-dev -S . -B _out/build
