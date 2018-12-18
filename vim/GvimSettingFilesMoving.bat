@echo off
title AD's Gvim Setting Files Moving
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
echo Step 01. Gvim �׸�, vimrc, vim ���� �̵�
echo ------------------------------------------------------
set "VIMPATH=C:\Program Files (x86)\Vim\vim80"
copy "colors"	"%VIMPATH%\colors"
copy "syntax"	"%VIMPATH%\syntax\"

copy ctags58.exe 				"%VIMPATH%\ctags.exe"

copy source_cmd.vim				"%USERPROFILE%\_vimrc"

setx EDITOR gvim

git clone https://github.com/VundleVim/Vundle.vim.git %USERPROFILE%/vimfiles/
echo.
:EXIT
echo ------------------------------------------------------
if %READY% == YES	echo ���� ������ �Ϸ�Ǿ����ϴ�.
if %READY% == NO	echo ���� ������ ��ҵǾ����ϴ�.
echo (���Ḧ ���Ͻø� �ƹ� Ű�� ��������...)
echo ------------------------------------------------------
pause > nul
