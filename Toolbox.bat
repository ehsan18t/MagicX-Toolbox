@ECHO OFF
::mode con:cols=78 lines=28
SET Current_Version=1.0
TITLE MagicX Toolbox v%Current_Version% by Ahsan400

:Main_Menu
CLS
COLOR 0E
ECHO.
ECHO 			=========================
ECHO 			^|^| MagicX Toolbox v%Current_Version% ^|^|
ECHO 			=========================
ECHO.
ECHO.
ECHO.
ECHO  ^=^> Author: Ahsan Khan (@Ahsan400)
ECHO  ^=^> Target: Windows 10 20H1
ECHO  ^=^> TG Group: https:\\t.me\MagicXMod
ECHO  ^=^> Website: MagicXMod.github.io
ECHO.
ECHO.
ECHO  ***********************
ECHO  ***	Main Menu    ***
ECHO  ***********************
ECHO  1. Appearance
ECHO  2. Context Menu
ECHO  3. System Optimization
ECHO  4. Windows Update Settings
ECHO  5. Download Center
ECHO  U. Check Update
ECHO  R. Report BUGS
ECHO  X. Exit
ECHO.

CHOICE /C:12345URX /N /M "Enter your choice: "

IF ERRORLEVEL 8 GOTO Exit
IF ERRORLEVEL 7 GOTO Report_Bugs
IF ERRORLEVEL 6 GOTO Check_Update
IF ERRORLEVEL 5 GOTO Downloads
IF ERRORLEVEL 4 GOTO Windows_Update
IF ERRORLEVEL 3 GOTO System
IF ERRORLEVEL 2 GOTO Context_Menu
IF ERRORLEVEL 1 GOTO Appearance






::::::::::::::::::::::::::
::						::
::		Appearance		::
::						::
::::::::::::::::::::::::::
:Appearance
CLS
COLOR 0E
ECHO.
ECHO 			=========================
ECHO 			^|^| MagicX Toolbox v%Current_Version% ^|^|
ECHO 			=========================
ECHO.
ECHO  1. Remove Arrow From Shortcut
ECHO  2. Restore Arrow In Shortcut
ECHO  H. Main Menu
ECHO.

CHOICE /C:12H /N /M "Enter your choice: "

ECHO.

IF ERRORLEVEL 3 GOTO Main_Menu
IF ERRORLEVEL 2 GOTO rstr_arw_shtct
IF ERRORLEVEL 1 GOTO rmv_arw_shtct


:rmv_arw_shtct
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /v "29" /t REG_SZ /d "%%systemroot%%\Blank.ico,0" /f
ECHO Restarting Windows Explorer....
taskkill /im explorer.exe /f
start explorer.exe
ECHO.
ECHO  ^=^> Press Any Key To Go Appearance Menu
PAUSE >nul
GOTO Appearance



:rstr_arw_shtct
Reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /v "29" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /f
ECHO Restarting Windows Explorer....
taskkill /im explorer.exe /f
start explorer.exe
ECHO.
ECHO  ^=^> Press Any Key To Go Appearance Menu
PAUSE >nul
GOTO Appearance







::::::::::::::::::::::::::::::
::							::
::		Context Menu		::
::							::
::::::::::::::::::::::::::::::
:Context_Menu
CLS
COLOR 0E
ECHO.
ECHO 			=========================
ECHO 			^|^| MagicX Toolbox v%Current_Version% ^|^|
ECHO 			=========================
ECHO.
ECHO  ============
ECHO  ^|^| Remove ^|^|
ECHO  ============
ECHO  1. Remove Print
ECHO  2. Remove BitLocker Options
ECHO  3. Remove Scan With Windows Defender
ECHO  4. Remove Personalize Classic (Desktop)

ECHO.

ECHO  =========
ECHO  ^|^| Add ^|^|
ECHO  =========
ECHO  A. Add Print
ECHO  B. Add BitLocker Options
ECHO  C. Add Scan With Windows Defender
ECHO  D. Add Personalize Classic (Desktop)

ECHO.

ECHO  H. Main Menu
ECHO.



CHOICE /C:1234ABCDH /N /M "Enter your choice: "

ECHO.

IF ERRORLEVEL 9 GOTO Main_Menu
IF ERRORLEVEL 8 GOTO add_personalize_classic
IF ERRORLEVEL 7 GOTO add_scan_defneder
IF ERRORLEVEL 6 GOTO add-bit_locker
IF ERRORLEVEL 5 GOTO add_print
IF ERRORLEVEL 4 GOTO rmv_personalize_classic
IF ERRORLEVEL 3 GOTO rmv_scan_defender
IF ERRORLEVEL 2 GOTO rmv_bit_locker
IF ERRORLEVEL 1 GOTO rmv_print



:rmv_print
Reg.exe add "HKCR\SystemFileAssociations\image\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f
Reg.exe add "HKCR\batfile\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f
Reg.exe add "HKCR\cmdfile\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f
Reg.exe add "HKCR\docxfile\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f
Reg.exe add "HKCR\fonfile\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f
Reg.exe add "HKCR\htmlfile\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f
Reg.exe add "HKCR\inffile\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f
Reg.exe add "HKCR\inifile\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f
Reg.exe add "HKCR\JSEFile\Shell\Print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f
Reg.exe add "HKCR\otffile\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f
Reg.exe add "HKCR\pfmfile\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f
Reg.exe add "HKCR\regfile\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f
Reg.exe add "HKCR\rtffile\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f
Reg.exe add "HKCR\ttcfile\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f
Reg.exe add "HKCR\ttffile\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f
Reg.exe add "HKCR\txtfile\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f
Reg.exe add "HKCR\VBEFile\Shell\Print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f
Reg.exe add "HKCR\VBSFile\Shell\Print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f
Reg.exe add "HKCR\WSFFile\Shell\Print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f
ECHO.
ECHO  ^=^> Press Any Key To Go Context Menu
PAUSE >nul
GOTO Context_Menu



:rmv_bit_locker
Reg.exe delete "HKCR\Drive\shell\suspend-bde" /f
Reg.exe delete "HKCR\Drive\shell\decrypt-bde" /f
Reg.exe delete "HKCR\Drive\shell\lock-bde" /f
Reg.exe add "HKCR\Drive\shell\change-passphrase" /v "LegacyDisable" /t REG_SZ /d "" /f
Reg.exe add "HKCR\Drive\shell\manage-bde" /v "LegacyDisable" /t REG_SZ /d "" /f
Reg.exe add "HKCR\Drive\shell\resume-bde" /v "LegacyDisable" /t REG_SZ /d "" /f
Reg.exe add "HKCR\Drive\shell\resume-bde-elev" /v "LegacyDisable" /t REG_SZ /d "" /f
Reg.exe add "HKCR\Drive\shell\encrypt-bde" /v "LegacyDisable" /t REG_SZ /d "" /f
Reg.exe add "HKCR\Drive\shell\encrypt-bde-elev" /v "LegacyDisable" /t REG_SZ /d "" /f
Reg.exe add "HKCR\Drive\shell\unlock-bde" /v "LegacyDisable" /t REG_SZ /d "" /f
ECHO.
ECHO  ^=^> Press Any Key To Go Context Menu
PAUSE >nul
GOTO Context_Menu


:rmv_scan_defender
Reg.exe delete "HKCR\*\shellex\ContextMenuHandlers\EPP" /f
Reg.exe delete "HKCR\CLSID\{09A47860-11B0-4DA5-AFA5-26D86198A780}" /f
Reg.exe delete "HKCR\Directory\shellex\ContextMenuHandlers\EPP" /f
Reg.exe delete "HKCR\Drive\shellex\ContextMenuHandlers\EPP" /f
ECHO.
ECHO  ^=^> Press Any Key To Go Context Menu
PAUSE >nul
GOTO Context_Menu



:rmv_personalize_classic
Reg.exe delete "HKCR\CLSID\{580722ff-16a7-44c1-bf74-7e1acd00f4f9}" /f
Reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel\NameSpace\{580722ff-16a7-44c1-bf74-7e1acd00f4f9}" /f
Reg.exe delete "HKCR\DesktopBackground\Shell\ClassicPersonalize" /f
ECHO.
ECHO  ^=^> Press Any Key To Go Context Menu
PAUSE >nul
GOTO Context_Menu

