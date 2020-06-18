@ECHO OFF
::mode con:cols=78 lines=28
SET Current_Version=1.0
TITLE MagicX Toolbox v%Current_Version% by Ahsan400

:Main_Menu
CLS
COLOR 0E

CALL :Header

CALL :TWO_ECHO
ECHO  ^=^> Author: Ahsan Khan (@Ahsan400)
ECHO  ^=^> Target: Windows 10 20H1
ECHO  ^=^> TG Group: https:\\t.me\MagicXMod
ECHO  ^=^> Website: MagicXMod.github.io
CALL :TWO_ECHO
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
IF ERRORLEVEL 3 GOTO System_Menu
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
SET Menu_Name=Appearance Menu
SET Menu_Address=Appearance

CALL :Header

ECHO  ============
ECHO  ^|^| Enable ^|^|
ECHO  ============
ECHO  1. Enable Arrow Icon In Shortcut
ECHO  2. Enable Action Center 
ECHO  3. Enable Old Battery Flyout UI
ECHO  4. Enable Old Network Flyout UI
ECHO  5. Enable Old Old Volume Control Flyout UI
ECHO.
ECHO  =============
ECHO  ^|^| Disable ^|^|
ECHO  =============
ECHO  A. Disable Arrow Icon From Shortcut
ECHO  B. Disable Action Center 
ECHO  C. Disable Old Battery Flyout UI
ECHO  D. Disable Old Network Flyout UI
ECHO  E. Disable Old Old Volume Control Flyout UI
ECHO.
ECHO  H. Main Menu
ECHO.

CHOICE /C:12345ABCDEH /N /M "Enter your choice: "

ECHO.
IF ERRORLEVEL 11 GOTO Main_Menu
IF ERRORLEVEL 10 GOTO ds_old_vol_ctrl
IF ERRORLEVEL 9 GOTO ds_old_net
IF ERRORLEVEL 8 GOTO ds_old_battery
IF ERRORLEVEL 7 GOTO ds_act_cent
IF ERRORLEVEL 6 GOTO ds_arw_shtct
IF ERRORLEVEL 5 GOTO en_old_vol_ctrl
IF ERRORLEVEL 4 GOTO en_old_net
IF ERRORLEVEL 3 GOTO en_old_battery
IF ERRORLEVEL 2 GOTO en_act_cent
IF ERRORLEVEL 1 GOTO en_arw_shtct


:ds_arw_shtct
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /v "29" /t REG_SZ /d "%%systemroot%%\Blank.ico,0" /f
ECHO Restarting Windows Explorer....
taskkill /im explorer.exe /f
start explorer.exe
CAll :END_LINE


:en_arw_shtct
Reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /v "29" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /f
ECHO Restarting Windows Explorer....
taskkill /im explorer.exe /f
start explorer.exe
CAll :END_LINE


:en_act_cent
Reg.exe delete "HKCU\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v "DisableNotificationCenter" /f
Reg.exe delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v "DisableNotificationCenter" /f
CAll :END_LINE


:ds_act_cent
Reg.exe add "HKCU\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v "DisableNotificationCenter" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v "DisableNotificationCenter" /t REG_DWORD /d "1" /f
CAll :END_LINE


:en_old_battery
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\ImmersiveShell" /v "UseWin32BatteryFlyout" /t REG_DWORD /d "1" /f
CAll :END_LINE


:ds_old_battery
Reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\ImmersiveShell" /v "UseWin32BatteryFlyout" /f
CAll :END_LINE


:en_old_net
SetACL.exe -on "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Control Panel\Settings\Network" -ot reg -actn setowner -ownr "n:Administrators" >NUL 2>&1
SetACL.exe -on "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Control Panel\Settings\Network" -ot reg -actn ace -ace "n:Administrators;p:full" >NUL 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Control Panel\Settings\Network" /v "ReplaceVan" /t REG_DWORD /d "2" /f
SetACL.exe -on "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Control Panel\Settings\Network" -ot reg -actn ace -ace "n:Administrators;p:read" >NUL 2>&1
SetACL.exe -on "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Control Panel\Settings\Network" -ot reg -actn setowner -ownr "n:nt service\trustedinstaller" >NUL 2>&1
CAll :END_LINE


