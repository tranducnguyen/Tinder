
Opt("GUICloseOnESC",1)


#include "Array.au3"


#include "GlobalVar.au3"
#include "FileInstall.au3"
#include "SaiTest.au3"
#include "GUI/GUI.au3"
#include "Functions.au3"
#include "FuncsTinder.au3"


HotKeySet("^+{del}","FToolTipDel")

HotKeySet("+{esc}","FAutoEnd")

FAutoStart()

While 1
	Sleep(72)
	FAutoPause()
	STShow()
WEnd
