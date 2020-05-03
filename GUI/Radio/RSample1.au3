;~ Bấm vào $RSample1
GUICtrlSetOnEvent($RSample1, "RSample1Click")
Func RSample1Click()
;~	msgbox(0,"hocautoit.com","RSample1Click")
;~	$RSample = "Sample1"
;~	FRSampleSave()
EndFunc

;~ RSample1TLoad()
;~ Nạp chuỗi ngôn ngữ của 1 control
Func RSample1TLoad($ControlID = "")
    Local $Line,$Text,$File
	If $ControlID=="" Then $ControlID = "RSample1"

	$Text = FT($ControlID,RSample1Get())

	RSample1Set($Text)
EndFunc

;Lưu trạng thái của RSample1 xuống file
Func RSample1CheckSave()
	IniWrite($DataFile,"Setting","RSample1Check",RSample1Get(0))
EndFunc

;Nạp trạng thái của RSample1 từ file
Func RSample1CheckLoad()
	Local $Data = IniRead($DataFile,"Setting","RSample1Check",RSample1Get(0))
	RSample1Check($Data)
EndFunc

;~ Check và UnCheck $RSample1
Func RSample1Check($check = 0)
	If $check == 1 Then	RSample1SetState($GUI_CHECKED)
	If $check == 4 Then	RSample1SetState($GUI_UNCHECKED)
EndFunc

;Lưu giá trị trong label xuống file
Func RSample1Save()
	IniWrite($DataFile,"Setting","RSample1",RSample1Get())
EndFunc
;Nạp giá trị của label từ file
Func RSample1Load()
	Local $Data = IniRead($DataFile,"Setting","RSample1",RSample1Get())
	RSample1Set($Data)
EndFunc

;~ Chỉnh giá trị chuỗi của $RSample1
Func RSample1Get($Advanced = 1)
	Return GUICtrlRead($RSample1,$Advanced)
EndFunc
;~ Lấy giá trị từ $RSample1
Func RSample1Set($NewValue = "")
	Local $Check = RSample1Get()
	If $Check <> $NewValue Then GUICtrlSetData($RSample1,$NewValue)
EndFunc


;~ Lấy vị trí và kích thước của $RSample1
Func RSample1GetPos()
	Return ControlGetPos($MainGUI, "", $RSample1)
EndFunc
;~ Chỉnh vị trí của $RSample1
Func RSample1SetPos($x = -1,$y = -1)
	Local $Size = RSample1GetPos()
	If Not ($x == -1) Then $Size[0] = $x
	If Not ($y == -1) Then $Size[1] = $y
	GUICtrlSetPos($RSample1,$Size[0],$Size[1])
EndFunc
;~ Chỉnh kích thước của $RSample1
Func RSample1SetSize($Width = -1,$Height = -1)
	Local $Size = RSample1GetPos()
	If Not ($Width == -1) Then $Size[2] = $Width
	If Not ($Height == -1) Then $Size[3] = $Height
	GUICtrlSetPos($RSample1,$Size[0],$Size[1],$Size[2],$Size[3])
EndFunc


;~ Chỉnh trạng thái $RSample1
Func RSample1GetState()
	Return GUICtrlGetState($RSample1)
EndFunc
Func RSample1SetState($State = $GUI_SHOW)
	GUICtrlSetState($RSample1,$State)
EndFunc


;~ Chỉnh màu chữ của $RSample1
Func RSample1Color($Color = 0x000000)
	GUICtrlSetColor($RSample1,$Color)
EndFunc
;~ Chỉnh màu nền của $RSample1
Func RSample1BackGround($Color = 0x000000)
	GUICtrlSetBkColor($RSample1,$Color)
EndFunc