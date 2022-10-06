$hostfile = "$env:windir\system32\drivers\etc\hosts"
$file = Get-Content $hostfile

# # Add entry
$file += "172.30.20.69  deapi.isnc.local"
Set-Content -Path $hostfile -Value $file -Force

# gci cert:\ -Recurse | where{$_.Subject -like '*172.30.20.69*'} | Remove-Item -Force -Verbose

Import-Certificate -FilePath ".\deapi.pem" -CertStoreLocation Cert:\LocalMachine\Root
