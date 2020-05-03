;~ Bấm vào $ESample
GUICtrlSetOnEvent($ESample, "ESampleChange")
Func ESampleChange()
;~	MsgBox(0,"72ls.NET","ESampleChange")
;~	ESampleSave()
EndFunc

;~ ESampleTLoad()
;~ Nạp chuỗi ngôn ngữ của 1 control
Func ESampleTLoad($ControlID = "")
    Local $Line,$Text,$File
	If $ControlID=="" Then $ControlID = "ESample"

	$Text = FT($ControlID,ESampleGet())

	ESampleSet($Text)
EndFunc

;~ Cuộn chuột xuống hàng cuối
Func ESampleScrollEnd()
	_GUICtrlEdit_LineScroll($ELog, 0, _GUICtrlEdit_GetLineCount($ELog))
EndFunc

;Lưu giá trị trong label xuống file
Func ESampleSave()
	Local $Data = ESampleGet()
	$Data = StringReplace($Data,@CRLF,"<br>")
	IniWrite($DataFile,"Setting","ESample",$Data)
EndFunc

;Nạp giá trị của label từ file
Func ESampleLoad()
	Local $Data = IniRead($DataFile,"Setting","ESample",ESampleGet())
	$Data = StringReplace($Data,"<br>",@CRLF)
	ESampleSet($Data)
EndFunc

;~ Chỉnh giá trị chuỗi của $ESample
Func ESampleGet()
	Return GUICtrlRead($ESample)
EndFunc
;~ Lấy giá trị từ $ESample
Func ESampleSet($NewValue = "")
	Local $Check = ESampleGet()
	If $Check <> $NewValue Then GUICtrlSetData($ESample,$NewValue)
EndFunc


;~ Lấy vị trí và kích thước của $ESample
Func ESampleGetPos()
	Return ControlGetPos($MainGUI, "", $ESample)
EndFunc
;~ Chỉnh vị trí của $ESample
Func ESampleSetPos($x = -1,$y = -1)
	Local $Size = ESampleGetPos()
	If Not ($x == -1) Then $Size[0] = $x
	If Not ($y == -1) Then $Size[1] = $y
	GUICtrlSetPos($ESample,$Size[0],$Size[1])
EndFunc
;~ Chỉnh kích thước của $ESample
Func ESampleSetSize($Width = -1,$Height = -1)
	Local $Size = ESampleGetPos()
	If Not ($Width == -1) Then $Size[2] = $Width
	If Not ($Height == -1) Then $Size[3] = $Height
	GUICtrlSetPos($ESample,$Size[0],$Size[1],$Size[2],$Size[3])
EndFunc


;~ Chỉnh trạng thái $ESample
Func ESampleGetState()
	Return GUICtrlGetState($ESample)
EndFunc
Func ESampleSetState($State = $GUI_SHOW)
	GUICtrlSetState($ESample,$State)
EndFunc


;~ Chỉnh màu chữ của $ESample
Func ESampleColor($Color = 0x000000)
	GUICtrlSetColor($ESample,$Color)
EndFunc
;~ Chỉnh màu nền của $ESample
Func ESampleBackGround($Color = 0x000000)
	GUICtrlSetBkColor($ESample,$Color)
EndFunc