@echo off
echo ------------------------------------------------------
echo 	Title	: AD's Setting init batch
echo 	Author	: An, Hyungjun
echo 	E-mal	: hyungjun0429@gmail.com
echo ------------------------------------------------------
echo.
rem echo ------------------------------------------------------
rem echo 	Check Admin
rem echo ------------------------------------------------------
rem fsutil dirty query %systemdrive% > nul
rem if '%errorlevel%' NEQ '0' (		
rem     echo !!!      Please Run as Administrator      !!!
rem     goto EXIT
rem )
rem 
rem echo Done!!
rem pushd "%~dp0"

echo ------------------------------------------------------
echo 	ȯ�� ���� ����
echo ------------------------------------------------------
echo Current Path: %cd%
setx AHJ_TB "%cd%"
setx AHJ_TB_AHK "%AHJ_TB%\AHK"
setx AHJ_TB_TAR "%AHJ_TB%\TypeAndRun"
setx AHJ_TB_LIB "%AHJ_TB%\Library"
setx AHJ_TB_VIM "%AHJ_TB%\vim"

del "%USERPROFILE%\Desktop\ahk"
mklink "%USERPROFILE%\Desktop\ahk" "%AHJ_TB_AHK%\main.ahk"
echo.
echo ------------------------------------------------------
echo 	Gvim �׸�, vimrc, vim ���� �̵�
echo ------------------------------------------------------
set "VIMPATH=C:\Program Files\Vim\vim82"
copy "%AHJ_TB_VIM%\colors"	"%VIMPATH%\colors"
copy "%AHJ_TB_VIM%\syntax"	"%VIMPATH%\syntax\"
copy "%AHJ_TB_VIM%\ctags58.exe"	"%VIMPATH%\ctags.exe"

echo source %AHJ_TB_VIM%\vimrc_AD.vim > "%USERPROFILE%\_vimrc"
echo.
echo ------------------------------------------------------
echo 	Vundle �ٿ�ε�
echo ------------------------------------------------------
git clone https://github.com/VundleVim/Vundle.vim.git %USERPROFILE%/vimfiles/
echo.
echo ------------------------------------------------------
:EXIT
echo (���Ḧ ���Ͻø� �ƹ� Ű�� ��������...)
pause > nul
