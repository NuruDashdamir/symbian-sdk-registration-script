@echo off
color 2F
REM Script creator is "NuruDashdamir", feel free to use, share and modify :)
REM Thanks to "nikita36078" for telling me "Nokia SDKs Registration Info" path in regedit
REM Thanks to "bent" who is creator of EKA2L1 Symbian Emulator
REM If you are interested with EKA2L1 Symbian emulator, visit https://discord.gg/5Bm5SJ9

REM "wmic", "regini" and "reg" commands required for the script to work
REM Tested on Windows XP, 7, 8.1 and 10 (both x86 and x64) and dosen't require admin rights.
REM Won't work in Windows 11 because "wmic" tool is removed in Windows 11.
REM Worked for S60v3, S60v3FP1, S60v3FP2, S60v5 and S^3 SDKs.

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
echo Your S60 Emulator have 14 days trial again.
echo.
pause