:add_print
Reg.exe delete "HKCR\SystemFileAssociations\image\shell\print" /v "ProgrammaticAccessOnly" /f
Reg.exe add "HKCR\SystemFileAssociations\image\shell\print" /f
Reg.exe delete "HKCR\batfile\shell\print" /v "ProgrammaticAccessOnly" /f
Reg.exe add "HKCR\batfile\shell\print" /f
Reg.exe delete "HKCR\cmdfile\shell\print" /v "ProgrammaticAccessOnly" /f
Reg.exe add "HKCR\cmdfile\shell\print" /f
Reg.exe delete "HKCR\docxfile\shell\print" /v "ProgrammaticAccessOnly" /f
Reg.exe add "HKCR\docxfile\shell\print" /f
Reg.exe delete "HKCR\fonfile\shell\print" /v "ProgrammaticAccessOnly" /f
Reg.exe add "HKCR\fonfile\shell\print" /f
Reg.exe delete "HKCR\htmlfile\shell\print" /v "ProgrammaticAccessOnly" /f
Reg.exe add "HKCR\htmlfile\shell\print" /f
Reg.exe delete "HKCR\inffile\shell\print" /v "ProgrammaticAccessOnly" /f
Reg.exe add "HKCR\inffile\shell\print" /f
Reg.exe delete "HKCR\inifile\shell\print" /v "ProgrammaticAccessOnly" /f
Reg.exe add "HKCR\inifile\shell\print" /f
Reg.exe delete "HKCR\JSEFile\Shell\Print" /v "ProgrammaticAccessOnly" /f
Reg.exe add "HKCR\JSEFile\Shell\Print" /f
Reg.exe delete "HKCR\otffile\shell\print" /v "ProgrammaticAccessOnly" /f
Reg.exe add "HKCR\otffile\shell\print" /f
Reg.exe delete "HKCR\pfmfile\shell\print" /v "ProgrammaticAccessOnly" /f
Reg.exe add "HKCR\pfmfile\shell\print" /f
Reg.exe delete "HKCR\regfile\shell\print" /v "ProgrammaticAccessOnly" /f
Reg.exe add "HKCR\regfile\shell\print" /f
Reg.exe delete "HKCR\rtffile\shell\print" /v "ProgrammaticAccessOnly" /f
Reg.exe add "HKCR\rtffile\shell\print" /f
Reg.exe delete "HKCR\ttcfile\shell\print" /v "ProgrammaticAccessOnly" /f
Reg.exe add "HKCR\ttcfile\shell\print" /f
Reg.exe delete "HKCR\ttffile\shell\print" /v "ProgrammaticAccessOnly" /f
Reg.exe add "HKCR\ttffile\shell\print" /f
Reg.exe delete "HKCR\txtfile\shell\print" /v "ProgrammaticAccessOnly" /f
Reg.exe add "HKCR\txtfile\shell\print" /f
Reg.exe delete "HKCR\VBEFile\Shell\Print" /v "ProgrammaticAccessOnly" /f
Reg.exe add "HKCR\VBEFile\Shell\Print" /f
Reg.exe delete "HKCR\VBSFile\Shell\Print" /v "ProgrammaticAccessOnly" /f
Reg.exe add "HKCR\VBSFile\Shell\Print" /f
Reg.exe delete "HKCR\WSFFile\Shell\Print" /v "ProgrammaticAccessOnly" /f
Reg.exe add "HKCR\WSFFile\Shell\Print" /f
ECHO.
ECHO  ^=^> Press Any Key To Go Context Menu
PAUSE >nul
GOTO Context_Menu



:add-bit_locker
Reg.exe delete "HKCR\Drive\shell\change-passphrase" /v "LegacyDisable" /f
Reg.exe delete "HKCR\Drive\shell\manage-bde" /v "LegacyDisable" /f
Reg.exe delete "HKCR\Drive\shell\resume-bde" /v "LegacyDisable" /f
Reg.exe delete "HKCR\Drive\shell\resume-bde-elev" /v "LegacyDisable" /f
Reg.exe delete "HKCR\Drive\shell\encrypt-bde" /v "LegacyDisable" /f
Reg.exe delete "HKCR\Drive\shell\encrypt-bde-elev" /v "LegacyDisable" /f
Reg.exe delete "HKCR\Drive\shell\unlock-bde" /v "LegacyDisable" /f
Reg.exe add "HKCR\Drive\shell\lock-bde" /v "AppliesTo" /t REG_SZ /d "System.Volume.BitLockerProtection:=1 OR System.Volume.BitLockerProtection:=3 OR System.Volume.BitLockerProtection:=5 NOT C:" /f
Reg.exe add "HKCR\Drive\shell\lock-bde" /ve /t REG_SZ /d "Lock Drive" /f
Reg.exe add "HKCR\Drive\shell\lock-bde" /v "HasLUAShield" /t REG_SZ /d "" /f
Reg.exe add "HKCR\Drive\shell\lock-bde" /v "MultiSelectModel" /t REG_SZ /d "Single" /f
Reg.exe add "HKCR\Drive\shell\lock-bde\command" /ve /t REG_EXPAND_SZ /d "wscript.exe lock-bde.vbs %%1" /f
Reg.exe add "HKCR\Drive\shell\suspend-bde" /ve /t REG_SZ /d "Suspend BitLocker protection" /f
Reg.exe add "HKCR\Drive\shell\suspend-bde" /v "AppliesTo" /t REG_SZ /d "(System.Volume.BitLockerProtection:=System.Volume.BitLockerProtection#On" /f
Reg.exe add "HKCR\Drive\shell\suspend-bde" /v "HasLUAShield" /t REG_SZ /d "" /f
Reg.exe add "HKCR\Drive\shell\suspend-bde" /v "MultiSelectModel" /t REG_SZ /d "Single" /f
Reg.exe add "HKCR\Drive\shell\suspend-bde\command" /ve /t REG_EXPAND_SZ /d "wscript.exe suspend-bde.vbs %%1" /f
Reg.exe add "HKCR\Drive\shell\decrypt-bde" /ve /t REG_SZ /d "Turn off BitLocker" /f
Reg.exe add "HKCR\Drive\shell\decrypt-bde" /v "AppliesTo" /t REG_SZ /d "(System.Volume.BitLockerProtection:=System.Volume.BitLockerProtection#On" /f
Reg.exe add "HKCR\Drive\shell\decrypt-bde" /v "HasLUAShield" /t REG_SZ /d "" /f
Reg.exe add "HKCR\Drive\shell\decrypt-bde" /v "MultiSelectModel" /t REG_SZ /d "Single" /f
Reg.exe add "HKCR\Drive\shell\decrypt-bde\command" /ve /t REG_EXPAND_SZ /d "wscript.exe decrypt-bde.vbs %%1" /f
ECHO.
ECHO  ^=^> Press Any Key To Go Context Menu
PAUSE >nul
GOTO Context_Menu



:add_scan_defneder
Reg.exe add "HKCR\*\shellex\ContextMenuHandlers\EPP" /ve /t REG_SZ /d "{09A47860-11B0-4DA5-AFA5-26D86198A780}" /f
Reg.exe add "HKCR\CLSID\{09A47860-11B0-4DA5-AFA5-26D86198A780}\InprocServer32" /ve /t REG_SZ /d "C:\Program Files\Windows Defender\shellext.dll" /f
Reg.exe add "HKCR\CLSID\{09A47860-11B0-4DA5-AFA5-26D86198A780}\InprocServer32" /v "ThreadingModel" /t REG_SZ /d "Apartment" /f
Reg.exe add "HKCR\CLSID\{09A47860-11B0-4DA5-AFA5-26D86198A780}\Version" /ve /t REG_SZ /d "10.0.18362.1" /f
Reg.exe add "HKCR\Directory\shellex\ContextMenuHandlers\EPP" /ve /t REG_SZ /d "{09A47860-11B0-4DA5-AFA5-26D86198A780}" /f
Reg.exe add "HKCR\Drive\shellex\ContextMenuHandlers\EPP" /ve /t REG_SZ /d "{09A47860-11B0-4DA5-AFA5-26D86198A780}" /f
ECHO.
ECHO  ^=^> Press Any Key To Go Context Menu
PAUSE >nul
GOTO Context_Menu




