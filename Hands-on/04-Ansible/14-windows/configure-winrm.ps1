netsh firewall add portopening TCP 5986 "WinRM over HTTPS"
netsh firewall add portopening TCP 5985 "WinRM over HTTPS"
Enable-PSRemoting -SkipNetworkProfileCheck -Force
Set-NetConnectionProfile -NetworkCategory Private

winrm quickconfig
winrm set winrm/config/service '@{AllowUnencrypted="true"}'
winrm set winrm/config/service/Auth '@{Basic="true"}'

Set-Item wsman:\localhost\client\trustedhosts * -Force -Confirm:$false

Restart-Service WinRM