:ds_old_net
SetACL.exe -on "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Control Panel\Settings\Network" -ot reg -actn setowner -ownr "n:Administrators" >NUL 2>&1
SetACL.exe -on "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Control Panel\Settings\Network" -ot reg -actn ace -ace "n:Administrators;p:full" >NUL 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Control Panel\Settings\Network" /v "ReplaceVan" /t REG_DWORD /d "0" /f
SetACL.exe -on "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Control Panel\Settings\Network" -ot reg -actn ace -ace "n:Administrators;p:read" >NUL 2>&1
SetACL.exe -on "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Control Panel\Settings\Network" -ot reg -actn setowner -ownr "n:nt service\trustedinstaller" >NUL 2>&1
CAll :END_LINE


:en_old_vol_ctrl
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\MTCUVC" /v "EnableMtcUvc" /t REG_DWORD /d "0" /f
CAll :END_LINE


:ds_old_vol_ctrl
Reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\MTCUVC" /v "EnableMtcUvc" /f
CAll :END_LINE


::::::::::::::::::::::::::::::
::							::
::		Context Menu		::
::							::
::::::::::::::::::::::::::::::
:Context_Menu
CLS
SET Menu_Name=Context Menu
SET Menu_Address=Context_Menu
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
IF ERRORLEVEL 6 GOTO add_bit_locker
IF ERRORLEVEL 5 GOTO add_print
IF ERRORLEVEL 4 GOTO rmv_personalize_classic
IF ERRORLEVEL 3 GOTO rmv_scan_defender
IF ERRORLEVEL 2 GOTO rmv_bit_locker
IF ERRORLEVEL 1 GOTO rmv_print





:remove_context
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
CAll :END_LINE


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
CAll :END_LINE


:rmv_scan_defender
Reg.exe delete "HKCR\*\shellex\ContextMenuHandlers\EPP" /f
Reg.exe delete "HKCR\CLSID\{09A47860-11B0-4DA5-AFA5-26D86198A780}" /f
Reg.exe delete "HKCR\Directory\shellex\ContextMenuHandlers\EPP" /f
Reg.exe delete "HKCR\Drive\shellex\ContextMenuHandlers\EPP" /f
CAll :END_LINE


:rmv_personalize_classic
Reg.exe delete "HKCR\CLSID\{580722ff-16a7-44c1-bf74-7e1acd00f4f9}" /f
Reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel\NameSpace\{580722ff-16a7-44c1-bf74-7e1acd00f4f9}" /f
Reg.exe delete "HKCR\DesktopBackground\Shell\ClassicPersonalize" /f
CAll :END_LINE





:add_context
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
CAll :END_LINE


:add_bit_locker
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
CAll :END_LINE


:add_scan_defneder
Reg.exe add "HKCR\*\shellex\ContextMenuHandlers\EPP" /ve /t REG_SZ /d "{09A47860-11B0-4DA5-AFA5-26D86198A780}" /f
Reg.exe add "HKCR\CLSID\{09A47860-11B0-4DA5-AFA5-26D86198A780}\InprocServer32" /ve /t REG_SZ /d "C:\Program Files\Windows Defender\shellext.dll" /f
Reg.exe add "HKCR\CLSID\{09A47860-11B0-4DA5-AFA5-26D86198A780}\InprocServer32" /v "ThreadingModel" /t REG_SZ /d "Apartment" /f
Reg.exe add "HKCR\CLSID\{09A47860-11B0-4DA5-AFA5-26D86198A780}\Version" /ve /t REG_SZ /d "10.0.18362.1" /f
Reg.exe add "HKCR\Directory\shellex\ContextMenuHandlers\EPP" /ve /t REG_SZ /d "{09A47860-11B0-4DA5-AFA5-26D86198A780}" /f
Reg.exe add "HKCR\Drive\shellex\ContextMenuHandlers\EPP" /ve /t REG_SZ /d "{09A47860-11B0-4DA5-AFA5-26D86198A780}" /f
CAll :END_LINE


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
CAll :END_LINE





::::::::::::::::::::::
::					::
::		System		::
::					::
::::::::::::::::::::::
:System_Menu
CLS
COLOR 0E
SET Menu_Name=System Menu
SET Menu_Address=System_Menu

CALL :Header

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
CAll :END_LINE_RSRT


:ds_large_sys_cache
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d "1" /f
CAll :END_LINE_RSRT


:en_large_icn_cache_4mb
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "Max Cached Icons" /t REG_SZ /d "4096" /f
CAll :END_LINE_RSRT