:add_personalize_classic
Reg.exe add "HKCR\DesktopBackground\Shell\ClassicPersonalize" /v "Icon" /t REG_SZ /d "themecpl.dll" /f
Reg.exe add "HKCR\DesktopBackground\Shell\ClassicPersonalize" /v "MUIVerb" /t REG_SZ /d "Personalize (Classic)" /f
Reg.exe add "HKCR\DesktopBackground\Shell\ClassicPersonalize" /v "Position" /t REG_SZ /d "Bottom" /f
Reg.exe add "HKCR\DesktopBackground\Shell\ClassicPersonalize" /v "SubCommands" /t REG_SZ /d "" /f
Reg.exe add "HKCR\DesktopBackground\Shell\ClassicPersonalize\shell\01 Theme Settings" /v "MUIVerb" /t REG_SZ /d "Theme Settings" /f
Reg.exe add "HKCR\DesktopBackground\Shell\ClassicPersonalize\shell\01 Theme Settings" /v "ControlPanelName" /t REG_SZ /d "Microsoft.Personalization" /f
Reg.exe add "HKCR\DesktopBackground\Shell\ClassicPersonalize\shell\01 Theme Settings" /v "Icon" /t REG_SZ /d "themecpl.dll" /f
Reg.exe add "HKCR\DesktopBackground\Shell\ClassicPersonalize\shell\01 Theme Settings\command" /ve /t REG_SZ /d "explorer shell:::{ED834ED6-4B5A-4bfe-8F11-A626DCB6A921}" /f
Reg.exe add "HKCR\DesktopBackground\Shell\ClassicPersonalize\shell\02 Desktop Background" /v "Icon" /t REG_SZ /d "imageres.dll,-110" /f
Reg.exe add "HKCR\DesktopBackground\Shell\ClassicPersonalize\shell\02 Desktop Background" /v "MUIVerb" /t REG_SZ /d "Desktop Background" /f
Reg.exe add "HKCR\DesktopBackground\Shell\ClassicPersonalize\shell\02 Desktop Background" /v "CommandFlags" /t REG_DWORD /d "32" /f
Reg.exe add "HKCR\DesktopBackground\Shell\ClassicPersonalize\shell\02 Desktop Background\command" /ve /t REG_SZ /d "explorer shell:::{ED834ED6-4B5A-4bfe-8F11-A626DCB6A921} -Microsoft.Personalization\pageWallpaper" /f
Reg.exe add "HKCR\DesktopBackground\Shell\ClassicPersonalize\shell\03 Color and Appearance" /v "Icon" /t REG_SZ /d "themecpl.dll" /f
Reg.exe add "HKCR\DesktopBackground\Shell\ClassicPersonalize\shell\03 Color and Appearance" /v "MUIVerb" /t REG_SZ /d "Color and Appearance" /f
Reg.exe add "HKCR\DesktopBackground\Shell\ClassicPersonalize\shell\03 Color and Appearance\command" /ve /t REG_SZ /d "explorer shell:::{ED834ED6-4B5A-4bfe-8F11-A626DCB6A921} -Microsoft.Personalization\pageColorization" /f
Reg.exe add "HKCR\DesktopBackground\Shell\ClassicPersonalize\shell\04 Sounds" /v "Icon" /t REG_SZ /d "SndVol.exe,-101" /f
Reg.exe add "HKCR\DesktopBackground\Shell\ClassicPersonalize\shell\04 Sounds" /v "MUIVerb" /t REG_SZ /d "Sounds" /f
Reg.exe add "HKCR\DesktopBackground\Shell\ClassicPersonalize\shell\04 Sounds\command" /ve /t REG_SZ /d "rundll32.exe shell32.dll,Control_RunDLL mmsys.cpl,,2" /f
Reg.exe add "HKCR\DesktopBackground\Shell\ClassicPersonalize\shell\05 Screen Saver Settings" /v "Icon" /t REG_SZ /d "PhotoScreensaver.scr" /f
Reg.exe add "HKCR\DesktopBackground\Shell\ClassicPersonalize\shell\05 Screen Saver Settings" /v "MUIVerb" /t REG_SZ /d "Screen Saver Settings" /f
Reg.exe add "HKCR\DesktopBackground\Shell\ClassicPersonalize\shell\05 Screen Saver Settings\command" /ve /t REG_SZ /d "rundll32.exe shell32.dll,Control_RunDLL desk.cpl,,1" /f
Reg.exe add "HKCR\DesktopBackground\Shell\ClassicPersonalize\shell\06 Desktop Icon Settings" /v "Icon" /t REG_SZ /d "desk.cpl" /f
Reg.exe add "HKCR\DesktopBackground\Shell\ClassicPersonalize\shell\06 Desktop Icon Settings" /v "MUIVerb" /t REG_SZ /d "Desktop Icon Settings" /f
Reg.exe add "HKCR\DesktopBackground\Shell\ClassicPersonalize\shell\06 Desktop Icon Settings" /v "CommandFlags" /t REG_DWORD /d "32" /f
Reg.exe add "HKCR\DesktopBackground\Shell\ClassicPersonalize\shell\06 Desktop Icon Settings\command" /ve /t REG_SZ /d "rundll32.exe shell32.dll,Control_RunDLL desk.cpl,,0" /f
Reg.exe add "HKCR\DesktopBackground\Shell\ClassicPersonalize\shell\07 Mouse Pointers" /v "Icon" /t REG_SZ /d "main.cpl" /f
Reg.exe add "HKCR\DesktopBackground\Shell\ClassicPersonalize\shell\07 Mouse Pointers" /v "MUIVerb" /t REG_SZ /d "Mouse Pointers" /f
Reg.exe add "HKCR\DesktopBackground\Shell\ClassicPersonalize\shell\07 Mouse Pointers\command" /ve /t REG_SZ /d "rundll32.exe shell32.dll,Control_RunDLL main.cpl,,1" /f
Reg.exe add "HKCR\DesktopBackground\Shell\ClassicPersonalize\shell\08 Notification Area Icons" /v "Icon" /t REG_SZ /d "taskbarcpl.dll,-1" /f
Reg.exe add "HKCR\DesktopBackground\Shell\ClassicPersonalize\shell\08 Notification Area Icons" /v "MUIVerb" /t REG_SZ /d "Notification Area Icons" /f
Reg.exe add "HKCR\DesktopBackground\Shell\ClassicPersonalize\shell\08 Notification Area Icons" /v "CommandFlags" /t REG_DWORD /d "32" /f
Reg.exe add "HKCR\DesktopBackground\Shell\ClassicPersonalize\shell\08 Notification Area Icons\command" /ve /t REG_SZ /d "explorer shell:::{05d7b0f4-2121-4eff-bf6b-ed3f69b894d9}" /f
Reg.exe add "HKCR\DesktopBackground\Shell\ClassicPersonalize\shell\09 System Icons" /v "Icon" /t REG_SZ /d "taskbarcpl.dll,-1" /f
Reg.exe add "HKCR\DesktopBackground\Shell\ClassicPersonalize\shell\09 System Icons" /v "MUIVerb" /t REG_SZ /d "System Icons" /f
Reg.exe add "HKCR\DesktopBackground\Shell\ClassicPersonalize\shell\09 System Icons\command" /ve /t REG_SZ /d "explorer shell:::{05d7b0f4-2121-4eff-bf6b-ed3f69b894d9} \SystemIcons,,0" /f

