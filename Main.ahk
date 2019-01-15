;###############################################################
; AD's HotKey
;###############################################################

;---------------------------------------------------------------
;		Serial Code
;---------------------------------------------------------------
SetWorkingDir, %A_ScriptDir%
global isGuiOn	:= True
myMotto(1000)

google_drive = %USERPROFILE%\Google ����̺�
PID_BROWSINGMODE := 0

IfInString, A_ScriptName, .ahk, {
	ext = ahk
} else {
	ext = exe
}

Main         = Main.%ext%
BrowsingMode = BrowsingMode.%ext%


If (A_UserName != "hyungjun.an") {
    isOffice := False
    google_homeID_num := 0
}
else {
    isOffice := True
    google_homeID_num := 1
}

SetCapsLockState, off
SetScrollLockState, off

alarm()

;---------------------------------------------------------------
;		Hot Key
;---------------------------------------------------------------
$!^r:: Reload

; Suspend & Control Mode
$!^a:: 
	Suspend, Toggle
	destroyAllGui()
	if (A_IsSuspended) {
		suspend_notice()
		isGuiOn := false
    	programSwitch(PID_BROWSINGMODE, BrowsingMode, "off")
	}
	else {
		isGuiOn := True
		myMotto(400)
	}
	Return

;$!^a::programSwitch(PID_BROWSINGMODE, BrowsingMode)
    
; f.lux & AHK Alarm Switch
#v::
	if (isGuiOn) {
		myMotto(500)
		isGuiOn := False
	}
	else {
		isGuiOn := True
		myMotto(500)
	}
	Return
    ;Process, Exist, flux.exe
    ;PID := ErrorLevel
    ;Process, Close, flux.exe
    ;Run, %USERPROFILE%\AppData\Local\FluxSoftware\Flux\flux.exe
    ;while !InStr(WinTitle, "f.lux")
    ;    WinGetTitle, WinTitle, A
    ;WinWaitActive, %WinTitle%
    ;if PID {
    ;    WinClose, %WinTitle%
    ;}
    ;else {
    ;    Send, !{F4}
    ;}
    ;return

;------------------------------------
; Folder
;------------------------------------
!^z::
	if (isOffice) {
		Run, %USERPROFILE%\Downloads
	}
	else {
		Run, %google_drive%
	}
	return
!^,::
	if (isOffice) {
		Run, %USERPROFILE%\Desktop\Library
	}
	else {
		Run, %google_drive%\Library
	}
	return

!^g::Run, %A_ScriptDir%

!^+r::Run, shell:RecycleBinFolder 

!^+e:: Run, %USERPROFILE%\AppData\Local\lxss\home\hyungjun

$#d:: Run, %USERPROFILE%\Desktop

; DropBox
!^b::Run, Z:\\

;------------------------------------
; Program
;------------------------------------
$!^u:: runOrActivateWin("_memo.md", 	false, "gvim %USERPROFILE%\desktop\_memo.md")
;$!^m::Run, C:\Users\kysung\desktop\hyungjun_office\memo.xlsx
$!^v:: runOrActivateWin("vimrc_AD.vim",	false, "gvim vim\vimrc_AD.vim")
$!^+v::runOrActivateWin("_vimrc", 		false, "gvim %USERPROFILE%\_vimrc")
!^+g:: 
	subName = %A_ScriptName%
	cmd		= gvim %A_ScriptName%"
	runOrActivateWin(subName, false, cmd)
	return
$!^e:: Run, C:\Program Files\Git\git-bash.exe
;$!^e::Run, C:\Program Files\ConEmu\ConEmu64.exe -Dir %USERPROFILE%

#z::
    Run, SnippingTool
    WinWait, ĸó ����
    WinActivate, ĸó ����
    while (ErrorLevel) {
    }
	Send, ^n
    Return
    
!^c::
	runOrActivateWin("- chrome", false, "chrome")
    myMotto(1000)
    return

; PuTTY
!^p::
    Run, C:\Program Files\PuTTY\putty.exe
    WinWaitActive, PuTTY Configuration, , 2
    if !ErrorLevel
        Send, !e{Tab}{Down}
    return

