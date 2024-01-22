#Switches Monitors to 1080p For Sunshine Server

param (
    [switch]$Undo,
    [switch]$HD,
    [switch]$QHD
)

$scriptFolder = $PSScriptRoot

$monitorToolRoot = "$scriptFolder\..\resources\MultiMonitorTool"
$monitorToolPath = "$monitorToolRoot\MultiMonitorTool.exe"
$monitorConfigsPath = "$monitorToolRoot\configs"
$qhdConfig = "QHD.cfg"
$hdConfig = "HD.cfg"
$undoConfig = "undo.cfg"
$volumeToolPath = "$scriptFolder\resources\SoundVolumeView\SoundVolumeView.exe"


function Main{
    if($QHD) {
        MuteSpeakers
        LoadMonitorConfig -config_name $qhdConfig
    }
    elseif($HD) {
        MuteSpeakers
        LoadMonitorConfig -config_name $hdConfig
    }
    elseif ($Undo) {
        UnMuteSpeakers
        LoadMonitorConfig -config_name $undoConfig
    }
    else {
        Write-Host "Invalid Action"
    }
}

function LoadMonitorConfig {
    param (
        [string]$config_name
    )
    & $monitorToolPath /LoadConfig "$monitorConfigsPath\$config_name"
}

function MuteSpeakers {
    & $volumeToolPath /mute Speakers
}

function UnMuteSpeakers {
    & $volumeToolPath /unmute Speakers
}

Main