:en_large_icn_cache_8mb
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "Max Cached Icons" /t REG_SZ /d "8192" /f
CAll :END_LINE_RSRT


:ds_large_icn_cache
Reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "Max Cached Icons" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /f
CAll :END_LINE_RSRT


:en_hibernate
powercfg.exe /h off
ECHO  SUCCESS: Hibernation Enabled
CAll :END_LINE_RSRT


:ds_hibernate
powercfg.exe /h on
ECHO  SUCCESS: Hibernation Disabled
CAll :END_LINE_RSRT


:sys_help
ECHO  ^=^> "Large System Cache" Make system faster but uses more RAM.
ECHO       Thats why use it only if you have 8GB or more RAM.
ECHO.
ECHO  ^=^> "Large Icon Cache" Help system and system icons load faster.
ECHO        Use the one works best for you.
ECHO.
ECHO  ^=^> "Hibernation" uses 3GB~6GB of space(HDD/SSD) for fastboot/sleep mode.
ECHO       However if you disable this option PC boot time will be incresed.
CALL :END_LINE








::::::::::::::::::::::::::
::						::
::		Download		::
::						::
::::::::::::::::::::::::::
:Downloads
CLS
SETLOCAL EnableExtensions
SET Menu_Name=Downloads Menu
SET Menu_Address=Downloads
COLOR 0E
SET DL_REPO=https://github.com/Ahsan400/MagicX_Mod_Files/raw/master/Windows_10/Apps
SET DESKTOP=%UserProfile%\Desktop
IF EXIST "%DESKTOP%\Apps" GOTO Start_Downloads
MD "%DESKTOP%\Apps"

:Start_Downloads
SET "App[1]=Adguard Premium"
SET "App[2]=AIMP Audio Player"
SET "App[3]=Betternet VPN"
SET "App[4]=Google Chrome"
SET "App[5]=Mozila Firefox"
SET "App[6]=DU Meter"
SET "App[7]=Iobit Driver Booster"
SET "App[8]=Internet Download Manager"
SET "App[9]=Dolby Home Theater v4"
SET "App[10]=MEGA Link Downloader"
SET "App[11]=Notepad++"
SET "App[12]=Old Calculator"
SET "App[13]=Sublime Text"
SET "App[14]=uTorrent Repack"
SET "App[15]=qBittorrent"
SET "App[16]=All Apps"
SET "App[H]=Main Menu"

:APP_Menu
CLS
ECHO.
ECHO 			=========================
ECHO 			^|^| MagicX Toolbox v%Current_Version% ^|^|
ECHO 			=========================
ECHO.
ECHO.
ECHO  ^=^> All apps should be latest. Because I update all apps once in a week.
ECHO  ^=^> Antivirus may show false alerm for some apps. Don't worry about it.
ECHO.
SET "x=0"
:App_MenuLoop
SET /a "x+=1"
IF DEFINED App[%x%] (
    CALL ECHO   %x%. %%App[%x%]%%
    GOTO App_MenuLoop
)
ECHO.
ECHO   H. Main Menu
ECHO.

:Prompt
ECHO.%Message%
ECHO  ^=^> Your can Choose Multiple Options (E.G: 1, 2, 7 or 1 2 7)
SET /p "Input=Select Options:"

IF NOT DEFINED Input GOTO Prompt
SET "Input=%Input:"=%"
SET "Input=%Input:^=%"
SET "Input=%Input:<=%"
SET "Input=%Input:>=%"
SET "Input=%Input:&=%"
SET "Input=%Input:|=%"
SET "Input=%Input:(=%"
SET "Input=%Input:)=%"
SET "Input=%Input:^==%"
CALL :App_Inp_Validate %Input%

CALL :App_Process %Input%
GOTO End


:App_Inp_Validate
SET "Next=%2"
IF not DEFINED App[%1] (
    SET "Message= INVALID INPUT: %1!"
    GOTO APP_Menu
)
IF DEFINED Next shIFt & GOTO App_Inp_Validate
GOTO :eof


:App_Process
SET "Next=%2"
CALL SET "App=%%App[%1]%%"

