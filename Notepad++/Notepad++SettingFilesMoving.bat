@echo off
title AD's Notepad++ Setting Files Moving
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
echo Step 01. Notepad++ ���� ���� �̵�
echo ------------------------------------------------------
copy "Notepad++"	"%USERPROFILE%\AppData\Roaming\Notepad++\"
echo.
:EXIT
echo ------------------------------------------------------
if %READY% == YES	echo ���� ������ �Ϸ�Ǿ����ϴ�.
if %READY% == NO	echo ���� ������ ��ҵǾ����ϴ�.
echo (���Ḧ ���Ͻø� �ƹ� Ű�� ��������...)
echo ------------------------------------------------------
pause > nul