Reg.exe add "HKCR\CLSID\{580722ff-16a7-44c1-bf74-7e1acd00f4f9}" /ve /t REG_SZ /d "Personalization (classic)" /f
Reg.exe add "HKCR\CLSID\{580722ff-16a7-44c1-bf74-7e1acd00f4f9}" /v "InfoTip" /t REG_SZ /d "@%%SystemRoot%%\System32\themecpl.dll,-2#immutable1" /f
Reg.exe add "HKCR\CLSID\{580722ff-16a7-44c1-bf74-7e1acd00f4f9}" /v "System.ApplicationName" /t REG_SZ /d "Microsoft.Personalization" /f
Reg.exe add "HKCR\CLSID\{580722ff-16a7-44c1-bf74-7e1acd00f4f9}" /v "System.ControlPanel.Category" /t REG_DWORD /d "1" /f
Reg.exe add "HKCR\CLSID\{580722ff-16a7-44c1-bf74-7e1acd00f4f9}" /v "System.Software.TasksFileUrl" /t REG_SZ /d "Internal" /f
Reg.exe add "HKCR\CLSID\{580722ff-16a7-44c1-bf74-7e1acd00f4f9}\DefaultIcon" /ve /t REG_SZ /d "%%SystemRoot%%\System32\themecpl.dll,-1" /f
Reg.exe add "HKCR\CLSID\{580722ff-16a7-44c1-bf74-7e1acd00f4f9}\Shell\Open\command" /ve /t REG_SZ /d "explorer shell:::{ED834ED6-4B5A-4bfe-8F11-A626DCB6A921}" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel\NameSpace\{580722ff-16a7-44c1-bf74-7e1acd00f4f9}" /ve /t REG_SZ /d "Personalization (classic)" /f
ECHO.
ECHO  ^=^> Press Any Key To Go Context Menu
PAUSE >nul
GOTO Context_Menu









::::::::::::::::::::::
::					::
::		System		::
::					::
::::::::::::::::::::::
:System
CLS
COLOR 0E
ECHO.
ECHO 			=========================
ECHO 			^|^| MagicX Toolbox v%Current_Version% ^|^|
ECHO 			=========================
ECHO.
ECHO  1. Enable Large System Cache (Only for 8GB+ RAM Users)
ECHO  2. Disable Large System Cache 
ECHO  3. Enable Large Icon Cache (4MB)
ECHO  4. Enable Large Icon Cache (8MB)
ECHO  5. Disable Large Icon Cache (Default=500KB)
ECHO  6. Enable Hibernation (Recommended)
ECHO  7. Disable Hibernation
ECHO  8. HELP (Description of All Above Tweaks)
ECHO  H. Main Menu
ECHO.





CHOICE /C:12345678H /N /M "Enter your choice: "

ECHO.

IF ERRORLEVEL 9 GOTO Main_Menu
IF ERRORLEVEL 8 GOTO sys_help
IF ERRORLEVEL 7 GOTO ds_hibernate
IF ERRORLEVEL 6 GOTO en_hibernate
IF ERRORLEVEL 5 GOTO ds_large_icn_cache
IF ERRORLEVEL 4 GOTO en_large_icn_cache_8mb
IF ERRORLEVEL 3 GOTO en_large_icn_cache_4mb
IF ERRORLEVEL 2 GOTO ds_large_sys_cache
IF ERRORLEVEL 1 GOTO en_large_sys_cache





:en_large_sys_cache
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d "1" /f
ECHO.
ECHO  ^=^> Please Restart Windows to Apply This Tweak
ECHO  ^=^> Press Any Key To Go System Menu
PAUSE >nul
GOTO System




:ds_large_sys_cache
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d "1" /f
ECHO.
ECHO  ^=^> Please Restart Windows to Apply This Tweak
ECHO  ^=^> Press Any Key To Go System Menu
PAUSE >nul
GOTO System




:en_large_icn_cache_4mb
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "Max Cached Icons" /t REG_SZ /d "4096" /f
ECHO.
ECHO  ^=^> Please Restart Windows to Apply This Tweak
ECHO  ^=^> Press Any Key To Go System Menu
PAUSE >nul
GOTO System


:en_large_icn_cache_8mb
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "Max Cached Icons" /t REG_SZ /d "8192" /f
ECHO.
ECHO  ^=^> Please Restart Windows to Apply This Tweak
ECHO  ^=^> Press Any Key To Go System Menu
PAUSE >nul
GOTO System


:ds_large_icn_cache
Reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "Max Cached Icons" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /f
ECHO.
ECHO  ^=^> Please Restart Windows to Apply This Tweak
ECHO  ^=^> Press Any Key To Go System Menu
PAUSE >nul
GOTO System




:en_hibernate
powercfg.exe /h off
ECHO  SUCCESS: Hibernation Enabled
ECHO.
ECHO  ^=^> Please Restart Windows to Apply This Tweak
ECHO  ^=^> Press Any Key To Go System Menu
PAUSE >nul
GOTO System




:ds_hibernate
powercfg.exe /h on
ECHO  SUCCESS: Hibernation Disabled
ECHO.
ECHO  ^=^> Please Restart Windows to Apply This Tweak
ECHO  ^=^> Press Any Key To Go System Menu
PAUSE >nul
GOTO System




:sys_help
ECHO  ^=^> "Large System Cache" Make system faster but uses more RAM.
ECHO       Thats why use it only if you have 8GB or more RAM.
ECHO.
ECHO  ^=^> "Large Icon Cache" Help system and system icons load faster.
ECHO        Use the one works best for you.
ECHO.
ECHO  ^=^> "Hibernation" uses 3GB~6GB of space(HDD/SSD) for fastboot/sleep mode.
ECHO       However if you disable this option PC boot time will be incresed.
ECHO.
ECHO  ^=^> Press Any Key To Choose Option
PAUSE >nul
GOTO System









::::::::::::::::::::::::::
::						::
::		Download		::
::						::
::::::::::::::::::::::::::
:Downloads
CLS
COLOR 0E
SET DL_REPO=https://github.com/Ahsan400/MagicX_Mod_Files/raw/master/Windows_10/Apps
SET DESKTOP=%UserProfile%\Desktop
IF EXIST "%DESKTOP%\Apps" GOTO Start_Downloads
MD "%DESKTOP%\Apps"

:Start_Downloads
ECHO.
ECHO 			=========================
ECHO 			^|^| MagicX Toolbox v%Current_Version% ^|^|
ECHO 			=========================
ECHO.
ECHO.
ECHO  ^=^> All apps should be latest. Because I update all apps once in a week.
ECHO  ^=^> Antivirus may show false alerm for some apps. Don't worry about it.
ECHO.
ECHO  1. Adguard Premium
ECHO  2. AIMP Audio Player
ECHO  3. Betternet VPN
ECHO  4. Google Chrome
ECHO  5. Mozila Firefox
ECHO  6. DU Meter
ECHO  7. Driver Booster Repack
ECHO  8. IDM with Patch
ECHO  9. Dolby Home Theater v4
ECHO  A. MEGA Link Downloader
ECHO  B. Notepad++
ECHO  C. Old Calculator
ECHO  D. Sublime Text
ECHO  E. uTorrent Repack
ECHO  F. qBittorrent
ECHO  G. qBittorrent Dark
ECHO  H. Main Menu
ECHO.





CHOICE /C:123456789ABCDEFGH /N /M "Enter your choice: "

ECHO.

IF ERRORLEVEL 17 GOTO Main_Menu
IF ERRORLEVEL 16 GOTO qBittorrent_Dark
IF ERRORLEVEL 15 GOTO qBittorrent
IF ERRORLEVEL 14 GOTO uTorrent_Repack
IF ERRORLEVEL 13 GOTO Sublime_Text
IF ERRORLEVEL 12 GOTO Old_Calculator
IF ERRORLEVEL 11 GOTO npp
IF ERRORLEVEL 10 GOTO MEGA_Link_Downloader
IF ERRORLEVEL 9 GOTO Dolby_HT
IF ERRORLEVEL 8 GOTO IDM
IF ERRORLEVEL 7 GOTO Driver_Booster_Repack
IF ERRORLEVEL 6 GOTO DU_Meter
IF ERRORLEVEL 5 GOTO Firefox
IF ERRORLEVEL 4 GOTO Chrome
IF ERRORLEVEL 3 GOTO Betternet_VPN
IF ERRORLEVEL 2 GOTO AIMP_Audio_Player
IF ERRORLEVEL 1 GOTO Adguard_Premium





:Adguard_Premium
CD "%DESKTOP%"
ECHO  ^=^> Adguard Premium Downloading.....
powershell.exe -Command wget %DL_REPO%/Adguard_Premium.zip -OutFile Apps\Adguard_Premium.zip
ECHO  ^=^> SUCCESS: Download Complete
ECHO  ^=^> Check "Apps" folder in Desktop
ECHO.
ECHO  ^=^> Press Any Key To Enter Options
PAUSE >nul
GOTO Downloads




