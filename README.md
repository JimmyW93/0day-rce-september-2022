# 0day-rce-september-2022

CVE identifiers:

- CVE-2022-41040
- CVE-2022-41082

Very crude and quickly written scripts to scan if there are any webshells on your Exchange server related to the 0day RCE as mentioned here:

- <https://gteltsc.vn/blog/warning-new-attack-campaign-utilized-a-new-0day-rce-vulnerability-on-microsoft-exchange-server-12715.html#:~:text=Temporary%20containment%20measures>
- <https://msrc-blog.microsoft.com/2022/09/29/customer-guidance-for-reported-zero-day-vulnerabilities-in-microsoft-exchange-server/>

`0day-rce-detection.ps1` checks if the files exist and if they do, check if their hashes match the currently known IOCs.

`scan-logs.ps1` check the IIS logs for any mention of `'powershell.*autodiscover\.json.*\@.*200'`.

Microsoft also recommends disabling remote PowerShell for non-admin users:

- <https://msrc-blog.microsoft.com/2022/09/29/customer-guidance-for-reported-zero-day-vulnerabilities-in-microsoft-exchange-server/>
- <https://learn.microsoft.com/en-us/powershell/exchange/control-remote-powershell-access-to-exchange-servers?view=exchange-ps&viewFallbackFrom=exchange-ps%22%20%5Cl%20%22use-the-exchange-management-shell-to-enable-or-disable-remote-powershell-access-for-a-user>

Which can be done fairly quickly using the following examples:

This disables remote PowerShell for all users except the admin:

```PowerShell
$DSA = Get-User -ResultSize Unlimited -Filter "(Name -NotLike '*Administrator*')"
$DSA | foreach { Set-User -Identity $_ RemotePowerShellEnabled $false }
```

If you want to check if it worked, you can check which accounts still have remote PowerShell enabled (or disabled by changing setting the parameter to false):

```PowerShell
Get-User -ResultSize Unlimited -Filter 'RemotePowerShellEnabled -eq $true'
```
