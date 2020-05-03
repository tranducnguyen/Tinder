;~ Bấm vào $COSample
GUICtrlSetOnEvent($COSample, "COSampleChange")
Func COSampleChange()
	Local $Data = COSampleGet()
;~	MsgBox(0,"72ls.NET","COSampleChange: "&$Data)
;~	COSampleSave()
EndFunc

;~ COSampleTLoad()
;~ Nạp chuỗi ngôn ngữ của 1 control
Func COSampleTLoad($ControlID = "")
    Local $Line,$Text,$File
	If $ControlID=="" Then $ControlID = "COSample"

	$Text = FT($ControlID,COSampleGet())

	COSampleSet($Text)
EndFunc

;Lưu giá trị trong label xuống file
Func COSampleSave()
	IniWrite($DataFile,"Setting","COSample",COSampleGet())
EndFunc

;Nạp giá trị của label từ file
Func COSampleLoad()
	Local $Data = IniRead($DataFile,"Setting","COSample",COSampleGet())
	If $Data <> "" Then COSampleSet($Data,$Data)
EndFunc

;~ Chỉnh giá trị chuỗi của $COSample
Func COSampleGet()
	Return GUICtrlRead($COSample)
EndFunc
;~ Lấy giá trị từ $COSample
Func COSampleSet($NewValue = "",$Default = "")
	Local $Check = COSampleGet()
	If $Check <> $NewValue Then GUICtrlSetData($COSample,$NewValue,$Default)
EndFunc


;~ Lấy vị trí và kích thước của $COSample
Func COSampleGetPos()
	Return ControlGetPos($MainGUI, "", $COSample)
EndFunc
;~ Chỉnh vị trí của $COSample
Func COSampleSetPos($x = -1,$y = -1)
	Local $Size = COSampleGetPos()
	If Not ($x == -1) Then $Size[0] = $x
	If Not ($y == -1) Then $Size[1] = $y
	GUICtrlSetPos($COSample,$Size[0],$Size[1])
EndFunc
;~ Chỉnh kích thước của $COSample
Func COSampleSetSize($Width = -1,$Height = -1)
	Local $Size = COSampleGetPos()
	If Not ($Width == -1) Then $Size[2] = $Width
	If Not ($Height == -1) Then $Size[3] = $Height
	GUICtrlSetPos($COSample,$Size[0],$Size[1],$Size[2],$Size[3])
EndFunc


;~ Chỉnh trạng thái $COSample
Func COSampleGetState()
	Return GUICtrlGetState($COSample)
EndFunc
Func COSampleSetState($State = $GUI_SHOW)
	GUICtrlSetState($COSample,$State)
EndFunc


;~ Chỉnh màu chữ của $COSample
Func COSampleColor($Color = 0x000000)
	GUICtrlSetColor($COSample,$Color)
EndFunc
;~ Chỉnh màu nền của $COSample
Func COSampleBackGround($Color = 0x000000)
	GUICtrlSetBkColor($COSample,$Color)
EndFunc