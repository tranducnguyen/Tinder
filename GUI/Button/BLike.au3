;~ Bấm vào $BLike
GUICtrlSetOnEvent($BLike, "BLikeClick")
Func BLikeClick()
	$apiToken = IApiTokenGet()
	LNoticeSet("API: "&$apiToken)
	_updateAdditional_Headers()
	_getDataANdLike()
EndFunc


;~ BLikeTLoad()
;~ Nạp chuỗi ngôn ngữ của 1 control
Func BLikeTLoad($ControlID = "")
    Local $Line,$Text,$File
	If $ControlID=="" Then $ControlID = "BLike"

	$Text = FT($ControlID,BLikeGet())

	BLikeSet($Text)
EndFunc

;Lưu giá trị trong label xuống file
Func BLikeSave()
	IniWrite($DataFile,"Setting","BLike",BLikeGet())
EndFunc

;Nạp giá trị của label từ file
Func BLikeLoad()
	Local $Data = IniRead($DataFile,"Setting","BLike",BLikeGet())
	BLikeSet($Data)
EndFunc

;~ Chỉnh giá trị chuỗi của $BLike
Func BLikeGet()
	Return GUICtrlRead($BLike)
EndFunc
;~ Lấy giá trị từ $BLike
Func BLikeSet($NewValue = "")
	Local $Check = BLikeGet()
	If $Check <> $NewValue Then GUICtrlSetData($BLike,$NewValue)
EndFunc


;~ Lấy vị trí và kích thước của $BLike
Func BLikeGetPos()
	Return ControlGetPos($MainGUI, "", $BLike)
EndFunc
;~ Chỉnh vị trí của $BLike
Func BLikeSetPos($x = -1,$y = -1)
	Local $Size = BLikeGetPos()
	If Not ($x == -1) Then $Size[0] = $x
	If Not ($y == -1) Then $Size[1] = $y
	GUICtrlSetPos($BLike,$Size[0],$Size[1])
EndFunc
;~ Chỉnh kích thước của $BLike
Func BLikeSetSize($Width = -1,$Height = -1)
	Local $Size = BLikeGetPos()
	If Not ($Width == -1) Then $Size[2] = $Width
	If Not ($Height == -1) Then $Size[3] = $Height
	GUICtrlSetPos($BLike,$Size[0],$Size[1],$Size[2],$Size[3])
EndFunc


;~ Chỉnh trạng thái $BLike
Func BLikeGetState()
	Return GUICtrlGetState($BLike)
EndFunc
Func BLikeSetState($State = $GUI_SHOW)
	GUICtrlSetState($BLike,$State)
EndFunc


;~ Chỉnh màu chữ của $BLike
Func BLikeColor($Color = 0x000000)
	GUICtrlSetColor($BLike,$Color)
EndFunc
;~ Chỉnh màu nền của $BLike
Func BLikeBackGround($Color = 0x000000)
	GUICtrlSetBkColor($BLike,$Color)
EndFunc