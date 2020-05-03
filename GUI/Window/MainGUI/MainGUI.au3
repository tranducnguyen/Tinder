#include-once

#include "KodaGUI.au3"

;~ Hiệu chỉnh lại GUI
Func MainGUIFix()
	MainGUISet($AutoName&" v"&$AutoVersion)
	MainGUISetState()
EndFunc

;Lưu giá trị trong label xuống file
Func MainGUISave()
	Local $Pos = MainGUIGetPos()
	If $Pos[0] < 0 Then $Pos[0] = 0
	If $Pos[1] < 0 Then $Pos[1] = 0
	IniWrite($DataFile,"Setting","MainGUIX",$Pos[0])
	IniWrite($DataFile,"Setting","MainGUIY",$Pos[1])
EndFunc

;Nạp giá trị của label từ file
MainGUILoad()
Func MainGUILoad()
	Local $Pos[2] = [0,0]
	$Pos[0] = IniRead($DataFile,"Setting","MainGUIX",$Pos[0])
	$Pos[1] = IniRead($DataFile,"Setting","MainGUIY",$Pos[1])
	MainGUISetPos($Pos[0],$Pos[1])
EndFunc

;~ Chỉnh giá trị chuỗi của $MainGUI
Func MainGUIGet()
	Return WinGetTitle($MainGUI)
EndFunc
;~ Lấy giá trị từ $MainGUI
Func MainGUISet($NewValue = "")
	Local $Check = MainGUIGet()
	If $Check <> $NewValue Then WinSetTitle($MainGUI,"",$NewValue)
EndFunc


;~ Lấy vị trí và kích thước của $MainGUI
Func MainGUIGetPos()
	Return WinGetPos($MainGUI)
EndFunc
;~ Chỉnh vị trí của $MainGUI
Func MainGUISetPos($x = -1,$y = -1,$Speed=1)
	Local $Size = MainGUIGetPos()
	If Not ($x == -1) Then $Size[0] = $x
	If Not ($y == -1) Then $Size[1] = $y
	WinMove( $MainGUI, "", $Size[0],$Size[1],$Size[2],$Size[3],$Speed)
EndFunc
;~ Chỉnh kích thước của $MainGUI
Func MainGUISetSize($Width = -1,$Height = -1)
	Local $Size = MainGUIGetPos()
	If Not ($Width == -1) Then $Size[2] = $Width
	If Not ($Height == -1) Then $Size[3] = $Height
	WinMove($MainGUI,"",$Size[0],$Size[1],$Size[2],$Size[3])
EndFunc

;~ Lấy thái Window
Func MainGUIGetState()
	Return WinGetState($MainGUI)
EndFunc
Func MainGUISetState($State = @SW_SHOW)
	GUISetState($State,$MainGUI)
EndFunc

;~ Chỉnh màu nền của $MainGUI
Func MainGUIBackGround($Color = 0x000000)
	GUISetBkColor($Color,$MainGUI)
EndFunc