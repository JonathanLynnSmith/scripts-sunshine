# Installation and Setup Guide

*Note: This is not a complete setup guide. These are just notes for things that were slightly confusing and will make setting up a new install faster.*

## Install

### Project link
[Sunshine Project](https://github.com/LizardByte/Sunshine)

### Install Files
Go to the project link and select releases on the right side. Select the right file for your host machine.

## Initial Setup

1. **Install Sunshine**
   - Run the `.exe` and a command window will display with the ip:port needed to access the web UI to start your setup (see sections below for setup instructions).

2. **Setup as a service**
   - Find the Sunshine application on your machine, then navigate to the scripts folder where there should be a script that will install Sunshine on your device.

## Configuration Setup

Use the tools from the install to help with this section.

### Audio

- **Audio Sink**
  - Only needed if you want your PC and device to play audio at the same time.

- **Virtual Sink (preferred)**
  - Needed to mute the speakers on the PC but play audio to device. You can use any virtual audio interface. Steam’s virtual audio interface is preferred.

- **Adapter Name & Output Name**
  - Use the tool listed in the description under the input to get this. It needs the exact name that it’s looking for.

### Application Setup

#### Running An Application

- **To kill a program after a session**
  - Place the application in the command input section.

- **To leave a program running after a session**
  - Place it in the Detached commands section.

#### Before and After Session Commands

- **Do**
  - Commands to run before the application is executed.

- **Undo**
  - Commands to run after the application is executed.

### Images

- Images are suggested to be at 502x720 pixels.
- Use GIMP to help crop the image to this size.
- Place images in the application directory under assets.
- Must be in PNG format.
