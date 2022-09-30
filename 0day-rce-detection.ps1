$Test1 = Test-Path "C:\Program Files\Microsoft\Exchange Server\V15\FrontEnd\HttpProxy\owa\auth\pxh4HG1v.ashx"
if ($Test1 -eq $true) {
    $Hash = Get-FileHash -Algorithm SHA256 "C:\Program Files\Microsoft\Exchange Server\V15\FrontEnd\HttpProxy\owa\auth\pxh4HG1v.ashx"
    if ($Hash.hash -eq "c838e77afe750d713e67ffeb4ec1b82ee9066cbe21f11181fd34429f70831ec1") {
        Write-Warning "Dangerous hash found for test1 - pxh4HG1v.ashx"
    }
    else {
        Write-Warning "pxh4HG1v.ashx exists but the hash is not suspicious"
    }
}

$Test2 = Test-Path "C:\Program Files\Microsoft\Exchange Server\V15\FrontEnd\HttpProxy\owa\auth\RedirSuiteServiceProxy.aspx"
if ($Test2 -eq $True) {
    $Hash = Get-FileHash -Algorithm SHA256 "C:\Program Files\Microsoft\Exchange Server\V15\FrontEnd\HttpProxy\owa\auth\RedirSuiteServiceProxy.aspx"
    if ($Hash.Hash -eq "65a002fe655dc1751add167cf00adf284c080ab2e97cd386881518d3a31d27f5" -or $Hash.hash -eq "b5038f1912e7253c7747d2f0fa5310ee8319288f818392298fd92009926268ca") {
        Write-Warning "Dangerous hashes found for test2 - RedirSuiteServiceProxy.aspx"
    }
    else {
        Write-Warning "RedirSuiteServiceProxy.aspx exists but the hash is not suspicious"
    }
}

$Test3 = Test-Path "C:\Program Files\Microsoft\Exchange Server\V15\FrontEnd\HttpProxy\owa\auth\errorEE.aspx"
if ($Test3 -eq $True) {
    $Hash = Get-FileHash -Algorithm SHA256 "C:\Program Files\Microsoft\Exchange Server\V15\FrontEnd\HttpProxy\owa\auth\errorEE.aspx"
    if ($Hash.hash -eq "be07bd9310d7a487ca2f49bcdaafb9513c0c8f99921fdf79a05eaba25b52d257") {
        Write-Warning "Dangerous hashes found for test3 - errorEE.aspx"
    }
    else {
        Write-Warning 'errorEE.aspx exists but the hash is not suspicious'
    }
}

$Test4 = Test-Path "C:\inetpub\wwwroot\aspnet_client\Xml.ashx"
if ($Test4 -eq $True) {
    Write-Warning "Xml.ashx exists in the wwwroot\aspnet_client directory"
}