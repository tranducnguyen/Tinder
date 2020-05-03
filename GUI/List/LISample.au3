;~ Bấm vào $LISample
GUICtrlSetOnEvent($LISample, "LISampleClick")
Func LISampleClick()
;~	MsgBox(0,"72ls.NET","LISampleClick")
;~	LISampleSave()
EndFunc

;~ LISampleTLoad()
;~ Nạp chuỗi ngôn ngữ của 1 control
Func LISampleTLoad($ControlID = "")
    Local $Line,$Text,$File
	If $ControlID=="" Then $ControlID = "LISample"

	$Text = FT($ControlID,LISampleGet())

	LISampleSet($Text)
EndFunc

;Lưu giá trị trong label xuống file
Func LISampleSave()
	IniWrite($DataFile,"Setting","LISample",LISampleGet())
EndFunc

;Nạp giá trị của label từ file
Func LISampleLoad()
	Local $Data = IniRead($DataFile,"Setting","LISample",LISampleGet())
	LISampleSet($Data)
EndFunc

;~ Chỉnh giá trị chuỗi của $LISample
Func LISampleGet()
	Return GUICtrlRead($LISample)
EndFunc
;~ Lấy giá trị từ $LISample
Func LISampleSet($NewValue = "")
	Local $Check = LISampleGet()
	If $Check <> $NewValue Then GUICtrlSetData($LISample,$NewValue)
EndFunc


;~ Lấy vị trí và kích thước của $LISample
Func LISampleGetPos()
	Return ControlGetPos($MainGUI, "", $LISample)
EndFunc
;~ Chỉnh vị trí của $LISample
Func LISampleSetPos($x = -1,$y = -1)
	Local $Size = LISampleGetPos()
	If Not ($x == -1) Then $Size[0] = $x
	If Not ($y == -1) Then $Size[1] = $y
	GUICtrlSetPos($LISample,$Size[0],$Size[1])
EndFunc
;~ Chỉnh kích thước của $LISample
Func LISampleSetSize($Width = -1,$Height = -1)
	Local $Size = LISampleGetPos()
	If Not ($Width == -1) Then $Size[2] = $Width
	If Not ($Height == -1) Then $Size[3] = $Height
	GUICtrlSetPos($LISample,$Size[0],$Size[1],$Size[2],$Size[3])
EndFunc


;~ Chỉnh trạng thái $LISample
Func LISampleGetState()
	Return GUICtrlGetState($LISample)
EndFunc
Func LISampleSetState($State = $GUI_SHOW)
	GUICtrlSetState($LISample,$State)
EndFunc


;~ Chỉnh màu chữ của $LISample
Func LISampleColor($Color = 0x000000)
	GUICtrlSetColor($LISample,$Color)
EndFunc
;~ Chỉnh màu nền của $LISample
Func LISampleBackGround($Color = 0x000000)
	GUICtrlSetBkColor($LISample,$Color)
EndFunc