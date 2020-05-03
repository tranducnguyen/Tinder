#include-once
#include <_HttpRequest.au3>
#include <Date.au3>
#include <File.au3>
#include <storage.au3>
#include <GlobalVar.au3>

$apiToken = 'e7a418d7-ffc5-437e-be76-5e6ab2080a97'
$Additional_Headers = 'X-Auth-Token:' & $apiToken

_getListLikePictures()

Func _getDataANdLike()

	_KeHoachHangNgay()

	_likeAllPics()

	If $isShutDown == True Then
		ConsoleWrite('Tiến hành shutdown trong 5s')
		For $i = 1 to 5
			ConsoleWrite('Tiến hành shutdown trong ' & (5 - $i))
			Sleep(1000)
		Next
		Shutdown(1)
	EndIf
EndFunc   ;==>_getDataANdLike

Func _updateAdditional_Headers()
	$Additional_Headers = 'X-Auth-Token:' & $apiToken
EndFunc


Func _KeHoachHangNgay()
	Local $iHourCheck = 3
;~ 	$iHourCheck = ITimeGet()
	if $iHourCheck <> $hourCheck Then
		$hourCheck = $iHourCheck
	EndIf

	Local $timeCheck = 60 ;Số lần check mỗi giờ
	Local $timeLoad = 30000 ;30s Thời gian nghỉ giữa mỗi lần request
	Local $check = 0
	Local $rq = ''
	Local $gio = 0

	While $gio <= $hourCheck
;~ 		Lấy ID tại pos quận 9
		$check = $timeCheck

		While $check >= 0
			ConsoleWrite($gio & "- " & $check)
			_changeLocation($local_Q9[0], $local_Q9[1])
			Sleep($timeLoad)
			$rq = _getAllData('dataQ9.txt')
			If $rq == 0 Then
				ConsoleWrite('tokenAPI hết hạn')
				Return 0
			EndIf
			$check = $check - 1
		WEnd
		$gio = $gio + 1

;~ 		Lấy ID tại pos quận 2
		$check = $timeCheck
		While $check >= 0
			ConsoleWrite($gio & "- " & $check)
			_changeLocation($local_Q2[0], $local_Q2[1])
			Sleep($timeLoad)
			$rq = _getAllData('dataQ2.txt')
			If $rq == 0 Then
				ConsoleWrite('tokenAPI hết hạn')
				Return 0
			EndIf
			$check = $check - 1
		WEnd
		$gio = $gio + 1

;~ 		Lấy ID tại pos quận 10
		$check = $timeCheck
		While $check >= 0
			ConsoleWrite($gio & "- " & $check)
			_changeLocation($local_Q10[0], $local_Q10[1])
			Sleep($timeLoad)
			$rq = _getAllData('dataQ10.txt')
			If $rq == 0 Then
				ConsoleWrite('tokenAPI hết hạn')
				Return 0
			EndIf
			$check = $check - 1
		WEnd
		$gio = $gio + 1
	WEnd

;~ 	Lấy thông tin theo ID đã request được
	_getJSON_infoPersons('dataQ9.txt', 1000)

	_getJSON_infoPersons('dataQ2.txt', 1000)

	_getJSON_infoPersons('dataQ10.txt', 1000)

EndFunc   ;==>_KeHoachHangNgay


Func _likeAllPics()
	ConsoleWrite('Nạp file like.txt' & @CRLF)

	$isNapFile = _getListLikePictures()

	If $isNapFile == 1 Then
		ConsoleWrite('Đã nạp xong')
		Sleep(1000)
		_likeSLL()
	Else
		ConsoleWrite('Không nạp được file' & @CRLF)
		ConsoleWrite('Vui lòng thử lại')
	EndIf

EndFunc   ;==>_likeAllPics

Func _changeLocation($lat, $lon)
	$url = $host & '/user/ping'
	$rq = _HttpRequest(2, $url, '{"lat":' & $lat & ',"lon":' & $lon & '}', '', '', $Additional_Headers)
	_HttpRequest_SessionClear()
	Return $rq
