;~ Bấm vào $CHisShutDown
GUICtrlSetOnEvent($CHisShutDown, "CHisShutDownClick")
Func CHisShutDownClick()
	$isShutDown = CHisShutDownIsCheck()
	If $isShutDown == True Then
		MsgBox(0,"Thông báo","Máy tiến hành shutdown sau 5s khi chương trình thực hiện xong")
	EndIf
EndFunc

;~ CHisShutDownTLoad()
;~ Nạp chuỗi ngôn ngữ của 1 control
Func CHisShutDownTLoad($ControlID = "")
    Local $Line,$Text,$File
	If $ControlID=="" Then $ControlID = "CHisShutDown"

	$Text = FT($ControlID,CHisShutDownGet())

	CHisShutDownSet($Text)
EndFunc

;Lưu trạng thái của CHisShutDown xuống file
Func CHisShutDownCheckSave()
	IniWrite($DataFile,"Setting","CHisShutDownCheck",CHisShutDownGet(0))
EndFunc

;Nạp trạng thái của CHisShutDown từ file
;~ CHisShutDownCheckLoad()
Func CHisShutDownCheckLoad()
	Local $Data = IniRead($DataFile,"Setting","CHisShutDownCheck",CHisShutDownGet(0))
	CHisShutDownCheck($Data)
EndFunc

;~ Check và UnCheck $CHisShutDown
Func CHisShutDownCheck($check = 0)
	If $check == 1 Then	CHisShutDownSetState($GUI_CHECKED)
	If $check == 4 Then	CHisShutDownSetState($GUI_UNCHECKED)
EndFunc

;~ Kiểm tra xem $CHisShutDown có đang check hay không
Func CHisShutDownIsCheck()
	Local $State = CHisShutDownGet(0)
	If $State == 1 Then	Return True
	If $State == 4 Then	Return False
EndFunc

;Lưu giá trị trong label xuống file
Func CHisShutDownSave()
	IniWrite($DataFile,"Setting","CHisShutDown",CHisShutDownGet())
EndFunc
;Nạp giá trị của label từ file
Func CHisShutDownLoad()
	Local $Data = IniRead($DataFile,"Setting","CHisShutDown",CHisShutDownGet())
	CHisShutDownSet($Data)
EndFunc

;~ Chỉnh giá trị chuỗi của $CHisShutDown
Func CHisShutDownGet($Advanced = 0)
	Return GUICtrlRead($CHisShutDown,$Advanced)
EndFunc
;~ Lấy giá trị từ $CHisShutDown
Func CHisShutDownSet($NewValue = "")
	Local $Check = CHisShutDownGet()
	If $Check <> $NewValue Then GUICtrlSetData($CHisShutDown,$NewValue)
EndFunc


;~ Lấy vị trí và kích thước của $CHisShutDown
Func CHisShutDownGetPos()
	Return ControlGetPos($MainGUI, "", $CHisShutDown)
EndFunc
;~ Chỉnh vị trí của $CHisShutDown
Func CHisShutDownSetPos($x = -1,$y = -1)
	Local $Size = CHisShutDownGetPos()
	If Not ($x == -1) Then $Size[0] = $x
	If Not ($y == -1) Then $Size[1] = $y
	GUICtrlSetPos($CHisShutDown,$Size[0],$Size[1])
EndFunc
;~ Chỉnh kích thước của $CHisShutDown
Func CHisShutDownSetSize($Width = -1,$Height = -1)
	Local $Size = CHisShutDownGetPos()
	If Not ($Width == -1) Then $Size[2] = $Width
	If Not ($Height == -1) Then $Size[3] = $Height
	GUICtrlSetPos($CHisShutDown,$Size[0],$Size[1],$Size[2],$Size[3])
EndFunc


;~ Chỉnh trạng thái $CHisShutDown
Func CHisShutDownGetState()
	Return GUICtrlGetState($CHisShutDown)
EndFunc
Func CHisShutDownSetState($State = $GUI_SHOW)
	GUICtrlSetState($CHisShutDown,$State)
EndFunc


;~ Chỉnh màu chữ của $CHisShutDown
Func CHisShutDownColor($Color = 0x000000)
	GUICtrlSetColor($CHisShutDown,$Color)
EndFunc
;~ Chỉnh màu nền của $CHisShutDown
Func CHisShutDownBackGround($Color = 0x000000)
	GUICtrlSetBkColor($CHisShutDown,$Color)
EndFunc

;~ Chỉnh màu font chữ
Func CHisShutDownFont($Size,$Weight)
	GUICtrlSetFont($CHisShutDown,$Size,$Weight)
EndFunc