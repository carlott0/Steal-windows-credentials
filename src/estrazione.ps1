$d="C:\Users\"
$user=$env:UserName

$f="\system.txt"
$new_path=$d+$user+$f

cp $new_path .