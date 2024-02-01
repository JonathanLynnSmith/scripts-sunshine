#Switches Monitors to 1080p For Sunshine Server

param (
    [switch]$Undo
)

$config = Get-Content -Path "$PSScriptRoot\..\config.json" | ConvertFrom-Json
$volumeToolPath = $config.SoundVolumeViewPath
$muteSpeakersCommand = ". ""$volumeToolPath"" /mute Speakers"
$unmuteSpeakersCommand = ". ""$volumeToolPath"" /unmute Speakers"

function Main{
    if ($Undo) {
        UnMuteSpeakers
    }
    else {
        & $volumeToolPath /mute Speakers
    }
}

function MuteSpeakers {
    RunCommand -Command $muteSpeakersCommand
}

function UnMuteSpeakers {
    RunCommand -Command $unmuteSpeakersCommand
}

Main

function RunCommand {
    param (
        [string]$Command
    )
        Write-Host "> $Command"
        Invoke-Expression $Command
        Start-Sleep 1
}
