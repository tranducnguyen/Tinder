;~ Bấm vào $BPause
GUICtrlSetOnEvent($BPause, "BPauseClick")
Func BPauseClick()
	$AutoPause = Not $AutoPause
	If $AutoPause Then
		BPauseSet("<>")
	Else
		BPauseSet("< >")
	EndIf
EndFunc


;~ BPauseTLoad()
;~ Nạp chuỗi ngôn ngữ của 1 control
Func BPauseTLoad($ControlID = "")
    Local $Line,$Text,$File
	If $ControlID=="" Then $ControlID = "BPause"

	$Text = FT($ControlID,BPauseGet())

	BPauseSet($Text)
EndFunc

;Lưu giá trị trong label xuống file
Func BPauseSave()
	IniWrite($DataFile,"Setting","BPause",BPauseGet())
EndFunc

;Nạp giá trị của label từ file
Func BPauseLoad()
	Local $Data = IniRead($DataFile,"Setting","BPause",BPauseGet())
	BPauseSet($Data)
EndFunc

;~ Chỉnh giá trị chuỗi của $BPause
Func BPauseGet()
	Return GUICtrlRead($BPause)
EndFunc
;~ Lấy giá trị từ $BPause
Func BPauseSet($NewValue = "")
	Local $Check = BPauseGet()
	If $Check <> $NewValue Then GUICtrlSetData($BPause,$NewValue)
EndFunc


;~ Lấy vị trí và kích thước của $BPause
Func BPauseGetPos()
	Return ControlGetPos($MainGUI, "", $BPause)
EndFunc
;~ Chỉnh vị trí của $BPause
Func BPauseSetPos($x = -1,$y = -1)
	Local $Size = BPauseGetPos()
	If Not ($x == -1) Then $Size[0] = $x
	If Not ($y == -1) Then $Size[1] = $y
	GUICtrlSetPos($BPause,$Size[0],$Size[1])
EndFunc
;~ Chỉnh kích thước của $BPause
Func BPauseSetSize($Width = -1,$Height = -1)
	Local $Size = BPauseGetPos()
	If Not ($Width == -1) Then $Size[2] = $Width
	If Not ($Height == -1) Then $Size[3] = $Height
	GUICtrlSetPos($BPause,$Size[0],$Size[1],$Size[2],$Size[3])
EndFunc


;~ Chỉnh trạng thái $BPause
Func BPauseGetState()
	Return GUICtrlGetState($BPause)
EndFunc
Func BPauseSetState($State = $GUI_SHOW)
	GUICtrlSetState($BPause,$State)
EndFunc


;~ Chỉnh màu chữ của $BPause
Func BPauseColor($Color = 0x000000)
	GUICtrlSetColor($BPause,$Color)
EndFunc
;~ Chỉnh màu nền của $BPause
Func BPauseBackGround($Color = 0x000000)
	GUICtrlSetBkColor($BPause,$Color)
EndFunc