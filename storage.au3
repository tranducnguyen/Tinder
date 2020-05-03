#include-once
#include <Crypt.au3>
#include <File.au3>

_Crypt_Startup()
OnAutoItExitRegister("_Crypt_Shutdown")

Global $__Storage_Tmp = ObjCreate("Scripting.Dictionary")

Global $__Storage_Permanent = @AppDataDir & "\" & StringLower( StringTrimLeft( _Crypt_HashFile(@ScriptFullPath, $CALG_MD5), 2) )
Global $__Storage_Password = _Crypt_HashData(@ScriptFullPath, $CALG_SHA_256)

#Region session
Func sessionStorage($sKey, $sVal = Default)
	If $sVal = Default Then
		If $__Storage_Tmp.Exists($sKey) Then
			Return $__Storage_Tmp.Item($sKey)
		Else
			Return False
		EndIf
	Else
		If $__Storage_Tmp.Exists($sKey) Then
			$__Storage_Tmp.Remove($sKey)
		EndIf

		Return $__Storage_Tmp.Add($sKey, $sVal)
	EndIf
EndFunc

Func store($sKey, $sVal = Default)
	Return sessionStorage($sKey, $sVal)
EndFunc

Func sessionStorage_set($sKey, $sVal)
	Return sessionStorage($sKey, $sVal)
EndFunc

Func sessionStorage_setItem($sKey, $sVal)
	Return sessionStorage_set($sKey, $sVal)
EndFunc

Func sessionStorage_get($sKey)
	Return sessionStorage($sKey)
EndFunc

Func sessionStorage_getItem($sKey)
	Return sessionStorage_get($sKey)
EndFunc

Func sessionStorage_remove($sKey)
	If $__Storage_Tmp.Exists($sKey) Then
		Return $__Storage_Tmp.Remove($sKey)
	EndIf
EndFunc

Func sessionStorage_clear()
	Return $__Storage_Tmp.RemoveAll()
EndFunc

Func sessionStorage_clearAll()
	Return sessionStorage_clear()
EndFunc
#EndRegion

#Region local
Func localStorage_startup($sFile = Default, $sPassword = Default)
	If $sFile <> Default Then Global $__Storage_Permanent = $sFile
	If $sPassword <> Default Then Global $__Storage_Password = $sPassword
EndFunc

Func localStorage($sKey, $sVal = Default)
	Local $sDecrypted = __localStorage_decrypt()
	If $sVal = Default Then
		Local $ret = IniRead($sDecrypted, "storage", $sKey, "")
		FileDelete($sDecrypted)
		Return $ret
	Else
		IniWrite($sDecrypted, "storage", $sKey, $sVal)
		__localStorage_encrypt($sDecrypted)
	EndIf
EndFunc

Func store2($sKey, $sVal = Default)
	Return localStorage($sKey, $sVal)
EndFunc

Func localStorage_set($sKey, $sVal)
	Return localStorage($sKey, $sVal)
EndFunc

Func localStorage_setItem($sKey, $sVal)
	Return localStorage_set($sKey, $sVal)
EndFunc

Func localStorage_get($sKey)
	Return localStorage($sKey)
EndFunc

Func localStorage_getItem($sKey)
	Return localStorage($sKey)
EndFunc

Func localStorage_remove($sKey)
	Local $sDecrypted = __localStorage_decrypt()
	IniDelete($sDecrypted, "storage", $sKey)
	Return __localStorage_encrypt($sDecrypted)
EndFunc

Func localStorage_clearAll()
	FileDelete($__Storage_Permanent)
EndFunc
#EndRegion


; ========== internal use only ==========

Func __localStorage_decrypt()
	Local $dec = _TempFile()
	_Crypt_DecryptFile($__Storage_Permanent, $dec, $__Storage_Password, $CALG_AES_256)
	Return $dec
EndFunc

Func __localStorage_encrypt($sFile)
	_Crypt_EncryptFile($sFile, $__Storage_Permanent, $__Storage_Password, $CALG_AES_256)
	FileDelete($sFile)
EndFunc