:AIMP_Audio_Player
CD "%DESKTOP%"
ECHO  ^=^> AIMP Audio Player Downloading.....
powershell.exe -Command wget %DL_REPO%/AIMP_Audio_Player.exe -OutFile Apps\AIMP_Audio_Player.exe
ECHO  ^=^> SUCCESS: Download Complete
ECHO  ^=^> Check "Apps" folder in Desktop
ECHO.
ECHO  ^=^> Press Any Key To Enter Options
PAUSE >nul
GOTO Downloads




:Betternet_VPN
CD "%DESKTOP%"
ECHO  ^=^> Betternet VPN Downloading.....
powershell.exe -Command wget %DL_REPO%/Betternet_VPN_Premium.msi -OutFile Apps\Betternet_VPN_Premium.msi
ECHO  ^=^> SUCCESS: Download Complete
ECHO  ^=^> Check "Apps" folder in Desktop
ECHO.
ECHO  ^=^> Press Any Key To Enter Options
PAUSE >nul
GOTO Downloads




:Chrome
CD "%DESKTOP%"
ECHO  ^=^> Google Chrome Downloading.....
powershell.exe -Command wget %DL_REPO%/Chrome.exe -OutFile Apps\Chrome.exe
ECHO  ^=^> SUCCESS: Download Complete
ECHO  ^=^> Check "Apps" folder in Desktop
ECHO.
ECHO  ^=^> Press Any Key To Enter Options
PAUSE >nul
GOTO Downloads




:Firefox
CD "%DESKTOP%"
ECHO  ^=^> Mozila Firefox Downloading.....
powershell.exe -Command wget %DL_REPO%/Firefox.exe -OutFile Apps\Firefox.exe
ECHO  ^=^> SUCCESS: Download Complete
ECHO  ^=^> Check "Apps" folder in Desktop
ECHO.
ECHO  ^=^> Press Any Key To Enter Options
PAUSE >nul
GOTO Downloads




:DU_Meter
CD "%DESKTOP%"
ECHO  ^=^> DU Meter Downloading.....
powershell.exe -Command wget %DL_REPO%/DU_Meter.rar -OutFile Apps\DU_Meter.rar
ECHO  ^=^> SUCCESS: Download Complete
ECHO  ^=^> Check "Apps" folder in Desktop
ECHO.
ECHO  ^=^> Press Any Key To Enter Options
PAUSE >nul
GOTO Downloads




:Driver_Booster_Repack
CD "%DESKTOP%"
ECHO  ^=^> Driver Booster Repack Downloading.....
powershell.exe -Command wget %DL_REPO%/Driver_Booster_Repack.exe -OutFile Apps\Driver_Booster_Repack.exe
ECHO  ^=^> SUCCESS: Download Complete
ECHO  ^=^> Check "Apps" folder in Desktop
ECHO.
ECHO  ^=^> Press Any Key To Enter Options
PAUSE >nul
GOTO Downloads




:IDM
CD "%DESKTOP%"
ECHO  ^=^> IDM with Patch Downloading.....
powershell.exe -Command wget %DL_REPO%/IDM.zip -OutFile Apps\IDM.zip
ECHO  ^=^> SUCCESS: Download Complete
ECHO  ^=^> Check "Apps" folder in Desktop
ECHO.
ECHO  ^=^> Press Any Key To Enter Options
PAUSE >nul
GOTO Downloads




:Dolby_HT
CD "%DESKTOP%"
ECHO  ^=^> Dolby Home Theater v4 Downloading.....
powershell.exe -Command wget https://github.com/Ahsan400/MagicX_Mod_Files/raw/master/Windows_10/Mods/Dolby_Home_Theatre_v4.7z -OutFile Apps\Dolby_Home_Theatre_v4.7z
ECHO  ^=^> SUCCESS: Download Complete
ECHO  ^=^> Check "Apps" folder in Desktop
ECHO.
ECHO  ^=^> Press Any Key To Enter Options
PAUSE >nul
GOTO Downloads




:MEGA_Link_Downloader
CD "%DESKTOP%"
ECHO  ^=^> MEGA Link Downloader Downloading.....
powershell.exe -Command wget %DL_REPO%/MEGA_Link_Downloader.exe -OutFile Apps\MEGA_Link_Downloader.exe
ECHO  ^=^> SUCCESS: Download Complete
ECHO  ^=^> Check "Apps" folder in Desktop
ECHO.
ECHO  ^=^> Press Any Key To Enter Options
PAUSE >nul
GOTO Downloads




:npp
CD "%DESKTOP%"
ECHO  ^=^> Notepad++ Downloading.....
powershell.exe -Command wget %DL_REPO%/npp.exe -OutFile Apps\npp.exe
ECHO  ^=^> SUCCESS: Download Complete
ECHO  ^=^> Check "Apps" folder in Desktop
ECHO.
ECHO  ^=^> Press Any Key To Enter Options
PAUSE >nul
GOTO Downloads




:Old_Calculator
CD "%DESKTOP%"
ECHO  ^=^> Old Calculator Downloading.....
powershell.exe -Command wget %DL_REPO%/Old_Calculator_for_Windows_10.exe -OutFile Apps\Old_Calculator_for_Windows_10.exe
ECHO  ^=^> SUCCESS: Download Complete
ECHO  ^=^> Check "Apps" folder in Desktop
ECHO.
ECHO  ^=^> Press Any Key To Enter Options
PAUSE >nul
GOTO Downloads




:Sublime_Text
CD "%DESKTOP%"
ECHO  ^=^> Sublime Text Downloading.....
powershell.exe -Command wget %DL_REPO%/Sublime_Text.exe -OutFile Apps\Sublime_Text.exe
ECHO  ^=^> SUCCESS: Download Complete
ECHO  ^=^> Check "Apps" folder in Desktop
ECHO.
ECHO  ^=^> Press Any Key To Enter Options
PAUSE >nul
GOTO Downloads




:uTorrent_Repack
CD "%DESKTOP%"
ECHO  ^=^> uTorrent Repack Downloading.....
powershell.exe -Command wget %DL_REPO%/uTorrent_Repack.exe -OutFile Apps\uTorrent_Repack.exe
ECHO  ^=^> SUCCESS: Download Complete
ECHO  ^=^> Check "Apps" folder in Desktop
ECHO.
ECHO  ^=^> Press Any Key To Enter Options
PAUSE >nul
GOTO Downloads




:qBittorrent
CD "%DESKTOP%"
ECHO  ^=^> qBittorrent Downloading.....
powershell.exe -Command wget %DL_REPO%/qBittorrent.exe -OutFile Apps\qBittorrent.exe
ECHO  ^=^> SUCCESS: Download Complete
ECHO  ^=^> Check "Apps" folder in Desktop
ECHO.
ECHO  ^=^> Press Any Key To Enter Options
PAUSE >nul
GOTO Downloads




:qBittorrent_Dark
CD "%DESKTOP%"
ECHO  ^=^> qBittorrent Dark Downloading.....
powershell.exe -Command wget %DL_REPO%/qBittorrent_Dark.exe -OutFile Apps\qBittorrent_Dark.exe
ECHO  ^=^> SUCCESS: Download Complete
ECHO  ^=^> Check "Apps" folder in Desktop
ECHO.
ECHO  ^=^> Press Any Key To Enter Options
PAUSE >nul
GOTO Downloads












::::::::::::::::::::::::::::::
::							::
::		Windows Update		::
::							::
::::::::::::::::::::::::::::::
:Windows_Update
CLS
COLOR 0E
ECHO.
ECHO 			=========================
ECHO 			^|^| MagicX Toolbox v%Current_Version% ^|^|
ECHO 			=========================
ECHO.
ECHO.
ECHO  ^=^> Please Apply "After Update Tweaks" After Install Windows Update.
ECHO  ^=^> Because After You Update Windwos It Can Change all the Tweaks I Made.
ECHO  ^=^> That Might Make System Slower and MS Will Collect Data/Log From Your PC.
ECHO.
ECHO.
ECHO  1. After Update Tweaks
ECHO  2. Disable Windows Update
ECHO  3. Enable Windows Update
ECHO  H. Main Menu
ECHO.

CHOICE /C:123H /N /M "Enter your choice: "

ECHO.

IF ERRORLEVEL 4 GOTO Main_Menu
IF ERRORLEVEL 3 GOTO en_Windows_Update
IF ERRORLEVEL 2 GOTO ds_Windows_Update
IF ERRORLEVEL 1 GOTO after_update_tweaks






