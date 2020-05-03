;~ Bấm vào $BgetInfo
GUICtrlSetOnEvent($BgetInfo, "BgetInfoClick")
Func BgetInfoClick()
	$apiToken = IApiTokenGet()
	LNoticeSet("API: "&$apiToken)
	_updateAdditional_Headers()
	_getInfos()
EndFunc


;~ BgetInfoTLoad()
;~ Nạp chuỗi ngôn ngữ của 1 control
Func BgetInfoTLoad($ControlID = "")
    Local $Line,$Text,$File
	If $ControlID=="" Then $ControlID = "BgetInfo"

	$Text = FT($ControlID,BgetInfoGet())

	BgetInfoSet($Text)
EndFunc

;Lưu giá trị trong label xuống file
Func BgetInfoSave()
	IniWrite($DataFile,"Setting","BgetInfo",BgetInfoGet())
EndFunc

;Nạp giá trị của label từ file
Func BgetInfoLoad()
	Local $Data = IniRead($DataFile,"Setting","BgetInfo",BgetInfoGet())
	BgetInfoSet($Data)
EndFunc

;~ Chỉnh giá trị chuỗi của $BgetInfo
Func BgetInfoGet()
	Return GUICtrlRead($BgetInfo)
EndFunc
;~ Lấy giá trị từ $BgetInfo
Func BgetInfoSet($NewValue = "")
	Local $Check = BgetInfoGet()
	If $Check <> $NewValue Then GUICtrlSetData($BgetInfo,$NewValue)
EndFunc


;~ Lấy vị trí và kích thước của $BgetInfo
Func BgetInfoGetPos()
	Return ControlGetPos($MainGUI, "", $BgetInfo)
EndFunc
;~ Chỉnh vị trí của $BgetInfo
Func BgetInfoSetPos($x = -1,$y = -1)
	Local $Size = BgetInfoGetPos()
	If Not ($x == -1) Then $Size[0] = $x
	If Not ($y == -1) Then $Size[1] = $y
	GUICtrlSetPos($BgetInfo,$Size[0],$Size[1])
EndFunc
;~ Chỉnh kích thước của $BgetInfo
Func BgetInfoSetSize($Width = -1,$Height = -1)
	Local $Size = BgetInfoGetPos()
	If Not ($Width == -1) Then $Size[2] = $Width
	If Not ($Height == -1) Then $Size[3] = $Height
	GUICtrlSetPos($BgetInfo,$Size[0],$Size[1],$Size[2],$Size[3])
EndFunc


;~ Chỉnh trạng thái $BgetInfo
Func BgetInfoGetState()
	Return GUICtrlGetState($BgetInfo)
EndFunc
Func BgetInfoSetState($State = $GUI_SHOW)
	GUICtrlSetState($BgetInfo,$State)
EndFunc


;~ Chỉnh màu chữ của $BgetInfo
Func BgetInfoColor($Color = 0x000000)
	GUICtrlSetColor($BgetInfo,$Color)
EndFunc
;~ Chỉnh màu nền của $BgetInfo
Func BgetInfoBackGround($Color = 0x000000)
	GUICtrlSetBkColor($BgetInfo,$Color)
EndFunc