; XNote Timer
!^t::
    Process, Exist, xntimer.exe
    if !ErrorLevel {
        Run, %google_drive%\Utility\XNote_Timer\xntimer.exe
        WinWaitActive, XNote Timer, , 2
        Send, ^{F2}
    }
    else
        Send, {F6}
    return

; Internet Explorer
!^+i::
!^i::runOrActivateWin("- Internet Explorer", false, "iexplore.exe")

;Edit Time
!^+t::Run, chrome.exe --profile-directory="Profile 1" --app-id=mdkfiefeoimmobmhdimachkfcpkgahlc

;Window Media Player
!^+p::  Run, wmplayer

;Notepad++
!^[::   runOrActivateWin("- notepad++", false, "notepad++")

;Visual Studio Code
!^]::   Run, C:\Program Files\Microsoft VS Code\Code.exe

; KakaoTalk or LG ep
!^`;::
	If !isOffice {
		IfExist, C:\Program Files (x86)\Kakao
			Run, C:\Program Files (x86)\Kakao\KakaoTalk\KakaoTalk.exe
		else
			Run, C:\Program Files\Kakao\KakaoTalk\KakaoTalk.exe
	}
	else {
		runOrActivateWin("lg ep", false, "chrome.exe -new-window ep.lge.com")
	}
	return

; SystemSettings.exe
$!^s:: Run, ms-settings:bluetooth

;------------------------------------
; Web Page
;------------------------------------
!^n::   Run, http://www.naver.com/more.html
$#n::   Run, http://www.senaver.com
!^o:: 
    subName = Google Keep
    URL = https://keep.google.com
    Title := openOrActivateUrl(subName, false, URL, true)
    W := 398
    WinMove, %Title%, , A_screenWidth - W, 0, W, 1078
    return

!^d::
	if (!isOffice) {
		openOrActivateUrl("Gmail", false, "https://mail.google.com/mail")
	} else {
		cmd = %USERPROFILE%/Desktop/Library/URL_lnk/mail
		runOrActivateWin("EP Mail", false, cmd)
	}
	return 

$!^f::  openOrActivateUrl("Google Ķ����", false, "https://calendar.google.com/calendar/b/" . google_homeID_num . "/r")
!^+z::  Run, https://drive.google.com/drive/u/%google_homeID_num%/my-drive
!^+b::  Run, https://www.dropbox.com/home

!^8:: 	
	subName = �� - <
	cmd = %USERPROFILE%/Desktop/Library/URL_lnk/p0
	runOrActivateWin(subName, false, cmd)
	return
!^9::   
	if (isOffice) {
		subName = MY Iss
		cmd = %USERPROFILE%/Desktop/Library/URL_lnk/p1
		runOrActivateWin(subName, false, cmd)
	} else {
		subName =
		URL     = https://translate.google.com/?hl=ko
		openOrActivateUrl(subName, false, URL)
	}
	return
!^0::
	if (isOffice) {
		subName = hj_Q
		cmd = %USERPROFILE%/Desktop/Library/URL_lnk/p2
		runOrActivateWin(subName, false, cmd)
	} else {
		subName = 
		URL     = https://scholar.google.co.kr/
		openOrActivateUrl(subName, false, URL)
	}
	return

!^q:: 
    subName = ���� �������
    URL = http://small.dic.daum.net/index.do?dic=eng
    Title := openOrActivateUrl(subName, false, URL, true)
    W = 389
    H = 420
    WinMove, %Title%, , A_screenWidth - W, A_screenHeight - H, W, H
    return

;------------------------------------
; YouTube
;------------------------------------
!^x:: Run, https://www.youtube.com/results?search_query=�+�뷡
!^y:: openOrActivateUrl("YouTube", false, "https://www.youtube.com/")
!^+y::openOrActivateUrl("YouTube", false, "https://www.youtube.com/channel/UC4n_ME6BVRofHr4fVoBTdNg")

openOrActivateUrl(subName, isFullMatching, URL, isCancelingFullScreen=false) {
	cmd = chrome.exe --app=%URL%
	Title := runOrActivateWin(subName, isFullMatching, cmd, isCancelingFullScreen)
	return Title
}
runOrActivateWin(subName, isFullMatching, cmd, isCancelingFullScreen=false) {
	Title := findWindow(subName, isFullMatching)
	if !Title {
		Run, %cmd%
		while !Title {
			Title := findWindow(subName, isFullMatching)
		}
		WinActivate, %Title%
		if isCancelingFullScreen {
			Send, #{Down}
			sleep, 200
		}
	}
	WinActivate, %Title%
	return Title
}

findWindow(subName, isFullMatching) {
    WinGet windows, List
    Loop %windows% {
    	id := windows%A_Index%
    	WinGetTitle Title, ahk_id %id%
		if (isFullMatching) {
        	if (Title=%subName%) {
            	return %Title%
        	}
		}
		else {
        	IfInString, Title, %subName%, {
            	return %Title%
        	}
		}
    }
    return ""
}

;------------------------------------
; Key & System
;------------------------------------
Capslock::Ctrl
!^+c::Capslock

!^Space:: Send {Home}+{End}
#,::Send {backspace}
#.::Send {delete}

+Esc::Send ~
$Esc::
$`::  keySwap_ifInTitle("XNote Timer", "!{F4}", "{Esc}")
$!Esc::
$!`:: Send ``
$Space::keySwap_ifInTitle("XNote Timer", "^{F2}", "{Space}")
$Enter::keySwap_ifInTitle("XNote Timer", "^{F3}", "{Enter}")

$^+b::keySwap_ifInTitle("Chrome", "^+b!+t{F6}", "^+b")

^#m:: Send {AppsKey}
^#s:: Send {F2}
!^w:: Send !{F4}

; For Right Hand
$PrintScreen:: Send, ^x
$ScrollLock:: Send, ^c
$Pause:: Send, ^v
RShift & PrintScreen:: Send, ^z
RShift & Pause:: Send, ^+z
LShift & PrintScreen:: Send, {PrintScreen}
LShift & ScrollLock:: Send, {ScrollLock}
LShift & Pause:: Send, {Pause}

; Virtual Desktop 
$^#w:: Send ^#{F4}
$^#n:: Send ^#{left}
$^#p:: Send ^#{right}

; Window Positioning
!^h:: Send #{left}
!^j:: Send #{down}
!^k:: Send #{up}
!^l:: Send #{right}

#h:: Send {Left}
#j:: Send {Down}
#k:: Send {Up}
#l:: Send {Right}
^#h:: Send ^{Left}
^#j:: Send ^{Down}
^#k:: Send ^{Up}
^#l:: Send ^{Right}
+#h:: Send +{Left}
+#j:: Send +{Down}
+#k:: Send +{Up}
+#l:: Send +{Right}

#w:: Send {Home}
#s:: Send {End}
#q:: Send {PgUp}
#a:: Send {PgDn}
+#w:: Send +{Home}
+#s:: Send +{End}

$^n:: 
    If isInActiveProcessName("KakaoTalk.exe") {
        mouseMoveOnRightMid()
        Send, {WheelDown}
    }
    else
        keySwap_ifInTitle("powershell", "{Down}", "^n")
    return
$^p::
    If isInActiveProcessName("KakaoTalk.exe") {
        mouseMoveOnRightMid()
        Send, {WheelUp}
    }
    else
        keySwap_ifInTitle("powershell", "{Up}", "^p")
    return

$^#,:: 
    If isInActiveProcessName("Chrome.exe")
        Send, !{Left}
    else
        Send, ^#,
    return
$^#.:: 
    If isInActiveProcessName("Chrome.exe")
        Send, !{Right}
    else
        Send, ^#.
    return

$^BS:: Send ^+{Left }{Backspace}
!^BS:: Send ^+{Right}{Backspace}


; Sound Control
#`:: Send {Volume_Down}
#1:: Send {Volume_Up}
#2:: Send {Volume_Mute}