:after_update_tweaks
CLS
COLOR 0E
ECHO.
ECHO 			=========================
ECHO 			^|^| MagicX Toolbox v%Current_Version% ^|^|
ECHO 			=========================
ECHO.


:::::::::::::::::::::::::::
:::: Custom REG Tweaks ::::
:::::::::::::::::::::::::::

for /f "delims= " %%a in ('"wmic path win32_useraccount where name='%UserName%' get sid"') do (
   if not "%%a"=="SID" (          
      set SID=%%a
      goto :Start_Tweaks
   )   
)

:Start_Tweaks



:: Clear PageFile At Shutdown 
ECHO  ^=^> Clear PageFile At Shutdown 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "ClearPageFileAtShutdown" /t REG_DWORD /d "1" /f
ECHO.
ECHO.
ECHO.


:: Cortana Tweaks.reg 
ECHO  ^=^> Cortana Tweaks
Reg.exe add "HKU\%SID%\Software\Microsoft\Windows Search" /v "CortanaConsent" /t REG_DWORD /d "0" /f
Reg.exe add "HKU\%SID%\Software\Microsoft\Personalization\Settings" /v "AcceptedPrivacyPolicy" /t REG_DWORD /d "0" /f
Reg.exe add "HKU\%SID%\Software\Microsoft\InputPersonalization" /v "RestrictImplicitInkCollection" /t REG_DWORD /d "1" /f
Reg.exe add "HKU\%SID%\Software\Microsoft\InputPersonalization" /v "RestrictImplicitTextCollection" /t REG_DWORD /d "1" /f
Reg.exe add "HKU\%SID%\Software\Microsoft\InputPersonalization\TrainedDataStore" /v "HarvestContacts" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowSearchToUseLocation" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "DisableWebSearch" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchUseWeb" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCloudSearch" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Speech_OneCore\Preferences" /v "ModelDownloadAllowed" /t REG_DWORD /d "0" /f
ECHO.
ECHO.
ECHO.




:: Disable Adv ID.reg 
ECHO  ^=^> Disable Adv ID
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKU\%SID%\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d "0" /f
ECHO.
ECHO.
ECHO.




:: Disable adv with bt.reg 
ECHO  ^=^> Disable adv with bt
Reg.exe add "HKLM\SOFTWARE\Microsoft\PolicyManager\current\device\Bluetooth" /v "AllowAdvertising" /t REG_DWORD /d "0" /f
ECHO.
ECHO.
ECHO.




:: Disable App Auto Update.reg 
ECHO  ^=^> Disable App Auto Update
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsStore\WindowsUpdate" /v "AutoDownload" /t REG_DWORD /d "2" /f
ECHO.
ECHO.
ECHO.




:: Disable App Telemetry.reg 
ECHO  ^=^> Disable App Telemetry
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableInventory" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableUAR" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "AITEnable" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f
ECHO.
ECHO.
ECHO.




:: Disable Apps and Icons Auto Update.reg 
ECHO  ^=^> Disable Apps and Icons Auto Update
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Device Metadata" /v "PreventDeviceMetadataFromNetwork" /t REG_DWORD /d "1" /f
ECHO.
ECHO.
ECHO.




:: Disable conducting experiment.reg 
ECHO  ^=^> Disable conducting experiment
Reg.exe add "HKLM\SOFTWARE\Microsoft\PolicyManager\current\device\System" /v "AllowExperimentation" /t REG_DWORD /d "0" /f
ECHO.
ECHO.
ECHO.




:: Disable Customer Experience Improvement.reg 
ECHO  ^=^> Disable Customer Experience Improvement
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d "0" /f
ECHO.
ECHO.
ECHO.




:: Disable Data Collections.reg 
ECHO  ^=^> Disable Data Collections
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f
ECHO.
ECHO.
ECHO.




:: Disablefeedbackreminder.reg 
ECHO  ^=^> Disable feedback reminder
Reg.exe add "HKLM\SOFTWARE\Microsoft\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f
Reg.exe add "HKU\%SID%\Software\Microsoft\Siuf\Rules" /v "NumberOfSIUFInPeriod" /t REG_DWORD /d "0" /f
Reg.exe add "HKU\%SID%\Software\Microsoft\Siuf\Rules" /v "PeriodInNanoSeconds" /t REG_DWORD /d "0" /f
ECHO.
ECHO.
ECHO.




:: Disable Gamebar.reg 
ECHO  ^=^> Disable Gamebar
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v "AllowGameDVR" /t REG_DWORD /d "0" /f
ECHO.
ECHO.
ECHO.




:: Disable Handwriting Data Sharing.reg 
ECHO  ^=^> Disable Handwriting Data Sharing
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\TabletPC" /v "PreventHandwritingDataSharing" /t REG_DWORD /d "1" /f
ECHO.
ECHO.
ECHO.




:: Disable Handwriting error reporting.reg 
ECHO  ^=^> Disable Handwriting error reporting
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\HandwritingErrorReports" /v "PreventHandwritingErrorReports" /t REG_DWORD /d "1" /f
ECHO.
ECHO.
ECHO.




:: Disable Inventory.reg 
ECHO  ^=^> Disable Inventory
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableInventory" /t REG_DWORD /d "1" /f
ECHO.
ECHO.
ECHO.




:: Disable Lockscreen fun facts, tips.reg 
ECHO  ^=^> Disable Lockscreen fun facts, tips
Reg.exe add "HKU\%SID%\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RotatingLockScreenOverlayEnabled" /t REG_DWORD /d "0" /f
ECHO.
ECHO.
ECHO.




:: Disablemalwarereportinginfotoms.reg 
ECHO  ^=^> Disable malware reporting info to MS
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\MRT" /v "DontReportInfectionInformation" /t REG_DWORD /d "1" /f
ECHO.
ECHO.
ECHO.




:: Disable MAP Auto Download.reg 
ECHO  ^=^> Disable MAP Auto Download
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Maps" /v "AutoDownloadAndUpdateMapData" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Maps" /v "AllowUntriggeredNetworkTrafficOnSettingsPage" /t REG_DWORD /d "0" /f
ECHO.
ECHO.
ECHO.




:: Disable MAP Data Auto Download.reg 
ECHO  ^=^> Disable MAP Data Auto Download
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Maps" /v "AutoDownloadAndUpdateMapData" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Maps" /v "AllowUntriggeredNetworkTrafficOnSettingsPage" /t REG_DWORD /d "0" /f
ECHO.
ECHO.
ECHO.




:: Disable More Telemetry.reg 
ECHO  ^=^> Disable More Telemetry
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "AITEnable" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableInventory" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableUAR" /t REG_DWORD /d "1" /f
ECHO.
ECHO.
ECHO.




:: Disable MS Products Auto Update.reg 
ECHO  ^=^> Disable MS Products Auto Update
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Services\7971f918-a847-4430-9279-4a52d1efe18d" /v "RegisteredWithAU" /t REG_DWORD /d "0" /f
ECHO.
ECHO.
ECHO.




:: Disable Peernet for windows 10 update.reg 
ECHO  ^=^> Disable Peernet for windows 10 update
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Peernet" /v "Disabled" /t REG_DWORD /d "0" /f
ECHO.
ECHO.
ECHO.




:: Disable People from taskbar.reg 
ECHO  ^=^> Disable People from taskbar
Reg.exe add "HKU\%SID%\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" /v "PeopleBand" /t REG_DWORD /d "0" /f
ECHO.
ECHO.
ECHO.




:: Disable Report Collection.reg 
ECHO  ^=^> Disable Report Collection
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\MRT" /v "DontReportInfectionInformation" /t REG_DWORD /d "1" /f
ECHO.
ECHO.
ECHO.




:: Disable Smart Screen.reg 
ECHO  ^=^> Disable Smart Screen
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableSmartScreen" /t REG_DWORD /d "0" /f
ECHO.
ECHO.
ECHO.




:: Disable store app auto install.reg 
ECHO  ^=^> Disable store app auto install
Reg.exe add "HKU\%SID%\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalledAppsEnabled" /t REG_DWORD /d "0" /f
ECHO.
ECHO.
ECHO.




