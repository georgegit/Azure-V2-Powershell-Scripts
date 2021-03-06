#Deploy script to machine using Custom Script Extension
#This will created a firewall rule for 'WinRM HTTPS" and Configure WinRM for HTTPS using certificate
Param(
    $DNSLabel,
    $thumbprint
)
New-NetFirewallRule -Name "WinRM HTTPS" -DisplayName "WinRM HTTPS" -Enabled True -Profile Any -Action Allow -Direction Inbound -LocalPort 5986 -Protocol TCP
New-WSManInstance -ResourceURI winrm/config/Listener -SelectorSet @{Address='*';Transport="HTTPS"} -ValueSet @{Hostname="$DNSLabel";CertificateThumbprint="$thumbprint"}