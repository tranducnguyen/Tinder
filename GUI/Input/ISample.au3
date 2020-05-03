;~ Bấm vào $ISample
GUICtrlSetOnEvent($ISample, "ISampleChange")
Func ISampleChange()
;~	MsgBox(0,"72ls.NET","ISampleChange")
;~	ISampleSave()
EndFunc

;~ ISampleTLoad()
;~ Nạp chuỗi ngôn ngữ của 1 control
Func ISampleTLoad($ControlID = "")
    Local $Line,$Text,$File
	If $ControlID=="" Then $ControlID = "ISample"

	$Text = FT($ControlID,ISampleGet())

	ISampleSet($Text)
EndFunc

;~ Lưu chuỗi ngôn ngữ của 1 control
Func ISampleTSave()
    FTWrite('ISample',ISampleGet())
EndFunc

;Lưu giá trị trong label xuống file
Func ISampleSave()
	IniWrite($DataFile,"Setting","ISample",ISampleGet())
EndFunc

;Nạp giá trị của label từ file
Func ISampleLoad()
	Local $Data = IniRead($DataFile,"Setting","ISample",ISampleGet())
	ISampleSet($Data)
EndFunc

;~ Chỉnh giá trị chuỗi của $ISample
Func ISampleGet()
	Return GUICtrlRead($ISample)
EndFunc
;~ Lấy giá trị từ $ISample
Func ISampleSet($NewValue = "")
	Local $Check = ISampleGet()
	If $Check <> $NewValue Then GUICtrlSetData($ISample,$NewValue)
EndFunc


;~ Lấy vị trí và kích thước của $ISample
Func ISampleGetPos()
	Return ControlGetPos($MainGUI, "", $ISample)
EndFunc
;~ Chỉnh vị trí của $ISample
Func ISampleSetPos($x = -1,$y = -1)
	Local $Size = ISampleGetPos()
	If Not ($x == -1) Then $Size[0] = $x
	If Not ($y == -1) Then $Size[1] = $y
	GUICtrlSetPos($ISample,$Size[0],$Size[1])
EndFunc
;~ Chỉnh kích thước của $ISample
Func ISampleSetSize($Width = -1,$Height = -1)
	Local $Size = ISampleGetPos()
	If Not ($Width == -1) Then $Size[2] = $Width
	If Not ($Height == -1) Then $Size[3] = $Height
	GUICtrlSetPos($ISample,$Size[0],$Size[1],$Size[2],$Size[3])
EndFunc


;~ Chỉnh trạng thái $ISample
Func ISampleGetState()
	Return GUICtrlGetState($ISample)
EndFunc
Func ISampleSetState($State = $GUI_SHOW)
	GUICtrlSetState($ISample,$State)
EndFunc


;~ Chỉnh màu chữ của $ISample
Func ISampleColor($Color = 0x000000)
	GUICtrlSetColor($ISample,$Color)
EndFunc
;~ Chỉnh màu nền của $ISample
Func ISampleBackGround($Color = 0x000000)
	GUICtrlSetBkColor($ISample,$Color)
EndFunc