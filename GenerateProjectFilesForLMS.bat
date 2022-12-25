@echo off
VERIFY ON

set Regstr=reg query "HKEY_CURRENT_USER\Software\Epic Games\Unreal Engine\Builds"  /V 5.1_HH
set ProjectName=UnrealEditerPractice
set ProjectPath=%cd%
set EnginePath=

%Regstr%
if %errorlevel%==1 (goto KeyError)

for /f "tokens=3" %%a in ('%Regstr%  ^|findstr /ri "REG_SZ"') do set EnginePath=%%a

echo.
echo ##########################################
echo Engine Path : %EnginePath%
echo Project Path : %ProjectPath%
echo Project Name : %ProjectName%
echo ##########################################
echo.
call %EnginePath%\\GenerateProjectFiles.bat -2019 -project="%ProjectPath%\%ProjectName%.uproject" -Game -Engine
pause
exit 0

:KeyError
ECHO "Not found engine path.."
pause