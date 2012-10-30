﻿function Write-Host {
param(
  [Parameter(Position=0, ValueFromPipeline=$true, ValueFromRemainingArguments=$true)][object] $Object,
  [Parameter()][switch] $NoNewLine, 
  [Parameter(Mandatory=$false)][ConsoleColor] $ForegroundColor, 
  [Parameter(Mandatory=$false)][ConsoleColor] $BackgroundColor,
  [Parameter(Mandatory=$false)][Object] $Separator
)

  $chocoPath = (Split-Path -parent $helpersPath)
  $chocoInstallLog = Join-Path $chocoPath 'chocolateyInstall.log'
  $Object | Out-File -FilePath $chocoInstallLog -Force -Append

  $oc = Get-Command 'Write-Host' -Module 'Microsoft.PowerShell.Utility' 
  #I owe this guy a drink - http://powershell.com/cs/blogs/tobias/archive/2011/08/03/clever-splatting-to-pass-optional-parameters.aspx
  & $oc @PSBoundParameters
}