; Function to display a custom tooltip message
ShowCustomTooltip(text, duration := 3000) {
    UpdateTrayIcon()
    ;ToolTip, %text%
    ;ToolTip
}

UpdateTrayIcon() {
    global MouseButtonMode, VolumeKeysDisabled
    numLockState := GetKeyState("NumLock", "T") ? "off" : "on"
    volumeState := VolumeKeysDisabled ? "on" : "off"
    iconPath := "F:\App\icon\AHKicon\" . MouseButtonMode . "_" . volumeState . "_" . numLockState . ".ico"
    Menu, Tray, Icon, %iconPath%
}

; Set the initial state of the volume keys
VolumeKeysDisabled := false
MouseButtonMode = 1
UpdateTrayIcon()

; Define a hotkey to toggle the volume key functionality
^Esc::
if (VolumeKeysDisabled) {
    ; Restore normal functionality
    VolumeKeysDisabled := false
    ShowCustomTooltip("Fn lock disbled!", 1000)
} else {
    ; Enable volume key functionality
    VolumeKeysDisabled := true
    ShowCustomTooltip("Fn lock enabled!", 1000)
}
return

; Remap FN when volume keys are enabled
#If (VolumeKeysDisabled)
    ; Remap F1 to Mute
    F1::Send {Volume_Mute}

    ; Remap F2 to Volume Down
    F3::Send {Volume_Down}

    ; Remap F3 to Volume Up
    F4::Send {Volume_Up}

    F6::
    While GetKeyState("F6", "P") 
    {
        Send {WheelUp}
        Sleep, 50
    }
    return

    F7::
    While GetKeyState("F7", "P")
    {
        Send {WheelDown}
        Sleep, 50
    }
    return

    
    

    `::Send !{Tab}
    return

    ^`::Send ``
    return

#If

^MButton::
if (MouseButtonMode == 0) {
    MouseButtonMode++
    ShowCustomTooltip("Button Code!", 1000)
} else if (MouseButtonMode == 1)
{
    MouseButtonMode++
    ShowCustomTooltip("Button desktop!", 1000)
}
else 
{
    MouseButtonMode = 0
    ShowCustomTooltip("Button normal!", 1000)
}
return

^XButton2::
if (MouseButtonMode == 0) {
    MouseButtonMode++
    ShowCustomTooltip("Button Code!", 1000)
} else if (MouseButtonMode == 1)
{
    MouseButtonMode++
    ShowCustomTooltip("Button desktop!", 1000)
}
else 
{
    MouseButtonMode = 0
    ShowCustomTooltip("Button normal!", 1000)
}
return

#If (MouseButtonMode == 1) ;Code
XButton1::
    Send, {Enter}
return

XButton2::
    Send !{Enter}
return

^Space::Send {Enter}
return

; Fix chatGPT (Outdated)
; +Space::
; CoordMode, Mouse, Screen
; MouseMove, 920, 1000
; Click Down
; Click Up
; Click, 486, 920
; return
#If

;Switch desktop
#If (MouseButtonMode == 2)
XButton1::
    Send ^#{Left}
return

XButton2::
    Send, ^#{Right}
return




#If




;Ctrl alt
^!g::
Run, msedge.exe "https://gemini.google.com/app"
return

;LSD
^!l::
Run, msedge.exe "https://courses.uit.edu.vn/course/view.php?id=11781"
return

;TTTGT
^!j::
Run, msedge.exe "https://courses.uit.edu.vn/course/view.php?id=12337"
return


;HTTPB
^!h::
Run, msedge.exe "https://courses.uit.edu.vn/course/view.php?id=12114"
return

;TTDPT
^!t::
Run, msedge.exe "https://courses.uit.edu.vn/course/view.php?id=12113"
return


^!m::
Run, msedge.exe "https://www.messenger.com/"
return


^!c::
Run, msedge.exe "https://chat.openai.com/"
return


^!p::
Run, msedge.exe "https://poe.com/"
return


^!o::
Run, msedge.exe "https://github.com/dangphuc2470"
return


^!n::
Run, msedge.exe "https://mail.google.com/mail/u/0/#inbox"
return

^!b::
Run, msedge.exe "https://mail.google.com/mail/u/1/#inbox"
return

^!d::
Run, msedge.exe "https://drive.google.com/drive/u/0/my-drive"
return

^!k::
Run, "D:\App\Google Keep.lnk"
return



;Ctrl alt shift (Open in this tab)
;PTG
^!+g::
Send, ^w
Run, msedge.exe "https://courses.uit.edu.vn/course/view.php?id=11998"
return

;LSD
^!+l::
Send, ^w
Run, msedge.exe "https://courses.uit.edu.vn/course/view.php?id=11781"
return

