@echo off
title AD's WindowsRDP and FireWall Inbound Rule Setting
rem -------------------------------------------------------
rem Author	: An, Hyungjun
rem E-mal	: hyungjun@pusan.ac.kr
rem -------------------------------------------------------
rem -------------------------------------------------------
rem Step 0. ������ ���� Ȯ��

set READY=NO
fsutil dirty query %systemdrive% > nul
if '%errorlevel%' NEQ '0' (
    echo ������ �������� �����ϼ���.	
    goto EXIT
)
pushd "%~dp0"
set READY=YES
echo.
echo ------------------------------------------------------
echo Step 01. Windows ���� ���� ����
echo ------------------------------------------------------

:QUESTION_RDPON
set user_answer=
set /p user_answer=������带 �����ϰ� Windows RDP�� ����Ͻðڽ��ϱ�?(Y/N):
if "%user_answer%" == "Y" goto RDP_ON
if "%user_answer%" == "y" goto RDP_ON
if "%user_answer%" == "N" goto SKIP_RDPON
if "%user_answer%" == "n" goto SKIP_RDPON
echo �߸� �Է��ϼ̽��ϴ�.
goto QUESTION_RDPON
:RDP_ON
powercfg.exe -change -monitor-timeout-ac 10
powercfg.exe -change -standby-timeout-ac 0
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f
:SKIP_RDPON

:QUESTION_WINRDP
set user_answer=
set /p user_answer=Windows RDP�� ��Ʈ�� �����Ͻðڽ��ϱ�?(Y/N):
if "%user_answer%" == "Y" goto WINRDP_PORT_CHANGE
if "%user_answer%" == "y" goto WINRDP_PORT_CHANGE
if "%user_answer%" == "N" goto SKIP_WINRDP_SET
if "%user_answer%" == "n" goto SKIP_WINRDP_SET
echo �߸� �Է��ϼ̽��ϴ�.
goto QUESTION_WINRDP
:WINRDP_PORT_CHANGE
netsh advfirewall firewall delete rule name="AD_RDP_Windows_TCP" > nul
netsh advfirewall firewall delete rule name="AD_RDP_Windows_UDP" > nul
set user_answer=
echo Windows ���� ���ӿ� ��Ʈ ��ȣ�� �Է��ϼ���.
set /p user_answer=
set WINRDP_PORT=%user_answer%
if "%user_answer%" == "3389" goto SKIP_FWsettings
netsh advfirewall firewall add rule name="AD_RDP_Windows_TCP" dir=in action=allow protocol=tcp localport=%WINRDP_PORT%
netsh advfirewall firewall add rule name="AD_RDP_Windows_UDP" dir=in action=allow protocol=udp localport=%WINRDP_PORT%

:SKIP_FWsettings
set "TMP_PATH=HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp"
reg add "%TMP_PATH%" /v "PortNumber" 	/t "REG_DWORD" /d %WINRDP_PORT%	/f
:SKIP_WINRDP_SET
echo.
echo ------------------------------------------------------
echo Step 02. ��ȭ�� �ιٿ�� ��Ģ �߰�
echo ------------------------------------------------------
:QUESTION_FWINB
set user_answer=
set /p user_answer=��ȭ�� �ιٿ�� ��Ģ(��Ʈ)�� �߰��Ͻðڽ��ϱ�?(Y/N):
if "%user_answer%" == "Y" goto FWINB_RULE_ADD
if "%user_answer%" == "y" goto FWINB_RULE_ADD
if "%user_answer%" == "N" goto SKIP_FWINB_SET
if "%user_answer%" == "n" goto SKIP_FWINB_SET
echo �߸� �Է��ϼ̽��ϴ�.
goto QUESTION_FWINB
:FWINB_RULE_ADD

:SET_RULE_NAME
set RULE_NAME=
echo �߰��Ͻ� ��Ģ �̸��� �Է��ϼ���.
set /p RULE_NAME=�̸�:
if "%RULE_NAME%" == "" (
	echo �߸� �Է��ϼ̽��ϴ�.
	goto SET_RULE_NAME
)
:SET_RULE_PORT
set RULE_PORT=
echo �߰��Ͻ� ��Ʈ�� �Է��ϼ���.
set /p RULE_PORT=��Ʈ:
if "%RULE_PORT%" == "" (
	echo �߸� �Է��ϼ̽��ϴ�.
	goto SET_RULE_PORT
)
netsh advfirewall firewall add rule name="%RULE_NAME%_TCP" dir=in action=allow protocol=tcp localport=%RULE_PORT%
netsh advfirewall firewall add rule name="%RULE_NAME%_UDP" dir=in action=allow protocol=udp localport=%RULE_PORT%
goto QUESTION_FWINB
:SKIP_FWINB_SET

:EXIT
echo.
echo ------------------------------------------------------
if %READY% == YES	echo ���� ������ �Ϸ�Ǿ����ϴ�.
if %READY% == NO	echo ���� ������ ��ҵǾ����ϴ�.
echo (���Ḧ ���Ͻø� �ƹ� Ű�� ��������...)
echo ------------------------------------------------------
pause > nul
