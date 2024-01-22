#Switches Monitors to 1080p For Sunshine Server

param (
    [switch]$Undo,
    [switch]$HD,
    [switch]$QHD,
    [switch]$QHD_Dummy,
    [switch]$Print,
    [switch]$OpenTool
)

$resourcesPath = "$PSScriptRoot\..\resources\"
$monitorToolPath = "$resourcesPath\MultiMonitorTool\MultiMonitorTool.exe"
$monitorConfigsPath = "$resourcesPath\MultiMonitorTool\configs"
$qhdConfig = "QHD.cfg"
$qhdDummyConfig = "QHD_Dummy.cfg"
$hdConfig = "HD.cfg"
$undoConfig = "undo.cfg"
$volumeToolPath = "$resourcesPath\SoundVolumeView\SoundVolumeView.exe"


function Main{
    if($OpenTool){
        & $monitorToolPath
    }
    elseif($QHD) {
        MuteSpeakers
        LoadMonitorConfig -config_name $qhdConfig
    }
    elseif($QHD_Dummy) {
        MuteSpeakers
        LoadMonitorConfig -config_name $qhdDummyConfig
    }
    elseif($HD) {
        MuteSpeakers
        LoadMonitorConfig -config_name $hdConfig
    }
    elseif ($Undo) {
        UnMuteSpeakers
        
        # Running Twice Because Main Monitor will not always be detected immediately 
        LoadMonitorConfig -config_name $undoConfig
        Start-Sleep 2
        LoadMonitorConfig -config_name $undoConfig
    }
    else {
        Write-Host "Invalid Action"
    }
}

function LoadMonitorConfig {
    param (
        [string]$config_name,
        [switch]$Print
    )
    
    $Command = "$monitorToolPath /LoadConfig ""$monitorConfigsPath\$config_name"""
    
    if ($Print) {
        Write-Host $Command
    } else {
        Invoke-Expression $Command
    }
}

function MuteSpeakers {
    & $volumeToolPath /mute Speakers
}

function UnMuteSpeakers {
    & $volumeToolPath /unmute Speakers
}

Main

