#include-once
#include <_HttpRequest.au3>
#include <Date.au3>
#include <File.au3>
#include <storage.au3>



Global $local_Q9 = ['10.844092', '106.783446']
Global $local_Q2 = ['10.7635', '106.7076']
Global $local_Q10 = ['10.767740', '106.667088']
Global $host = 'https://api.gotinder.com'
Global $apiToken = '29cd4db7-c10b-4a18-a9b0-0a96674b41be'
Global $Additional_Headers = 'X-Auth-Token:' & $apiToken

_changeLocation($local_Q10[0], $local_Q10[1])



Func _changeLocation($lat, $lon)
	$url = $host & '/user/ping'
	$rq = _HttpRequest(2, $url, '{"lat":' & $lat & ',"lon":' & $lon & '}', '', '', $Additional_Headers)
	_HttpRequest_SessionClear()
	Return $rq
EndFunc   ;==>_changeLocation































;~ $host = "C:\Users\User\AppData\Roaming\Mozilla\Firefox\Profiles\u9ckx7u3.default-1527872231145\storage\default\https+++tinder.com\"
;~ $file = "cache\caches.sqlite"
;~ $linkFile = $host & $file

;~ $data = FileRead($linkFile)

;~ FileWrite(@ScriptDir&"\testx.txt",$data)




;~ $pattern = '(?s)X-Auth-Token(.*?)' & Chr(6)
;~ $tes = StringRegExp($data, $pattern, 0)

;~ MsgBox(0, 0, $tes)
Func Asc2Unicode($AscString)
    Local $BufferSize = StringLen($AscString) * 2
    Local $Buffer = DllStructCreate("byte[" & $BufferSize & "]")
    Local $Return = DllCall("Kernel32.dll", "int", "MultiByteToWideChar", _
        "int", 0, _
        "int", 0, _
        "str", $AscString, _
        "int", StringLen($AscString), _
        "ptr", DllStructGetPtr($Buffer), _
        "int", $BufferSize)
    Local $UnicodeString = StringLeft(DllStructGetData($Buffer, 1), $Return[0] * 2)
    $Buffer = 0
    Return $UnicodeString
EndFunc

Func Unicode2Asc($UniString)
    If Not IsBinary($UniString) Then
        SetError(1)
        Return $UniString
    EndIf

    Local $BufferLen = StringLen($UniString)
    Local $Input = DllStructCreate("byte[" & $BufferLen & "]")
    Local $Output = DllStructCreate("char[" & $BufferLen & "]")
    DllStructSetData($Input, 1, $UniString)
    Local $Return = DllCall("kernel32.dll", "int", "WideCharToMultiByte", _
        "int", 0, _
        "int", 0, _
        "ptr", DllStructGetPtr($Input), _
        "int", $BufferLen / 2, _
        "ptr", DllStructGetPtr($Output), _
        "int", $BufferLen, _
        "int", 0, _
        "int", 0)
    Local $AscString = DllStructGetData($Output, 1)
    $Output = 0
    $Input = 0
    Return $AscString
EndFunc

Func Unicode2Utf8($UniString)
    If Not IsBinary($UniString) Then
        SetError(1)
        Return $UniString
    EndIf

    Local $UniStringLen = StringLen($UniString)
    Local $BufferLen = $UniStringLen * 2
    Local $Input = DllStructCreate("byte[" & $BufferLen & "]")
    Local $Output = DllStructCreate("char[" & $BufferLen & "]")
    DllStructSetData($Input, 1, $UniString)
    Local $Return = DllCall("kernel32.dll", "int", "WideCharToMultiByte", _
        "int", 65001, _
        "int", 0, _
        "ptr", DllStructGetPtr($Input), _
        "int", $UniStringLen / 2, _
        "ptr", DllStructGetPtr($Output), _
        "int", $BufferLen, _
        "int", 0, _
        "int", 0)
    Local $Utf8String = DllStructGetData($Output, 1)
    $Output = 0
    $Input = 0
    Return $Utf8String
EndFunc

Func Utf82Unicode($Utf8String)
    Local $BufferSize = StringLen($Utf8String) * 2
    Local $Buffer = DllStructCreate("byte[" & $BufferSize & "]")
    Local $Return = DllCall("Kernel32.dll", "int", "MultiByteToWideChar", _
        "int", 65001, _
        "int", 0, _
        "str", $Utf8String, _
        "int", StringLen($Utf8String), _
        "ptr", DllStructGetPtr($Buffer), _
        "int", $BufferSize)
    Local $UnicodeString = StringLeft(DllStructGetData($Buffer, 1), $Return[0] * 2)
    $Buffer = 0
    Return $UnicodeString
EndFunc