EndFunc   ;==>_changeLocation

Func _getPosCurrent($rq = '')
	If $rq == '' Then $rq = _getProfile()
	$pos = StringRegExp($rq, 'pos":{(.*?)},', 1)
	$lat = StringRegExp($pos[0], 'lat":(.*?),', 1)[0]
	$lon = StringRegExp($pos[0] & '}', 'lon":(.*?)}', 1)[0]
	Return $lat & ":" & $lon
EndFunc   ;==>_getPosCurrent


Func _getListLikePictures()

	If $isLoadPicture Then
		$vPic = _FileListToArray($pathPictrue, '*', 1)
		If IsArray($vPic) Then
			For $i = 1 To UBound($vPic) - 1
				FileWriteLine($pathSave & @MDAY & @MON & @YEAR & 'like.txt', StringSplit($vPic[$i], '.')[1])
			Next
			Return 1
		EndIf
		Return 0
	Else

		$dataThongKe  = FileRead($pathSave & 'Thongke.txt')
		$vID = StringRegExp($dataThongKe,'(?s)Id:(\w{24})',0)

		If $vID == 1 Then
			$vID = StringRegExp($dataThongKe,'(?s)Id:(\w{24})',3)
			_ArrayDisplay($vID)
			$vPic = _ArrayUnique($vID, Default, Default, Default, 0)
			If IsArray($vPic) Then
				For $i = 1 To UBound($vPic) - 1
					FileWriteLine($pathSave & @MDAY & @MON & @YEAR & 'like.txt', StringSplit($vPic[$i], '.')[1])
				Next
				Return 1
			EndIf
			Return 0
		EndIf
	EndIf
EndFunc   ;==>_getListLikePictures


Func _likeSLL()
	$vID = StringSplit(FileRead($pathSave & @MDAY & @MON & @YEAR & 'like.txt'), @CRLF)
	$vID = _ArrayUnique($vID, Default, Default, Default, 0)
	ConsoleWrite('Bắt đầu Like ======================================'& @CRLF)
	Local $iCount = 0
	For $i = 0 To UBound($vID) - 1
		If StringLen($vID[$i]) == 24 Then
			$iCount = $iCount + 1
			ConsoleWrite($iCount & '- Like id ' & $vID[$i] & @CRLF)
			$rq = _like($vID[$i])
			If _checkStatus($rq) Then
				ConsoleWrite($iCount & '- Like id ' & $vID[$i] & ' - Success!'& @CRLF)
			Else
				ConsoleWrite($iCount & '- Like id ' & $vID[$i] & ' - Fail!'& @CRLF)
			EndIf   ;==>_likeSLL
			Sleep(1000)
		EndIf
	Next
	ConsoleWrite('Kết thúc ======================================')
EndFunc   ;==>_likeSLL


Func _getAllData($nameFile = '')
	Local $sJson = _getAllsByCore()
	If _checkStatus($sJson) Then
		If $nameFile == '' Then $nameFile = 'data.txt'
		Local $oJson = _HttpRequest_ParseJSON($sJson)
		For $i = 0 To $oJson.data.results.length() - 1
			FileWriteLine($pathSave & $nameFile, $oJson.data.results.index($i).user._id)
		Next
		Return 1
	Else
		FileWriteLine($pathSave & $nameFile, $sJson)
		Return 0
	EndIf
EndFunc   ;==>_getAllData

Func _getProfile()
	Local $url = $host & '/profile'
	Local $rq = _HttpRequest(2, $url, '', '', '', $Additional_Headers)
	Return $rq
EndFunc   ;==>_getProfile

Func _getJSON_infoPersons($nameFile = '', $timeSleep = 72)
	$vID = StringSplit(FileRead($pathSave & $nameFile), @CRLF)
	$vID = _ArrayUnique($vID, Default, Default, Default, 0)
	ConsoleWrite('Bắt đầu request thông tin ======================================')
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
	ConsoleWrite('Kết thúc request thông tin ======================================')
