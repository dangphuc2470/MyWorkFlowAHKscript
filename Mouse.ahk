; Function to display a custom tooltip message
ShowCustomTooltip(text, duration := 3000) {
    ToolTip, %text%
    Sleep, %duration%
    ToolTip
}


; Set the initial state of the volume keys
VolumeKeysDisabled := false
MiddleButtonMode = 0

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
    F2::Send {Volume_Down}

    ; Remap F3 to Volume Up
    F3::Send {Volume_Up}

    F4::
    While GetKeyState("F4", "P") 
    {
        Send {WheelUp}
        Sleep, 50
    }
    return

    F5::
    While GetKeyState("F5", "P")
    {
        Send {WheelDown}
        Sleep, 50
    }
    return

    
    

    `::Send !{Tab}
#If




^XButton2::
if (MiddleButtonMode == 0) {
    MiddleButtonMode++
    ShowCustomTooltip("Button Code!", 1000)
} else if (MiddleButtonMode == 1)
{
    MiddleButtonMode++
    ShowCustomTooltip("Button desktop!", 1000)
}
else 
{
    MiddleButtonMode = 0
    ShowCustomTooltip("Button normal!", 1000)
}
return

#If (MiddleButtonMode == 1) ;Code
XButton1::
    Send, {Enter}
return

XButton2::
    Send !{Enter}
return

^Space::Send {Enter}
return


+Space::
CoordMode, Mouse, Screen
MouseMove, 920, 1000
Click Down
Click Up
Click, 486, 920
return
#If

#If (MiddleButtonMode == 2)
XButton1::
    Send ^#{Left}
return

XButton2::
    Send, ^#{Right}
return




#If




;Ctrl alt
;PTG
^!g::
Run, msedge.exe "https://courses.uit.edu.vn/course/view.php?id=11998"
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