IF "%App%" EQU "Adguard Premium" CALL :Adguard_Premium
IF "%App%" EQU "AIMP Audio Player" CALL :AIMP_Audio_Player
IF "%App%" EQU "Betternet VPN" CALL :Betternet_VPN
IF "%App%" EQU "Google Chrome" CALL :Chrome
IF "%App%" EQU "Mozila Firefox" CALL :Firefox
IF "%App%" EQU "DU Meter" CALL :DU_Meter
IF "%App%" EQU "Iobit Driver Booster" CALL :Driver_Booster
IF "%App%" EQU "Internet Download Manager" CALL :IDM
IF "%App%" EQU "Dolby Home Theater v4" CALL :Dolby_HT
IF "%App%" EQU "MEGA Link Downloader" CALL :MEGA_Link_Downloader
IF "%App%" EQU "Notepad++" CALL :npp
IF "%App%" EQU "Old Calculator" CALL :Old_Calculator
IF "%App%" EQU "Sublime Text" CALL :Sublime_Text
IF "%App%" EQU "uTorrent Repack" CALL :uTorrent_Repack
IF "%App%" EQU "qBittorrent" CALL :qBittorrent
IF "%App%" EQU "All Apps" (
    CALL :Adguard_Premium
	CALL :AIMP_Audio_Player
	CALL :Betternet_VPN
	CALL :Chrome
	CALL :Firefox
	CALL :DU_Meter
	CALL :Driver_Booster
	CALL :IDM
	CALL :Dolby_HT
	CALL :MEGA_Link_Downloader
	CALL :npp
	CALL :Old_Calculator
	CALL :Sublime_Text
	CALL :uTorrent_Repack
	CALL :qBittorrent
)
IF "%App%" EQU "Main Menu" GOTO Main_Menu

SET "App[%1]="
IF DEFINED Next SHIFT & GOTO App_Process

ENDLOCAL
CALL :END_LINE_DNL
EXIT

:Adguard_Premium
CD "%DESKTOP%"
ECHO  ^=^> Adguard Premium Downloading.....
powershell.exe -Command wget %DL_REPO%/Adguard_Premium.zip -OutFile Apps\Adguard_Premium.zip
EXIT /B




:AIMP_Audio_Player
CD "%DESKTOP%"
ECHO  ^=^> AIMP Audio Player Downloading.....
powershell.exe -Command wget %DL_REPO%/AIMP_Audio_Player.exe -OutFile Apps\AIMP_Audio_Player.exe
EXIT /B




:Betternet_VPN
CD "%DESKTOP%"
ECHO  ^=^> Betternet VPN Downloading.....
powershell.exe -Command wget %DL_REPO%/Betternet_VPN_Premium.msi -OutFile Apps\Betternet_VPN_Premium.msi
EXIT /B




:Chrome
CD "%DESKTOP%"
ECHO  ^=^> Google Chrome Downloading.....
powershell.exe -Command wget %DL_REPO%/Chrome.exe -OutFile Apps\Chrome.exe
EXIT /B




:Firefox
CD "%DESKTOP%"
ECHO  ^=^> Mozila Firefox Downloading.....
powershell.exe -Command wget %DL_REPO%/Firefox.exe -OutFile Apps\Firefox.exe
EXIT /B




:DU_Meter
CD "%DESKTOP%"
ECHO  ^=^> DU Meter Downloading.....
powershell.exe -Command wget %DL_REPO%/DU_Meter.rar -OutFile Apps\DU_Meter.rar
EXIT /B




:Driver_Booster
CD "%DESKTOP%"
ECHO  ^=^> Driver Booster Repack Downloading.....
powershell.exe -Command wget %DL_REPO%/Driver_Booster_Repack.exe -OutFile Apps\Driver_Booster_Repack.exe
EXIT /B




:IDM
CD "%DESKTOP%"
ECHO  ^=^> IDM with Patch Downloading.....
powershell.exe -Command wget %DL_REPO%/IDM.zip -OutFile Apps\IDM.zip
EXIT /B




:Dolby_HT
CD "%DESKTOP%"
ECHO  ^=^> Dolby Home Theater v4 Downloading.....
powershell.exe -Command wget https://github.com/Ahsan400/MagicX_Mod_Files/raw/master/Windows_10/Mods/Dolby_Home_Theatre_v4.7z -OutFile Apps\Dolby_Home_Theatre_v4.7z
EXIT /B




:MEGA_Link_Downloader
CD "%DESKTOP%"
ECHO  ^=^> MEGA Link Downloader Downloading.....
powershell.exe -Command wget %DL_REPO%/MEGA_Link_Downloader.exe -OutFile Apps\MEGA_Link_Downloader.exe
EXIT /B




