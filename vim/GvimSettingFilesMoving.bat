@echo off
title AD's Gvim Setting Files Moving
rem -------------------------------------------------------
rem Author	: An, Hyungjun
rem E-mal	: hyungjun@pusan.ac.kr
rem -------------------------------------------------------
rem -------------------------------------------------------
rem Step 0. ������ ���� Ȯ��

echo ------------------------------------------------------
echo 	Gvim �׸�, vimrc, vim ���� �̵�
echo ------------------------------------------------------
set "VIMPATH=C:\Program Files (x86)\Vim\vim81"
copy "colors"	"%VIMPATH%\colors"
copy "syntax"	"%VIMPATH%\syntax\"

copy ctags58.exe 				"%VIMPATH%\ctags.exe"

copy source_cmd.vim				"%USERPROFILE%\_vimrc"

git clone https://github.com/VundleVim/Vundle.vim.git %USERPROFILE%/vimfiles/

echo ------------------------------------------------------
echo (���Ḧ ���Ͻø� �ƹ� Ű�� ��������...)
echo ------------------------------------------------------
pause > nul