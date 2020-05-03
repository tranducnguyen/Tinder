
;~ == Auto Var =========================================
Global $GUIVersion = "2.0.5.7"
Global $AutoName = "SaiGUI"
Global $AutoVersion = $GUIVersion
Global $AutoShow = 1
Global $AutoPos[2] = [0,0]
Global $AutoPause = 0
Global $Testing = 0
Global $DataFolder = "data"
Global $DataFile = $DataFolder&"\data.ini"
Global $LangFile = $DataFolder&"\lang.txt"
Global $CommandList[1] = [-1]
Global $CommandCurrent[2] = [0,0]
Global $MainGUI=""


Global $SaveLog = 0
Global $LogFile = 0
Global $LogDate = @YEAR &"-"& @MON &"-"& @MDAY &" "& @HOUR
Global $LogFileName = "log\"&$LogDate&".ini"

Global $host = 'https://api.gotinder.com'
Global $apiToken = '29cd4db7-c10b-4a18-a9b0-0a96674b41be'
Global $Additional_Headers = 'X-Auth-Token:' & $apiToken
Global $pathSave = @ScriptDir & "\Save\"
Global $pathPictrue = @ScriptDir & "\pictures\"
Global $isLoadPicture = False
Global $local_Q9 = ['10.844092', '106.783446']
Global $local_Q2 = ['10.7635', '106.7076']
Global $local_Q10 = ['10.767740', '106.667088']
Global $local_BT = ['10.804170', '106.708706']

Global $sNote=''
Global $hourCheck = 1 ;Thời gian chạy
Global $isShutDown = False