@echo off
title AD's Start Programs Setting
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
echo Step 01. ���� ���α׷� ���
echo ------------------------------------------------------
set "PATH01=HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run"
reg add "%PATH01%" /v "AD_HotKey"	/t "REG_SZ" /d "%USERPROFILE%\Google ����̺�\AD_Setting\Main.ahk"	/f
:EXIT
echo.
echo ------------------------------------------------------
if %READY% == YES	echo ���� ������ �Ϸ�Ǿ����ϴ�.
if %READY% == NO	echo ���� ������ ��ҵǾ����ϴ�.
echo (���Ḧ ���Ͻø� �ƹ� Ű�� ��������...)
echo ------------------------------------------------------
pause > nul
