@ECHO OFF
CD /d %~dp0
SET Current_Dir=%CD%
IF NOT EXIST "%CD%\Update" exit
CD "%CD%\Update"
COPY "*.bat" "Toolbox.bat"
DEL "%Current_Dir%\Toolbox.bat"
COPY "%Current_Dir%\Update\Toolbox.bat" "%Current_Dir%\Toolbox.bat"
CD "%Current_Dir%"
RMDIR /S /Q "%Current_Dir%\Update"
WScript "%WinDir%\Toolbox\Start.vbs"
EXIT