:npp
CD "%DESKTOP%"
ECHO  ^=^> Notepad++ Downloading.....
powershell.exe -Command wget %DL_REPO%/npp.exe -OutFile Apps\npp.exe
EXIT /B




:Old_Calculator
CD "%DESKTOP%"
ECHO  ^=^> Old Calculator Downloading.....
powershell.exe -Command wget %DL_REPO%/Old_Calculator_for_Windows_10.exe -OutFile Apps\Old_Calculator_for_Windows_10.exe
EXIT /B




:Sublime_Text
CD "%DESKTOP%"
ECHO  ^=^> Sublime Text Downloading.....
powershell.exe -Command wget %DL_REPO%/Sublime_Text.exe -OutFile Apps\Sublime_Text.exe
EXIT /B




:uTorrent_Repack
CD "%DESKTOP%"
ECHO  ^=^> uTorrent Repack Downloading.....
powershell.exe -Command wget %DL_REPO%/uTorrent_Repack.exe -OutFile Apps\uTorrent_Repack.exe
EXIT /B



:qBittorrent
CD "%DESKTOP%"
ECHO  ^=^> qBittorrent Downloading.....
powershell.exe -Command wget %DL_REPO%/qBittorrent.exe -OutFile Apps\qBittorrent.exe
EXIT /B

GOTO Downloads










::::::::::::::::::::::::::::::
::							::
::		Windows Update		::
::							::
::::::::::::::::::::::::::::::
:Windows_Update
CLS
COLOR 0E
SET Menu_Name=Windows Update Menu
SET Menu_Address=Windows_Update

CALL :Header

ECHO.
ECHO  ^=^> Please Apply "After Update Tweaks" After Install Windows Update.
ECHO  ^=^> Because After You Update Windwos It Can Change all the Tweaks I Made.
ECHO  ^=^> That Might Make System Slower and MS Will Collect Data/Log From Your PC.
CALL :TWO_ECHO
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

CALL :Header


CALL :END_LINE



:ds_Windows_Update
ECHO Disabling Windows Update....
net stop wuauserv >nul 2>&1
sc config wuauserv start= disabled
net stop wuauserv >nul 2>&1
CALL :END_LINE




:en_Windows_Update
ECHO Enabling Windows Update....
sc config wuauserv start= demand
net start wuauserv >nul 2>&1
CALL :END_LINE








::::::::::::::::::::::::::
::						::
::		Report Bug		::
::						::
::::::::::::::::::::::::::
:Report_Bugs
CLS
COLOR 0E

CALL :Header

CALL :TWO_ECHO
ECHO  ^=^> Facebook: @Ahsan400
ECHO  ^=^> Telegram: @Ahsan400
ECHO  ^=^> Email: help.ahsan@gmail.com
ECHO  ^=^> TG Group: https:\\t.me\MagicXMod
CALL :TWO_ECHO
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
CALL :TWO_ECHO
ECHO  ^=^> Update Process will Start in 5s. Please Don't Close App While it Updating. 
TIMEOUT /t 5 >nul
CLS
CSCRIPT /B /Nologo "%CD%\Updater.vbs"
EXIT



:NoUpdate
SET Menu_Name=Home
SET Menu_Address=Main_Menu
RMDIR /S /Q "%CD%\Update"
DEL "%CD%\Update.zip"
CLS
COLOR 0A
ECHO.
ECHO 				=====================================
ECHO 				^|^| You Are Using The Latest Update ^|^|
ECHO 				=====================================
CALL :END_LINE



:UpdateError
SET Menu_Name=Home
SET Menu_Address=Main_Menu
CLS
COLOR 0C
ECHO.
ECHO 		======================================================================
ECHO 		^|^| Unexpected Error Occurred. Please Check Your Internet Connection ^|^|
ECHO 		======================================================================
ECHO.
CALL :END_LINE







:Exit
Exit

:END_LINE
ECHO.
ECHO  ^=^> Press Any Key To Go %Menu_Name%
PAUSE >NUL 2>&1
GOTO %Menu_Address%

:END_LINE_RSRT
ECHO.
ECHO  ^=^> Please Restart Windows to Apply This Tweak
ECHO  ^=^> Press Any Key To Go %Menu_Name%
PAUSE >NUL 2>&1
GOTO %Menu_Address%