EndFunc   ;==>_getJSON_infoPersons

Func _getInfobyTxtJSON($rq)
	If _checkStatus($rq) Then
		$oJson = _HttpRequest_ParseJSON($rq)
		$sID = $oJson.results._id
		$sName = $oJson.results.name
		$sgender = $oJson.results.gender
		$sdistence_mi = $oJson.results.distance_mi
		If StringRegExp($rq, 'bio":"(.*?)","', 0) == 1 Then
			$sBio = StringRegExp($rq, 'bio":"(.*?)","', 1)[0]
		Else
			$sBio = ''
		EndIf
		$sBirth = $oJson.results.birth_date
		$surlPhoto = $oJson.results.photos.index(0).url
		If $isLoadPicture Then
			_HttpRequest('$' & $pathPictrue & $sID & '.jpg', $surlPhoto)
		EndIf

		Return 'Id:' & $sID & '|' & _
				'Name:' & $sName & '|' & _
				'Gender:' & $sgender & '|' & _
				'Distance:' & $sdistence_mi & '|' & _
				'Bio:' & $sBio & '|' & _
				'Birth:' & $sBirth & '|' & _
				'Photo:' & $surlPhoto
	EndIf
EndFunc   ;==>_getInfobyTxtJSON

Func _getInfoByTxtStrRex($rq)
	If _checkStatus($rq) Then
		$sID = _getStrRex($rq, '_id":"(.*?)","')
		$sName = _getStrRex($rq, '"name":"(.*?)","')
		$sgender = _getStrRex($rq, 'gender":(.*?),"')
		$sdistence_mi = _getStrRex($rq, 'distance_mi":(.*?),"')
		$sBio = _getStrRex($rq, 'bio":"(.*?)","')
		$sBirth = _getStrRex($rq, 'birth_date":"(.*?)","')
		$surlPhoto = _getStrRex($rq, 'url":"(.*?)","')
		Return 'Id:' & $sID & '|' & _
				'Name:' & $sName & '|' & _
				'Gender:' & $sgender & '|' & _
				'Distance:' & $sdistence_mi & '|' & _
				'Bio:' & $sBio & '|' & _
				'Birth:' & $sBirth & '|' & _
				'Photo:' & $surlPhoto
	EndIf
EndFunc   ;==>_getInfoByTxtStrRex


Func _getStrRex($rq, $pattern)
	If StringRegExp($rq, $pattern, 0) Then
		Return StringRegExp($rq, $pattern, 1)[0]
	Else
		Return ''
	EndIf
EndFunc   ;==>_getStrRex

Func _checkStatus($rq)
	If StringRegExp($rq, 'status":(\d{3})', 0) == 1 Then
		Local $statuscode = StringRegExp($rq, 'status":(\d{3})', 1)[0]
		If $statuscode == 200 Then Return 1
	Else
		Return 0
	EndIf
EndFunc   ;==>_checkStatus

;~ Lấy thông tin người theo ID
Func _getPerson($id)
	Local $url = $host & '/user/' & $id
	Local $rq = _HttpRequest(2, $url, '', '', '', $Additional_Headers)
	Return $rq
EndFunc   ;==>_getPerson

Func _getAllsByCore()
	Local $url = 'https://api.gotinder.com/v2/recs/core?locale=vi'
;~ 	'https://api.gotinder.com/v2/profile?include=account%2Cboost%2Ccontact_cards%2Cemail_settings%2Cinstagram%2Clikes%2Cnotifications%2Cplus_control%2Cproducts%2Cpurchase%2Creadreceipts%2Cspotify%2Csuper_likes%2Ctinder_u%2Ctravel%2Ctutorials%2Cuser&locale=vi'
	Local $rq = _HttpRequest(2, $url, '', '', '', $Additional_Headers)
	_HttpRequest_SessionClear()
	Return $rq
EndFunc   ;==>_getAllsByCore


Func _like($id)
	Local $url = 'https://api.gotinder.com/like/' & $id & '?locale=vi'
