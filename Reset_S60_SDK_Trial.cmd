@echo off
color 2F
REM Script creator is "NuruTasDemir", feel free to use, share and modify :)
REM Thanks to "nikita36078" for telling me "Nokia SDKs Registration Info" path in regedit
REM Thanks to "bent" who is creator of EKA2L1 Symbian Emulator
REM If you interested in with EKA2L1 Symbian emulator visit https://discord.gg/5Bm5SJ9

REM For working "wmic", "regini" and "reg" commands required.
REM Tested on Windows 7 x64 and dont require admin rights.
REM Worked for S60v3FP2, S60v5 and S^3 SDKs. It will work for other SDKs probably. 
REM this for loop gets User Security ID and assign it to userSID variable
for /f "delims= " %%a in ('"wmic path win32_useraccount where name='%UserName%' get sid"') do (
   if not "%%a"=="SID" (          
      set userSID=%%a
      goto :loop_end
   )   
)
:loop_end

REM this echo used to create temporary text file for REGINI to edit permissions
echo \Registry\user\%userSID%\Software\Nokia\Product Registration [1 5 7 17]>temporary.txt
REGINI temporary.txt
del temporary.txt

REM this reg command deletes registry folder to reset SDK trial 
reg delete "HKEY_CURRENT_USER\Software\Nokia\Product Registration" /f
echo All registration info deleted already.
echo Your S60 Emulator have 14 days trial again.
echo.
pause