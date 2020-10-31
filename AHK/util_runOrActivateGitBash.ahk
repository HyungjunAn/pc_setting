#include Lib_Common.ahk

if (A_Args.Length() < 1) {
	msg := "This script requires at least 1 parameters but it doesn't received`n"
	msg := msg . "ex) " . A_ScriptName . "<FILE_NAME>"
	MsgBox, %msg%
    ExitApp
}

runOrActivateGitBash(A_Args[1])

ExitApp