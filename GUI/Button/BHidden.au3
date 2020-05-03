;~ Bấm vào $BHidden
GUICtrlSetOnEvent($BHidden, "BHiddenClick")
Func BHiddenClick()
	$AutoShow = Not $AutoShow
	FAutoShow($AutoShow)
EndFunc


;~ BHiddenTLoad()
;~ Nạp chuỗi ngôn ngữ của 1 control
Func BHiddenTLoad($ControlID = "")
    Local $Line,$Text,$File
	If $ControlID=="" Then $ControlID = "BHidden"

	$Text = FT($ControlID,BHiddenGet())

	BHiddenSet($Text)
EndFunc

;Lưu giá trị trong label xuống file
Func BHiddenSave()
	IniWrite($DataFile,"Setting","BHidden",BHiddenGet())
EndFunc

;Nạp giá trị của label từ file
Func BHiddenLoad()
	Local $Data = IniRead($DataFile,"Setting","BHidden",BHiddenGet())
	BHiddenSet($Data)
EndFunc

;~ Chỉnh giá trị chuỗi của $BHidden
Func BHiddenGet()
	Return GUICtrlRead($BHidden)
EndFunc
;~ Lấy giá trị từ $BHidden
Func BHiddenSet($NewValue = "")
	Local $Check = BHiddenGet()
	If $Check <> $NewValue Then GUICtrlSetData($BHidden,$NewValue)
EndFunc


;~ Lấy vị trí và kích thước của $BHidden
Func BHiddenGetPos()
	Return ControlGetPos($MainGUI, "", $BHidden)
EndFunc
;~ Chỉnh vị trí của $BHidden
Func BHiddenSetPos($x = -1,$y = -1)
	Local $Size = BHiddenGetPos()
	If Not ($x == -1) Then $Size[0] = $x
	If Not ($y == -1) Then $Size[1] = $y
	GUICtrlSetPos($BHidden,$Size[0],$Size[1])
EndFunc
;~ Chỉnh kích thước của $BHidden
Func BHiddenSetSize($Width = -1,$Height = -1)
	Local $Size = BHiddenGetPos()
	If Not ($Width == -1) Then $Size[2] = $Width
	If Not ($Height == -1) Then $Size[3] = $Height
	GUICtrlSetPos($BHidden,$Size[0],$Size[1],$Size[2],$Size[3])
EndFunc


;~ Chỉnh trạng thái $BHidden
Func BHiddenGetState()
	Return GUICtrlGetState($BHidden)
EndFunc
Func BHiddenSetState($State = $GUI_SHOW)
	GUICtrlSetState($BHidden,$State)
EndFunc


;~ Chỉnh màu chữ của $BHidden
Func BHiddenColor($Color = 0x000000)
	GUICtrlSetColor($BHidden,$Color)
EndFunc
;~ Chỉnh màu nền của $BHidden
Func BHiddenBackGround($Color = 0x000000)
	GUICtrlSetBkColor($BHidden,$Color)
EndFunc