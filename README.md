# 0day-rce-september-2022

CVE identifiers:

- CVE-2022-41040
- CVE-2022-41082

Very crude and quickly written scripts to scan if there are any webshells on your Exchange server related to the 0day RCE as mentioned here:

- <https://gteltsc.vn/blog/warning-new-attack-campaign-utilized-a-new-0day-rce-vulnerability-on-microsoft-exchange-server-12715.html#:~:text=Temporary%20containment%20measures>
- <https://msrc-blog.microsoft.com/2022/09/29/customer-guidance-for-reported-zero-day-vulnerabilities-in-microsoft-exchange-server/>

`0day-rce-detection.ps1` checks if the files exist and if they do, check if their hashes match the currently known IOCs.

`scan-logs.ps1` check the IIS logs for any mention of `'powershell.*autodiscover\.json.*\@.*200'`.
