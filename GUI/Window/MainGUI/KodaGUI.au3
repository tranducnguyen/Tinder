#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
Opt("GUIOnEventMode", 1)
#Region ### START Koda GUI section ### Form=d:\lap trinh\autoit\project\tinder\gui\window\maingui\maingui.kxf
$BgetInfo = GUICreate("BgetInfo", 423, 182, 210, 154, BitOR($GUI_SS_DEFAULT_GUI,$WS_SIZEBOX,$WS_THICKFRAME), BitOR($WS_EX_TOOLWINDOW,$WS_EX_TOPMOST,$WS_EX_WINDOWEDGE))
GUISetOnEvent($GUI_EVENT_CLOSE, "FAutoEnd")
$LNotice = GUICtrlCreateLabel("Notice....", 8, 104, 47, 17, 0)
GUICtrlSetResizing(-1, $GUI_DOCKLEFT+$GUI_DOCKBOTTOM+$GUI_DOCKWIDTH+$GUI_DOCKHEIGHT)
$BLike = GUICtrlCreateButton("RUN", 328, 24, 89, 33)
$Label1 = GUICtrlCreateLabel("APIToken", 8, 8, 52, 17)
$IApiToken = GUICtrlCreateInput("IAPIToken", 72, 0, 345, 21)
$Label2 = GUICtrlCreateLabel("Time", 8, 32, 27, 17)
$ITime = GUICtrlCreateInput("ITime", 72, 32, 105, 21)
$CHisShutDown = GUICtrlCreateCheckbox("Shutdown", 192, 32, 97, 25)
$BgetInfo = GUICtrlCreateButton("Get Info", 296, 72, 121, 25)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###