; Windows Always on Top Toggle
#'::
    WinGetTitle, Title, A
    WinSet, Alwaysontop, Toggle, %Title%
    return

;------------------------------------
; Display Resolution
;------------------------------------
!^+=::ChangeResolution(32,1920,1080,60)
!^+-::ChangeResolution(32,1360,768, 60)

ChangeResolution( cD, sW, sH, rR ) {
  VarSetCapacity(dM,156,0), NumPut(156,2,&dM,36)
  DllCall("EnumDisplaySettingsA", UInt,0, UInt,-1, UInt,&dM ), 
  NumPut(0x5c0000,dM,40)
  NumPut(cD,dM,104), NumPut(sW,dM,108), NumPut(sH,dM,112), NumPut(rR,dM,120)
  Return DllCall("ChangeDisplaySettingsA", UInt,&dM, UInt,0 )
}
; color_depth: The number of bits per pixel for color (leave at 32 for most purposes)
; width: width of the screen in pixels
; height: height of the screen in pixels
; refresh rate: the screen frequency (typically 60Hz, 4k: 30Hz

; Test

RShift & Left::
!^+o:: 
	testFunc(USERPROFILE . " " . A_ScriptName)
	return 
!^+u::
    WinGetTitle, Title, A
    WinGet, PID, PID, A
    WinGetPos, x, y, W, H, %Title%
    MsgBox, %Title%`n`nx:%x% y:%y% W:%W% H:%H%`n`nPID: %PID%
	MsgBox, %m_interval%
    return

testFunc(ByRef str) {
	msgBox, %str%
}

;---------------------------------------------------------------
;		Function Def.
;---------------------------------------------------------------
destroyAllGui() {
    Gui, MyMotto_GUI:Destroy
    Gui, Suspend_GUI:Destroy
    Gui, Alarm_GUI:Destroy
}
myMotto(Time) {
    y := A_screenHeight - 40

    Gui, MyMotto_GUI:Color, White
    Gui, MyMotto_GUI:-Caption +alwaysontop +ToolWindow
    Gui, MyMotto_GUI:Font, s15 cBlack, Consolas
    Gui, MyMotto_GUI:Add, Text, , True Nobility is being Superior to Your Former Self. - Hemingway

	if (isGuiOn) {
    	Gui, MyMotto_GUI:Show, y%y% NoActivate
    	Sleep, %Time%
    	Gui, MyMotto_GUI:Destroy
	}
}

suspend_notice() {
	h := 20
	w := 100
	y := 0

	Gui, Suspend_GUI:Color, Red
	Gui, Suspend_GUI:-Caption +alwaysontop +ToolWindow
	Gui, Suspend_GUI:Show, y%y% w%w% h%h% NoActivate,
	return
}

alarm_gui(sleepTime) {
	h := 40
	w := 100
	y := A_screenHeight - h

	Gui, Alarm_GUI:Color, Red
	Gui, Alarm_GUI:-Caption +alwaysontop +ToolWindow
	if (isGuiOn) {
		Gui, Alarm_GUI:Show, y%y% w%w% h%h% NoActivate,
		Sleep, %sleepTime%
		Gui, Alarm_GUI:Destroy
	}
}

alarm() {
	m_interval 		:= 10
	alarm_time 		:= 400
	alarm_interval 	:= 200
	repeat_n 		:= 10

	while True {
	    FormatTime, s, , s
	    FormatTime, m, , m
	    if !Mod(m, m_interval) {
	        Loop %repeat_n% {
	            alarm_gui(alarm_time)
	            Sleep, %alarm_interval%
	        }
	        Sleep % 60000 * m_interval - ((alarm_time + alarm_interval) * repeat_n + 200)
	    }
	    else {
	        Sleep % (60 - s) * 1000
		}
	}
}

keySwap_ifInTitle(str, key1, key2) {
    WinGetTitle, Title, A
    IfInString, Title, %str%
        Send, %key1%
    else
        Send, %key2%
}

isInActiveProcessName(str) {
    WinGet, p_name, ProcessName, A
    return, InStr(p_name, str)
}

mouseMoveOnRightMid() {
    WinGetPos, , , Width, Height, A
    x_corner := Width - 25
    y_mid    := Height // 2
    MouseMove, %x_corner%, %y_mid%, 0
}

programSwitch(ByRef PID, ByRef RunCmd, Mode := "switch") {
    if (Mode = "off" || PID) {
		Process, Close, %PID%,
		PID := 0
	}
    else if (Mode = "on" || !PID) {
        Run, %RunCmd%, , , PID
	}
}
