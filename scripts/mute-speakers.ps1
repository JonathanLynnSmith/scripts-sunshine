#Switches Monitors to 1080p For Sunshine Server

param (
    [switch]$Undo
)

$resourcesPath = "$PSScriptRoot\..\resources\"
$volumeToolPath = "$resourcesPath\SoundVolumeView\SoundVolumeView.exe"

$muteSpeakersCommand = "$volumeToolPath /mute Speakers"
$unmuteSpeakersCommand = "$volumeToolPath /unmute Speakers"

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

function RunCommand {
    param (
        [string]$Command
    )

    Write-Host $Command
    Invoke-Expression $Command
}

Main

