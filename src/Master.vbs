

strUser = CreateObject("WScript.Network").UserName
path= "C:\Users\"+strUser+"\exp.bat"

Set WshShell = CreateObject("WScript.Shell")
WshShell.Run chr(34) & path & Chr(34), 0
Set WshShell = Nothing