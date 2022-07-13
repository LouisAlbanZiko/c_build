@echo off

set premake_directory=_premake
set premake_archive=%premake_directory%\premake.zip
set premake_executable=%premake_directory%\premake5.exe

IF NOT EXIST _premake\premake5.exe (
	echo Premake is not present. Downloading...
	
	set premake_link=https://github.com/premake/premake-core/releases/download/v5.0.0-beta1/premake-5.0.0-beta1-windows.zip

	if NOT EXIST %premake_directory% (
		mkdir %premake_directory%
	)

	if NOT EXIST %premake_executable% (
		if NOT EXIST %premake_archive% (
			powershell -Command "Invoke-WebRequest %premake_link% -OutFile %premake_archive%"
		)
		powershell -Command "Expand-Archive %premake_archive% -DestinationPath %premake_directory%/"
	)

	echo Premake downloaded.
)

_premake\premake5.exe vs2022
