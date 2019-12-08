@echo off
echo ------------------------------------------------------
echo 	Title	: AD's Gvim Setting Files Moving
echo 	Author	: An, Hyungjun
echo 	E-mal	: hyungjun0429@gmail.com
echo ------------------------------------------------------
echo.
echo ------------------------------------------------------
echo 	Check Admin
echo ------------------------------------------------------
fsutil dirty query %systemdrive% > nul
if '%errorlevel%' NEQ '0' (		
    echo !!!      Please Run as Administrator      !!!
    goto EXIT
)
pushd "%~dp0"
echo.
echo ------------------------------------------------------
echo 	Gvim �׸�, vimrc, vim ���� �̵�
echo ------------------------------------------------------
set "VIMPATH=C:\Program Files (x86)\Vim\vim81"
copy "colors"	"%VIMPATH%\colors"
copy "syntax"	"%VIMPATH%\syntax\"

copy ctags58.exe 				"%VIMPATH%\ctags.exe"

echo source %cd%\vimrc_AD.vim > "%USERPROFILE%\_vimrc"
echo.
echo ------------------------------------------------------
echo 	Vundle �ٿ�ε�
echo ------------------------------------------------------
git clone https://github.com/VundleVim/Vundle.vim.git %USERPROFILE%/vimfiles/
echo.
echo ------------------------------------------------------
echo (���Ḧ ���Ͻø� �ƹ� Ű�� ��������...)
:EXIT
pause > nul