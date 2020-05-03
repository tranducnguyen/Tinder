;~ Bấm vào $ITime
GUICtrlSetOnEvent($ITime, "ITimeChange")
Func ITimeChange()
;~	MsgBox(0,"72ls.NET","ITimeChange")
	ITimeSave()
EndFunc

;~ ITimeTLoad()
;~ Nạp chuỗi ngôn ngữ của 1 control
Func ITimeTLoad($ControlID = "")
    Local $Line,$Text,$File
	If $ControlID=="" Then $ControlID = "ITime"

	$Text = FT($ControlID,ITimeGet())

	ITimeSet($Text)
EndFunc

;~ Lưu chuỗi ngôn ngữ của 1 control
Func ITimeTSave()
    FTWrite('ITime',ITimeGet())
EndFunc

;Lưu giá trị trong label xuống file
Func ITimeSave()
	IniWrite($DataFile,"Setting","ITime",ITimeGet())
EndFunc

;Nạp giá trị của label từ file
Func ITimeLoad()
	Local $Data = IniRead($DataFile,"Setting","ITime",ITimeGet())
	ITimeSet($Data)
EndFunc

;~ Chỉnh giá trị chuỗi của $ITime
Func ITimeGet()
	Return GUICtrlRead($ITime)
EndFunc
;~ Lấy giá trị từ $ITime
Func ITimeSet($NewValue = "")
	Local $Check = ITimeGet()
	If $Check <> $NewValue Then GUICtrlSetData($ITime,$NewValue)
EndFunc


;~ Lấy vị trí và kích thước của $ITime
Func ITimeGetPos()
	Return ControlGetPos($MainGUI, "", $ITime)
EndFunc
;~ Chỉnh vị trí của $ITime
Func ITimeSetPos($x = -1,$y = -1)
	Local $Size = ITimeGetPos()
	If Not ($x == -1) Then $Size[0] = $x
	If Not ($y == -1) Then $Size[1] = $y
	GUICtrlSetPos($ITime,$Size[0],$Size[1])
EndFunc
;~ Chỉnh kích thước của $ITime
Func ITimeSetSize($Width = -1,$Height = -1)
	Local $Size = ITimeGetPos()
	If Not ($Width == -1) Then $Size[2] = $Width
	If Not ($Height == -1) Then $Size[3] = $Height
	GUICtrlSetPos($ITime,$Size[0],$Size[1],$Size[2],$Size[3])
EndFunc


;~ Chỉnh trạng thái $ITime
Func ITimeGetState()
	Return GUICtrlGetState($ITime)
EndFunc
Func ITimeSetState($State = $GUI_SHOW)
	GUICtrlSetState($ITime,$State)
EndFunc


;~ Chỉnh màu chữ của $ITime
Func ITimeColor($Color = 0x000000)
	GUICtrlSetColor($ITime,$Color)
EndFunc
;~ Chỉnh màu nền của $ITime
Func ITimeBackGround($Color = 0x000000)
	GUICtrlSetBkColor($ITime,$Color)
EndFunc