;TTTGT
^!+j::
Send, ^w
Run, msedge.exe "https://courses.uit.edu.vn/course/view.php?id=12337"
return


;HTTPB
^!+h::
Send, ^w
Run, msedge.exe "https://courses.uit.edu.vn/course/view.php?id=12114"
return

;TTDPT
^!+t::
Send, ^w
Run, msedge.exe "https://courses.uit.edu.vn/course/view.php?id=12113"
return


^!+m::
Send, ^w
Run, msedge.exe "https://www.messenger.com/"
return


^!+c::
Send, ^w
Run, msedge.exe "https://chat.openai.com/"
return


^!+p::
Send, ^w
Run, msedge.exe "https://poe.com/"
return


^!+o::
Send, ^w
Run, msedge.exe "https://github.com/dangphuc2470"
return


^!+n::
Send, ^w
Run, msedge.exe "https://mail.google.com/mail/u/0/#inbox"
return

^!+b::
Send, ^w
Run, msedge.exe "https://mail.google.com/mail/u/1/#inbox"
return

^!+d::
Send, ^w
Run, msedge.exe "https://drive.google.com/drive/u/0/my-drive"
return



~Enter::
WinGet, activeProcess, ProcessName, A
if (activeProcess = "msedge.exe" or activeProcess = "chrome.exe")
{
    WinGetTitle, currentTitle, A
    if (InStr(currentTitle, "ChatGPT")) {
        Send, {Tab}
        Send, {Enter}
    }
}
return

NumLock::
    Send, !{PrintScreen}
    ShowIcon("F:\App\icon\AHKicon\printscreenWindow.png") ; Hiển thị icon cho chụp cửa sổ

return


F1::
    Send, {Blind}{NumLock}
    numLockState := GetKeyState("NumLock", "T") ? "disabled" : "enabled"
    ShowCustomTooltip("NumLock " numLockState, 1000)
return

^-::  ; type async
    Send, async
return

^=::  ; Ctrl and + key
    Send, await
return

^NumpadDiv::  ; Ctrl + / on the numpad
    Send, !{F4}  ; Send Alt + F4
return

; Remap PauseBreak to Play/Pause
Pause::Send {Media_Play_Pause}
return




; Định nghĩa các hotkey
$^c::
Send, ^c                           ; Gửi lại phím Ctrl+C
    ShowIcon("F:\App\icon\AHKicon\copy.png")   ; Hiển thị icon cho sao chép
    return

$^v::
Send, ^v                           ; Gửi lại phím Ctrl+V
    ShowIcon("F:\App\icon\AHKicon\paste.png")  ; Hiển thị icon cho dán
    return

$^x::
Send, ^x                           ; Gửi lại phím Ctrl+X
    ShowIcon("F:\App\icon\AHKicon\cut.png")    ; Hiển thị icon cho cắt
    return

$^z::
Send, ^z                           ; Gửi lại phím Ctrl+Z
    ShowIcon("F:\App\icon\AHKicon\undo.png")   ; Hiển thị icon cho hoàn tác
    return

$^+z::
Send, ^+z                           ; Gửi lại phím Ctrl+Shift+Z
    ShowIcon("F:\App\icon\AHKicon\redo.png")   ; Hiển thị icon cho làm lại
    return

$^s::
Send, ^s                           ; Gửi lại phím Ctrl+S
    ShowIcon("F:\App\icon\AHKicon\save.png")   ; Hiển thị icon cho lưu
    return

$PrintScreen::
    Send, {PrintScreen}                 ; Gửi lại phím PrintScreen
    ShowIcon("F:\App\icon\AHKicon\printscreen.png") ; Hiển thị icon cho chụp
    return

$!PrintScreen::
Send, !{PrintScreen}                 ; Gửi lại phím Alt+PrintScreen
    ShowIcon("F:\App\icon\AHKicon\printscreenWindow.png") ; Hiển thị icon cho chụp cửa sổ
    return


ShowIcon(iconPath) {
    ; Destroy the previous GUI if it exists
    Gui, 50:Destroy

    ; Set GUI properties
    Gui, 50:Color, EEAA99
    Gui, 50:Add, Picture, x10 y10 w32 h32 BackgroundTrans, %iconPath%
    Gui, 50:+LastFound +AlwaysOnTop +ToolWindow -Caption +E0x20
    WinSet, TransColor, EEAA99 ; Make background transparent
    Gui, 50:-Caption
    Gui, 50:Show, x10 y10 w50 h50 NoActivate

    ; Set timer to hide icon after 1 second
    SetTimer, HideIcon, -1000
    return

    ; Function to hide the icon
    HideIcon:
    Gui, 50:Destroy
    return
}


