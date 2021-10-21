#Requires -Version 5

<#
    .SYNOPSIS
    Download and install the latest available FOSSA release from GitHub.
#>

[CmdletBinding()]
Param()

$OldEAP = $ErrorActionPreference #Preserve the original value
$ErrorActionPreference = "Stop"

[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12

$TempDir = Join-Path ([System.IO.Path]::GetTempPath()) "fossa-installation"
if (![System.IO.Directory]::Exists($TempDir)) {[void][System.IO.Directory]::CreateDirectory($TempDir)}

$compatible_install_script_url = "https://raw.githubusercontent.com/fossas/spectrometer/master/install.ps1"
$compatible_install_script_location = "$TempDir\install.ps1"

(New-Object System.Net.WebClient).DownloadFile($compatible_install_script_url, $compatible_install_script_location)
Invoke-Expression $compatible_install_script_location

$ErrorActionPreference = $OldEAP