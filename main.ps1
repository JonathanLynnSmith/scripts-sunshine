

param (
    [switch]$HD,
    [switch]$QHD,
    [switch]$Undo
)

$switchDisplaysPath = "$PSScriptRoot\scripts\switch-display.ps1"
$muteSpeakersPath = "$PSScriptRoot\scripts\mute-speakers.ps1"
$killSteamPath = "$PSScriptRoot\scripts\switch-display.ps1"


if ($HD) {
    Invoke-Expression $killSteamPath
    Invoke-Expression $muteSpeakersPath $quotedConfigs
    Invoke-Expression "$switchDisplaysPath -HD"
}
elseif ($QHD) {
    Invoke-Expression $killSteamPath
    Invoke-Expression $muteSpeakersPath
    Invoke-Expression "$switchDisplaysPath -QHD"
}
elseif($Undo){
    Invoke-Expression "$switchDisplaysPath -Undo"
    Invoke-Expression "$muteSpeakersPath -Undo"
}

Start-Sleep 5