:END_LINE_DNL
ECHO.
ECHO  ^=^> SUCCESS: Download Complete
ECHO  ^=^> Check "Apps" folder in Desktop
ECHO.
ECHO  ^=^> Press Any Key To Enter Options
PAUSE >NUL 2>&1
GOTO %Menu_Address%


:CNTXT_Menu_Fig
SET "x=0"
:CNTXT_Var_Loop
SET /a "x+=1"
IF "%x%" NEQ "%OPT_AMOUNT%" (
    CALL SET "CNTXT[%x%]=%%CNTXT_OPT%x%%%"
    GOTO CNTXT_Var_Loop
)

SET "CNTXT[H]=Main Menu"

:CNTXT_Menu

SET "x=0"
:CNTXT_MenuLoop
SET /a "x+=1"
IF DEFINED CNTXT[%x%] (
    CALL ECHO   %x%. %%CNTXT[%x%]%%
    GOTO CNTXT_MenuLoop
)
ECHO.
ECHO   H. Main Menu
ECHO.

:Prompt
ECHO.%Message%
ECHO  ^=^> Your can Choose Multiple Options (E.G: 1, 2, 7 or 1 2 7)
SET /p "Input=Select Options:"

IF NOT DEFINED Input GOTO Prompt
SET "Input=%Input:"=%"
SET "Input=%Input:^=%"
SET "Input=%Input:<=%"
SET "Input=%Input:>=%"
SET "Input=%Input:&=%"
SET "Input=%Input:|=%"
SET "Input=%Input:(=%"
SET "Input=%Input:)=%"
SET "Input=%Input:^==%"
CALL :CNTXT_Inp_Validate %Input%

CALL :CNTXT_Process %Input%
GOTO End


:CNTXT_Inp_Validate
SET "Next=%2"
IF not DEFINED CNTXT[%1] (
    SET "Message= INVALID INPUT: %1!"
    GOTO CNTXT_Menu
)
IF DEFINED Next shIFt & GOTO CNTXT_Inp_Validate
GOTO :eof


:CNTXT_Process
SET "Next=%2"
CALL SET "CNTXT=%%CNTXT[%1]%%"

IF "%CNTXT%" EQU "%CNTXT_OPT1%" CALL :%OPT_ADRS1%
IF "%CNTXT%" EQU "%CNTXT_OPT2%" CALL :%OPT_ADRS2%
IF "%CNTXT%" EQU "%CNTXT_OPT3%" CALL :%OPT_ADRS3%
IF "%CNTXT%" EQU "%CNTXT_OPT4%" CALL :%OPT_ADRS4%
IF "%CNTXT%" EQU "%CNTXT_OPT5%" CALL :%OPT_ADRS5%
IF "%CNTXT%" EQU "%CNTXT_OPT6%" CALL :%OPT_ADRS6%
IF "%CNTXT%" EQU "%CNTXT_OPT7%" CALL :%OPT_ADRS7%
IF "%CNTXT%" EQU "%CNTXT_OPT8%" CALL :%OPT_ADRS8%
IF "%CNTXT%" EQU "%CNTXT_OPT9%" CALL :%OPT_ADRS9%
IF "%CNTXT%" EQU "%CNTXT_OPT10%" CALL :%OPT_ADRS10%
IF "%CNTXT%" EQU "%CNTXT_OPT11%" CALL :%OPT_ADRS11%
IF "%CNTXT%" EQU "%CNTXT_OPT12%" CALL :%OPT_ADRS12%
IF "%CNTXT%" EQU "%CNTXT_OPT13%" CALL :%OPT_ADRS13%
IF "%CNTXT%" EQU "%CNTXT_OPT14%" CALL :%OPT_ADRS14%
IF "%CNTXT%" EQU "%CNTXT_OPT15%" CALL :%OPT_ADRS15%
IF "%CNTXT%" EQU "%CNTXT_OPT16%" CALL :%OPT_ADRS16%
IF "%CNTXT%" EQU "Main Menu" GOTO Main_Menu

SET "CNTXT[%1]="
IF DEFINED Next SHIFT & GOTO CNTXT_Process

ENDLOCAL
EXIT /B

:Header
ECHO.
ECHO 			=========================
ECHO 			^|^| MagicX Toolbox v%Current_Version% ^|^|
ECHO 			=========================
ECHO.
EXIT /B

:THREE_ECHO
ECHO.
ECHO.
ECHO.
EXIT /B

:TWO_ECHO
ECHO.
ECHO.
EXIT /B
