@echo off
rem Builds fceux64.exe (PublicRelease x64) with MSVC Build Tools. Output: vc\x64\PublicRelease\fceux64.exe
setlocal
set "VS=C:\Program Files (x86)\Microsoft Visual Studio\18\BuildTools\VC\Auxiliary\Build\vcvars64.bat"
if not exist "%VS%" (echo vcvars64.bat not found - edit VS in this file & exit /b 1)
call "%VS%" >nul || exit /b 1
rem The project file asks for v140_xp/v142, which are not installed here; v145 is the VS 18 toolset.
msbuild "%~dp0vc\vc14_fceux.vcxproj" /nologo /m /v:minimal /p:Configuration=PublicRelease /p:Platform=x64 /p:PlatformToolset=v145 %*
exit /b %errorlevel%
