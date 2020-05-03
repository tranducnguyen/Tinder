#include <FuncsTinder.au3>

Func _getJSON_infoPersons($nameFile = '', $timeSleep = 72)
	$vID = StringSplit(FileRead($pathSave & $nameFile), @CRLF)
	$vID = _ArrayUnique($vID, Default, Default, Default, 0)
	LNoticeSet('Bắt đầu request thông tin ======================================')
	Local $iCount = 0
	For $i = 0 To UBound($vID) - 1
		If StringLen($vID[$i]) == 24 Then
			$iCount = $iCount + 1
			ConsoleWrite($iCount & '- Lấy thông tin id ' & $vID[$i] & @CRLF)
			$info = _getPerson($vID[$i])
			If _checkStatus($info) Then
				FileWriteLine($pathSave & 'Thongke.txt', _getInfobyTxtJSON($info))
			EndIf
			Sleep($timeSleep)
		EndIf
	Next
	LNoticeSet('Kết thúc request thông tin ======================================')
EndFunc