@ECHO OFF

FLTMC >NUL 2>&1 || (
	ECHO SET UAC = CreateObject^("Shell.Application"^) > "%TEMP%\GetAdmin.vbs"
	ECHO UAC.ShellExecute "%~FS0", "", "", "runas", 1 >> "%TEMP%\GetAdmin.vbs"
	CMD /U /C TYPE "%TEMP%\GetAdmin.vbs">"%TEMP%\GetAdminUnicode.vbs"
	CSCRIPT /NOLOGO "%TEMP%\GetAdminUnicode.vbs"
	DEL /F /Q "%TEMP%\GetAdmin.vbs" >NUL 2>&1
	DEL /F /Q "%TEMP%\GetAdminUnicode.vbs" >NUL 2>&1
	EXIT
)

CD /d %~dp0
SET Current_Dir=%CD%
IF NOT EXIST "%CD%\Update" exit
IF EXIST "%CD%\Update\PreUpdater.bat" DEL "%CD%\Update\PreUpdater.bat" >NUL 2>&1
CD "%CD%\Update"
COPY "*.bat" "Toolbox.bat"
DEL "%Current_Dir%\Toolbox.bat"
COPY "%Current_Dir%\Update\Toolbox.bat" "%Current_Dir%\Toolbox.bat"
CD "%Current_Dir%"
RMDIR /S /Q "%Current_Dir%\Update"
CMD /C "%SystemRoot%\Toolbox\Toolbox.bat"
EXIT