:: Disablesubmittingsampledatatoms.reg 
ECHO  ^=^> Disable submitting sample data to MS
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v "SubmitSamplesConsent" /t REG_DWORD /d "2" /f
ECHO.
ECHO.
ECHO.




:: Disable Sync.reg 
ECHO  ^=^> Disable Sync
Reg.exe add "HKU\%SID%\Software\Microsoft\Windows\CurrentVersion\SettingSync" /v "BackupPolicy" /t REG_DWORD /d "60" /f
Reg.exe add "HKU\%SID%\Software\Microsoft\Windows\CurrentVersion\SettingSync" /v "DeviceMetadataUploaded" /t REG_DWORD /d "0" /f
Reg.exe add "HKU\%SID%\Software\Microsoft\Windows\CurrentVersion\SettingSync" /v "SettingsVersion" /t REG_DWORD /d "1" /f
Reg.exe add "HKU\%SID%\Software\Microsoft\Windows\CurrentVersion\SettingSync" /v "PriorLogons" /t REG_DWORD /d "1" /f
Reg.exe add "HKU\%SID%\Software\Microsoft\Windows\CurrentVersion\SettingSync" /v "SyncPolicy" /t REG_DWORD /d "5" /f
Reg.exe add "HKU\%SID%\Software\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Accessibility" /v "SettingsVersion" /t REG_DWORD /d "3" /f
Reg.exe add "HKU\%SID%\Software\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Accessibility" /v "Enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKU\%SID%\Software\Microsoft\Windows\CurrentVersion\SettingSync\Groups\AppSync" /v "Enabled" /t REG_DWORD /d "1" /f
Reg.exe add "HKU\%SID%\Software\Microsoft\Windows\CurrentVersion\SettingSync\Groups\BrowserSettings" /v "Enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKU\%SID%\Software\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Credentials" /v "SettingsVersion" /t REG_DWORD /d "3" /f
Reg.exe add "HKU\%SID%\Software\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Credentials" /v "Enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKU\%SID%\Software\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Language" /v "SettingsVersion" /t REG_DWORD /d "3" /f
Reg.exe add "HKU\%SID%\Software\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Language" /v "Enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKU\%SID%\Software\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Personalization" /v "SettingsVersion" /t REG_DWORD /d "3" /f
Reg.exe add "HKU\%SID%\Software\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Personalization" /v "Enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKU\%SID%\Software\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Windows" /v "SettingsVersion" /t REG_DWORD /d "3" /f
Reg.exe add "HKU\%SID%\Software\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Windows" /v "Enabled" /t REG_DWORD /d "0" /f
ECHO.
ECHO.
ECHO.




:: Disable Telementry.reg 
ECHO  ^=^> Disable Telementry
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\WMI\Autologger\AutoLogger-Diagtrack-Listener" /v "Start" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\dmwappushservice" /v "Start" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\DiagTrack" /v "Start" /t REG_DWORD /d "4" /f
ECHO.
ECHO.
ECHO.




:: Disable Text message cloud backup.reg 
ECHO  ^=^> Disable Text message cloud backup
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Messaging" /v "AllowMessageSync" /t REG_DWORD /d "0" /f
ECHO.
ECHO.
ECHO.




:: Disable Transmission of typing info.reg 
ECHO  ^=^> Disable Transmission of typing info
Reg.exe add "HKU\%SID%\Software\Microsoft\Input\TIPC" /v "Enabled" /t REG_DWORD /d "0" /f
ECHO.
ECHO.
ECHO.




:: Disable Windows Speech Update.reg 
ECHO  ^=^> Disable Windows Speech Update
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Speech" /v "AllowSpeechModelUpdate" /t REG_DWORD /d "0" /f
ECHO.
ECHO.
ECHO.




:: Disable Windows Update Peer.reg 
ECHO  ^=^> Disable Windows Update Peer
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v "DODownloadMode" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization" /v "DODownloadMode" /t REG_DWORD /d "0" /f
Reg.exe add "HKU\%SID%\Software\Microsoft\Windows\CurrentVersion\DeliveryOptimization" /v "SystemSettingsDownloadMode" /t REG_DWORD /d "0" /f
ECHO.
ECHO.
ECHO.




:: Disbale Camera In LockScreen.reg 
ECHO  ^=^> Disbale Camera In LockScreen
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Personalization" /v "NoLockScreenCamera" /t REG_DWORD /d "1" /f
ECHO.
ECHO.
ECHO.




:: Disbale Handwritting Error data.reg 
ECHO  ^=^> Disbale Handwritting Error data
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\HandwritingErrorReports" /v "PreventHandwritingErrorReports" /t REG_DWORD /d "1" /f
ECHO.
ECHO.
ECHO.




:: EDGE Patches.reg 
ECHO  ^=^> EDGE Patches
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge" /v "PreventFirstRunPage" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main" /v "AllowPrelaunch" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\PhishingFilter" /v "EnabledV9" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Security" /v "FlashClickToRunMode" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\TabPreloader" /v "AllowTabPreloading" /t REG_DWORD /d "0" /f
ECHO.
ECHO.
ECHO.




:: Enable Driver Update.reg 
ECHO  ^=^> Enable Driver Update
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DriverSearching" /v "DriverUpdateWizardWuSearchEnabled" /t REG_DWORD /d "1" /f
ECHO.
ECHO.
ECHO.




:: Enable full TPM owner authorization.reg 
ECHO  ^=^> Enable full TPM owner authorization
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\TPM" /v "OSManagedAuthLevel" /t REG_DWORD /d "5" /f
ECHO.
ECHO.
ECHO.




:: Force 100% Net.reg 
ECHO  ^=^> Force to use 100% Net
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Psched" /v "NonBestEffortLimit" /t REG_DWORD /d "0" /f
ECHO.
ECHO.
ECHO.




:: LocationTweaks.reg
ECHO  ^=^> Location Tweaks
:: Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v "DisableLocation" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v "DisableWindowsLocationProvider" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v "DisableLocationScripting" /t REG_DWORD /d "1" /f
ECHO.
ECHO.
ECHO.




:: Long Path.reg 
ECHO  ^=^> Long Path
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "LongPathsEnabled" /t REG_DWORD /d "1" /f
ECHO.
ECHO.
ECHO.




:: NoLockScreenCamera.reg 
ECHO  ^=^> No LockScreen Camera
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Personalization" /v "NoLockScreenCamera" /t REG_DWORD /d "1" /f
ECHO.
ECHO.
ECHO.




:: OneDrive Tweaks.reg 
ECHO  ^=^> OneDrive Tweaks
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /v "DisableFileSyncNGSC" /t REG_DWORD /d "1" /f
ECHO.
ECHO.
ECHO.




:: PreventHandwritingDataSharing.reg 
ECHO  ^=^> Prevent Handwriting Data Sharing
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\TabletPC" /v "PreventHandwritingDataSharing" /t REG_DWORD /d "1" /f
ECHO.
ECHO.
ECHO.





:: Reg Pack.reg 
:: SpeedUp logon
ECHO  ^=^> SpeedUp logon
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Serialize" /v "StartupDelayInMSec" /t REG_DWORD /d "0" /f
ECHO.
ECHO.
ECHO.




:: Disable Thumbsdb on network drives
ECHO  ^=^> Disable Thumbsdb on network drives
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "DisableThumbsDBOnNetworkFolders" /t REG_DWORD /d "1" /f
ECHO.
ECHO.
ECHO.




:: Disable Windows Feedback
ECHO  ^=^> Disable Windows Feedback
Reg.exe add "HKCU\SOFTWARE\Microsoft\Siuf\Rules" /v "NumberOfSIUFInPeriod" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Siuf\Rules" /v "PeriodInNanoSeconds" /t REG_DWORD /d "0" /f
ECHO.
ECHO.
ECHO.




:: disable narrator
ECHO  ^=^> Disable Narrator
Reg.exe add "HKCU\Software\Microsoft\Narrator\NoRoam" /v "WinEnterLaunchEnabled" /t REG_DWORD /d "0" /f
ECHO.
ECHO.
ECHO.




