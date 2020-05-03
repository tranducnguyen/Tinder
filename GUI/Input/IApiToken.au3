;~ Bấm vào $IApiToken
GUICtrlSetOnEvent($IApiToken, "IApiTokenChange")
Func IApiTokenChange()
;~	MsgBox(0,"72ls.NET","IApiTokenChange")
	IApiTokenSave()
EndFunc

;~ IApiTokenTLoad()
;~ Nạp chuỗi ngôn ngữ của 1 control
Func IApiTokenTLoad($ControlID = "")
    Local $Line,$Text,$File
	If $ControlID=="" Then $ControlID = "IApiToken"

	$Text = FT($ControlID,IApiTokenGet())

	IApiTokenSet($Text)
EndFunc

;~ Lưu chuỗi ngôn ngữ của 1 control
Func IApiTokenTSave()
    FTWrite('IApiToken',IApiTokenGet())
EndFunc

;Lưu giá trị trong label xuống file
Func IApiTokenSave()
	IniWrite($DataFile,"Setting","IApiToken",IApiTokenGet())
EndFunc

;Nạp giá trị của label từ file
Func IApiTokenLoad()
	Local $Data = IniRead($DataFile,"Setting","IApiToken",IApiTokenGet())
	IApiTokenSet($Data)
EndFunc

;~ Chỉnh giá trị chuỗi của $IApiToken
Func IApiTokenGet()
	Return GUICtrlRead($IApiToken)
EndFunc
;~ Lấy giá trị từ $IApiToken
Func IApiTokenSet($NewValue = "")
	Local $Check = IApiTokenGet()
	If $Check <> $NewValue Then GUICtrlSetData($IApiToken,$NewValue)
EndFunc


;~ Lấy vị trí và kích thước của $IApiToken
Func IApiTokenGetPos()
	Return ControlGetPos($MainGUI, "", $IApiToken)
EndFunc
;~ Chỉnh vị trí của $IApiToken
Func IApiTokenSetPos($x = -1,$y = -1)
	Local $Size = IApiTokenGetPos()
	If Not ($x == -1) Then $Size[0] = $x
	If Not ($y == -1) Then $Size[1] = $y
	GUICtrlSetPos($IApiToken,$Size[0],$Size[1])
EndFunc
;~ Chỉnh kích thước của $IApiToken
Func IApiTokenSetSize($Width = -1,$Height = -1)
	Local $Size = IApiTokenGetPos()
	If Not ($Width == -1) Then $Size[2] = $Width
	If Not ($Height == -1) Then $Size[3] = $Height
	GUICtrlSetPos($IApiToken,$Size[0],$Size[1],$Size[2],$Size[3])
EndFunc


;~ Chỉnh trạng thái $IApiToken
Func IApiTokenGetState()
	Return GUICtrlGetState($IApiToken)
EndFunc
Func IApiTokenSetState($State = $GUI_SHOW)
	GUICtrlSetState($IApiToken,$State)
EndFunc


;~ Chỉnh màu chữ của $IApiToken
Func IApiTokenColor($Color = 0x000000)
	GUICtrlSetColor($IApiToken,$Color)
EndFunc
;~ Chỉnh màu nền của $IApiToken
Func IApiTokenBackGround($Color = 0x000000)
	GUICtrlSetBkColor($IApiToken,$Color)
EndFunc