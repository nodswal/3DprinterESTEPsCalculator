#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>

$inputVal1="120"
$inputVal2="93.00"

#Region ### START Koda GUI section ### Form=C:\Users\d3aws\Documents\_programs\estep_calculator Koda FormDesigner.kxf
$Form1_1 = GUICreate("Estep Calculator", 331, 558, 1021, 383)
$Label1 = GUICtrlCreateLabel("Step 1: Connect to printer", 16, 16, 125, 17)
$Label2 = GUICtrlCreateLabel("Step 2: Heat nozzle to print tempatures", 16, 40, 187, 17)
GUICtrlSetTip(-1, "Extruder won't extrude with a cold nozzle.")
$Label3 = GUICtrlCreateLabel("Step 3: Disconnect PTFE tubing from extruder", 16, 64, 221, 17)
$Label4 = GUICtrlCreateLabel("Step 4: Mark filament entering extruder", 16, 88, 186, 17)
$Label5 = GUICtrlCreateLabel("Step 5: Extrude 100mm of filament.", 16, 112, 168, 17)
$Label6 = GUICtrlCreateLabel("G1 E100 F100", 112, 136, 73, 17)
$Label7 = GUICtrlCreateLabel("Step 6: Mark and measure total extruded filament.", 16, 168, 238, 17)
$Label8 = GUICtrlCreateLabel("Calculation", 16, 320, 56, 17)
$Label9 = GUICtrlCreateLabel("(100 /", 24, 336, 33, 17)
$estepsValue = GUICtrlCreateLabel("New Estep", 224, 336, 56, 17)
$Label12 = GUICtrlCreateLabel("Step 7: Type M503 and scroll up to line similar to the line below", 16, 232, 300, 17)
$Input1 = GUICtrlCreateInput("0", 176, 192, 73, 21)
$Input2 = GUICtrlCreateInput("93.00", 232, 288, 73, 21)
$Label13 = GUICtrlCreateLabel("Extruded:", 120, 200, 49, 17)
$Label14 = GUICtrlCreateLabel("Current Esteps:", 120, 336, 76, 17)
$Label15 = GUICtrlCreateLabel("mm", 256, 200, 20, 17)
$Pic1 = GUICtrlCreatePic("C:\Users\d3aws\Desktop\AutoIT scripts\M92_EstepsExample.jpg", 8, 248, 321, 33)
$Label16 = GUICtrlCreateLabel("E for esteps, type that number:  E", 64, 296, 161, 17)
$extrudedValue = GUICtrlCreateLabel("Extruded )  X", 56, 336, 65, 17)
$Label10 = GUICtrlCreateLabel("M92 E###.##", 128, 400, 73, 17)
$Label17 = GUICtrlCreateLabel("=", 200, 336, 10, 17)
$Label18 = GUICtrlCreateLabel("Step 8: Enter in the following command", 16, 376, 188, 17)
$Label19 = GUICtrlCreateLabel("Step 9: Save the change to the eprom", 16, 424, 185, 17)
$Label20 = GUICtrlCreateLabel("M500", 128, 448, 31, 17)
$Label21 = GUICtrlCreateLabel("Copy Terminal codes on click", 160, 488, 161, 25)
;~ GUICtrlSetState(-1, $GUI_CHECKED)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit

		Case $Form1_1
		Case $Label6
			ClipPut(GUICtrlRead($Label6))

		Case $Label12
			ClipPut("M503")
		Case $Input1
			$inputVal1=GUICtrlRead($Input1)
			GUICtrlSetData($extrudedValue, $inputVal1)
			$esteps=Round((100/$inputVal1)*$inputVal2,3)
			GUICtrlSetData($Label10,"M92 E" & $esteps)

		Case $Input2
			$inputVal2=GUICtrlRead($Input2)
			GUICtrlSetData($Label14, $inputVal2)
			$esteps=Round((100/$inputVal1)*$inputVal2,3)
			GUICtrlSetData($Label10,"M92 E" & $esteps)

		Case $Label10
			ClipPut(GUICtrlRead($Label10))
		Case $Label20
			ClipPut("M500")
	EndSwitch
WEnd
