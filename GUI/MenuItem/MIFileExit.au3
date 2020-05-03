;~ Bấm vào $MIFileExit
GUICtrlSetOnEvent($MIFileExit, "MIFileExitClick")
Func MIFileExitClick()
;~	MsgBox(0,"HocAutoIT.com","MIFileExitClick")
	FAutoEnd()
EndFunc

;~ MIFileExitTLoad()
;~ Nạp chuỗi ngôn ngữ của 1 control
Func MIFileExitTLoad($ControlID = "")
    Local $Line,$Text,$File
	If $ControlID=="" Then $ControlID = "MIFileExit"

	$Text = FT($ControlID,MIFileExitGet())

	MIFileExitSet($Text)
EndFunc


;Lưu giá trị trong label xuống file
Func MIFileExitSave()
	IniWrite($DataFile,"Setting","MIFileExit",MIFileExitGet())
EndFunc

;Nạp giá trị của label từ file
Func MIFileExitLoad()
	Local $Data = IniRead($DataFile,"Setting","MIFileExit",MIFileExitGet())
	MIFileExitSet($Data)
EndFunc

;~ Chỉnh giá trị chuỗi của $MIFileExit
Func MIFileExitGet()
	Return GUICtrlRead($MIFileExit,1)
EndFunc
;~ Lấy giá trị từ $MIFileExit
Func MIFileExitSet($NewValue = "")
	Local $Check = MIFileExitGet()
	If $Check <> $NewValue Then GUICtrlSetData($MIFileExit,$NewValue)
EndFunc


;~ Lấy vị trí và kích thước của $MIFileExit
Func MIFileExitGetPos()
	Return ControlGetPos($MainGUI, "", $MIFileExit)
EndFunc
;~ Chỉnh vị trí của $MIFileExit
Func MIFileExitSetPos($x = -1,$y = -1)
	Local $Size = MIFileExitGetPos()
	If Not ($x == -1) Then $Size[0] = $x
	If Not ($y == -1) Then $Size[1] = $y
	GUICtrlSetPos($MIFileExit,$Size[0],$Size[1])
EndFunc
;~ Chỉnh kích thước của $MIFileExit
Func MIFileExitSetSize($Width = -1,$Height = -1)
	Local $Size = MIFileExitGetPos()
	If Not ($Width == -1) Then $Size[2] = $Width
	If Not ($Height == -1) Then $Size[3] = $Height
	GUICtrlSetPos($MIFileExit,$Size[0],$Size[1],$Size[2],$Size[3])
EndFunc


;~ Chỉnh trạng thái $MIFileExit
Func MIFileExitGetState()
	Return GUICtrlGetState($MIFileExit)
EndFunc
Func MIFileExitSetState($State = $GUI_SHOW)
	GUICtrlSetState($MIFileExit,$State)
EndFunc


;~ Chỉnh màu chữ của $MIFileExit
Func MIFileExitColor($Color = 0x000000)
	GUICtrlSetColor($MIFileExit,$Color)
EndFunc
;~ Chỉnh màu nền của $MIFileExit
Func MIFileExitBackGround($Color = 0x000000)
	GUICtrlSetBkColor($MIFileExit,$Color)
EndFunc