;~ 	&s_number=' & $s_number
	$rq = _HttpRequest(2, $url, '', '', '', 'X-Auth-Token:' & $apiToken)
	Return $rq
;~ 	ConsoleWrite($rq)
EndFunc   ;==>_like


Func _getMatchs()
	Local $url = 'https://api.gotinder.com/v2/matches?count=60&is_tinder_u=false&locale=vi&message=1'
	Local $rq = _HttpRequest(2, $url, '', '', '', 'X-Auth-Token:' & $apiToken)
	Return $rq
EndFunc   ;==>_getMatchs

Func _match_info($match_id)
	Local $url = $host & '/matches/' & $match_id
	Local $rq = _HttpRequest(2, $url, '', '', '', $Additional_Headers)
	Return $rq
EndFunc   ;==>_match_info


Func _login()
	Local $url = 'https://api.gotinder.com/v2/auth/sms/send?auth_type=sms&locale=vi'
	Local $sdt = '840866778294'

;~ 	Gui ma kich hoat
	Local $rq = _HttpRequest(2, $url, '{"phone_number":"' & $sdt & '"}')

	Local $otp_code = InputBox("OTP Code", 'Mã OTP đã được gửi đến', '', '*', 180, 150)
	If StringLen($otp_code) = 0 Then Return MsgBox(0, 0, "Chưa có OTP")

	Local $urlSendOtp = 'https://api.gotinder.com/v2/auth/sms/validate?auth_type=sms&locale=vi'
	$rq = _HttpRequest(2, $urlSendOtp, '{"otp_code":"' & $otp_code & '","phone_number":"' & $sdt & '","is_update":false}')

	Local $refreshToken = _getrefreshToKen($rq)
	FileWrite(@ScriptDir & "\refreshToken.txt", $refreshToken)
	If $refreshToken = '' Then Return MsgBox(0, 0, '$refreshToken không lấy được')

	$urlNext = 'https://api.gotinder.com/v2/auth/login/sms?locale=vi'
	$rq = _HttpRequest(2, $urlNext, '{"refresh_token":"' & $refreshToken & '","phone_number":"' & $sdt & '"}')
	FileWrite(@ScriptDir & "\smsLogin.txt", $rq)

EndFunc   ;==>_login

Func _getHTMLByAuth()
	$urlNext = 'https://api.gotinder.com/v2/recs/core?locale=vi'
	$rq = _HttpRequest(2, $urlNext, '', '', '', 'X-Auth-Token:' & $apiToken)
	FileWrite(@ScriptDir & "\Auth.html", $rq)
EndFunc   ;==>_getHTMLByAuth

;~ Get a user's profile data
Func _getUserProfile($id)
	Local $url = $host & '/user/_' & $id
	Local $rq = _HttpRequest(2, $url, '', '', '', 'X-Auth-Token:' & $apiToken)

	FileWrite(@ScriptDir & "\" & StringLeft($id, 5) & '.txt', $rq)
EndFunc   ;==>_getUserProfile

Func _getrefreshToKen($data)
;~ 	$data = '{"meta":{"status":200},"data":{"refresh_token":"eyJhbGciOiJIUzI1NiJ9.ODQ4NjY3NzgyOTQ.536WUDbm4IpzFPZN4HnxACrOH_ydVSEh8QJPnPQZLYQ","validated":true}}'
	$pattern = 'refresh_token":"(.*?)","'
	Return StringRegExp($data, $pattern, 1)[0]
EndFunc   ;==>_getrefreshToKen

Func _getlistPeopleNearby()
	Local $url = 'https://api.gotinder.com/v2/recs/core?locale=vi'
	Local $rq = _HttpRequest(2, $url)
	Return $rq
EndFunc   ;==>_getlistPeopleNearby

;~ Func _getAPIToken($data)
;~ 	$pattern = 'refresh_token":"(.*?)","'
;~ 	Return StringRegExp($data, $pattern, 1)[0]
;~ EndFunc   ;==>_getAPIToken


;~ Like thử thôi