::  Office Telemetry/Disable data collection for Telemetry Agent
ECHO  ^=^> Office Telemetry/Disable data collection for Telemetry Agent
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\Common" /v "sendcustomerdata" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\Common\Feedback" /v "enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\Common\Feedback" /v "includescreenshot" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\Outlook\Options\Mail" /v "EnableLogging" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\Word\Options" /v "EnableLogging" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Office\Common\ClientTelemetry" /v "DisableTelemetry" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\Common" /v "qmenable" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\Common" /v "updatereliabilitydata" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\Common\General" /v "shownfirstrunoptin" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\Common\General" /v "skydrivesigninoption" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\Common\ptwatson" /v "ptwoptin" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\Firstrun" /v "disablemovie" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\OSM" /v "Enablelogging" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\OSM" /v "EnableUpload" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\OSM\preventedapplications" /v "accesssolution" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\OSM\preventedapplications" /v "olksolution" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\OSM\preventedapplications" /v "onenotesolution" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\OSM\preventedapplications" /v "pptsolution" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\OSM\preventedapplications" /v "projectsolution" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\OSM\preventedapplications" /v "publishersolution" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\OSM\preventedapplications" /v "visiosolution" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\OSM\preventedapplications" /v "wdsolution" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\OSM\preventedapplications" /v "xlsolution" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\OSM\preventedsolutiontypes" /v "agave" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\OSM\preventedsolutiontypes" /v "appaddins" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\OSM\preventedsolutiontypes" /v "comaddins" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\OSM\preventedsolutiontypes" /v "documentfiles" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Office\16.0\OSM\preventedsolutiontypes" /v "templatefiles" /t REG_DWORD /d "1" /f
ECHO.
ECHO.
ECHO.




:: Disable cortana but keep search
ECHO  ^=^> Disable cortana but keep search
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "PreventIndexOnBattery" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowSearchToUseLocation" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchUseWeb" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "DisableWebSearch" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "PreventIndexingOutlook" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "PreventIndexingEmailAttachments" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchPrivacy" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchSafeSearch" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchUseWebOverMeteredConnections" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "PreventRemoteQueries" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "DisableRemovableDriveIndexing" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchUseWeb" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "BingSearchEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "CortanaConsent" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowSearchToUseLocation" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCloudSearch" /t REG_DWORD /d "0" /f
ECHO.
ECHO.
ECHO.




:: Disable Ads In Windows 10 File Explorer
ECHO  ^=^> Disable Ads In Windows 10 File Explorer
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSyncProviderNotifications" /t REG_DWORD /d "0" /f
ECHO.
ECHO.
ECHO.




:: Disable online tips and help for Settings app
ECHO  ^=^> Disable online tips and help for Settings app
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "AllowOnlineTips" /t REG_DWORD /d "0" /f
ECHO.
ECHO.
ECHO.




:: Disable Activity history
ECHO  ^=^> Disable Activity history
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "PublishUserActivities" /t REG_DWORD /d "0" /f
ECHO.
ECHO.
ECHO.




:: Hide Microsoft Edge button in IE
ECHO  ^=^> Hide Microsoft Edge button in IE
Reg.exe add "HKCU\SOFTWARE\Policies\Microsoft\Internet Explorer\Main" /v "HideNewEdgeButton" /t REG_DWORD /d "1" /f
ECHO.
ECHO.
ECHO.




:: Remove Games
ECHO  ^=^> Remove Games
Reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\GameUX\Games\{FC96B68C-09EF-4251-A598-19E4BE1B76A9}" /f
ECHO.
ECHO.
ECHO.




:: Remove Shortcut text
ECHO  ^=^> Remove _Shortcut text From Shortcut
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "link" /t REG_BINARY /d "00000000" /f
ECHO.
ECHO.
ECHO.




:: telemetry
ECHO  ^=^> Disable Telemetry
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\MRT" /v "DontOfferThroughWUAU" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\MRT" /v "DontReportInfectionInformation" /t REG_DWORD /d "1" /f
ECHO.
ECHO.
ECHO.




:: Disable Windows Error Reporting current user
ECHO  ^=^> Disable Windows Error Reporting current user
Reg.exe add "HKCU\Software\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d "1" /f
ECHO.
ECHO.
ECHO.






:: WCMP Policy.reg 
ECHO  ^=^> WCMP Policy
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Internet Settings" /v "CallLegacyWCMPolicies" /t REG_DWORD /d "0" /f
ECHO.
ECHO.
ECHO.




:: Wndows Search Tweaks.reg 
ECHO  ^=^> Wndows Search Tweaks
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowSearchToUseLocation" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "DisableWebSearch" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchUseWeb" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCloudSearch" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d "0" /f
ECHO.
ECHO.
ECHO.





ECHO.
ECHO  ^=^> Operation SUCCESSFUL
ECHO  ^=^> Press Any Key To Go Windows Update Settings
PAUSE >nul 2>&1
GOTO Windows_Update
















:ds_Windows_Update
ECHO Disabling Windows Update....
net stop wuauserv >nul 2>&1
sc config wuauserv start= disabled
net stop wuauserv >nul 2>&1
ECHO.
ECHO  ^=^> Press Any Key To Go Windows Update Settings
PAUSE >nul
GOTO Windows_Update




:en_Windows_Update
ECHO Enabling Windows Update....
sc config wuauserv start= demand
net start wuauserv >nul 2>&1
ECHO.
ECHO  ^=^> Press Any Key To Go Windows Update Settings
PAUSE >nul
GOTO Windows_Update









::::::::::::::::::::::::::
::						::
::		Report Bug		::
::						::
::::::::::::::::::::::::::
:Report_Bugs
CLS
COLOR 0E
ECHO.
ECHO 			=========================
ECHO 			^|^| MagicX Toolbox v%Current_Version% ^|^|
ECHO 			=========================
ECHO.
ECHO.
ECHO.
ECHO  ^=^> Facebook: @Ahsan400
ECHO  ^=^> Telegram: @Ahsan400
ECHO  ^=^> Email: help.ahsan@gmail.com
ECHO  ^=^> TG Group: https:\\t.me\MagicXMod
ECHO.
ECHO.
ECHO  ^=^> Send me BUG details with ScreenShot through any option here.
ECHO  [Any Key] Main Menu
PAUSE >nul
GOTO Main_Menu





::::::::::::::::::::::::::::::
::							::
::		Check Updates		::
::							::
::::::::::::::::::::::::::::::
:Check_Update
:: After Click Check Update
CLS
ECHO.
ECHO 				============================
ECHO 				^|^| MagicX Toolbox Updater ^|^|
ECHO 				============================
ECHO.
COLOR 03
CD /d %~dp0
ECHO  ^=^> Checking For New Update.....
powershell.exe -nologo -noprofile -Command wget https://github.com/Ahsan400/MagicX_Mod_Files/raw/master/MagicX_Toolbox/Updater/ToolBox_Update.zip -OutFile Update.zip
powershell.exe -nologo -noprofile -command "& { Add-Type -A 'System.IO.Compression.FileSystem'; [IO.Compression.ZipFile]::ExtractToDirectory('Update.zip', 'Update'); }"
If Exist "%CD%\Update\%Current_Version%.bat" GOTO NoUpdate
If Exist "%CD%\Update\*.bat" GOTO Update
GOTO UpdateError



:Update
CLS
COLOR 0E
ECHO.
ECHO 				===========================
ECHO 				^|^| New Update Available! ^|^|
ECHO 				===========================
ECHO.
ECHO.
ECHO  ^=^> Update Process will Start in 5s. Please Don't Close App While it Updating. 
TIMEOUT /t 5 >nul
CLS
CSCRIPT /B /Nologo "%CD%\Updater.vbs"
EXIT













:NoUpdate
RMDIR /S /Q "%CD%\Update"
DEL "%CD%\Update.zip"
CLS
COLOR 0A
ECHO.
ECHO 				=====================================
ECHO 				^|^| You Are Using The Latest Update ^|^|
ECHO 				=====================================
ECHO.
ECHO  ^=^> Press Any Key To Go Home
PAUSE >nul
GOTO Main_Menu







:UpdateError
CLS
COLOR 0C
ECHO.
ECHO 		======================================================================
ECHO 		^|^| Unexpected Error Occurred. Please Check Your Internet Connection ^|^|
ECHO 		======================================================================
ECHO.
ECHO.
ECHO  ^=^> Press Any Key To Go Home
PAUSE >nul
GOTO StartHere


:Exit
Exit
