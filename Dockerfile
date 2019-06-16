#Luke williams - Windows Server Core 2019 FlexLM Container for Autodesk 2020 Suite

#Base image.
FROM mcr.microsoft.com/windows/servercore:ltsc2019
LABEL maintainer="l.williams@derby.ac.uk"

#Expose default FlexLM ports
EXPOSE 2080 27000-27009

#Set shell as PowerShell
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

#Add FlexLM program files to the container root.
ADD /FlexLM /FlexLM

#Create license directory and add the license file from Autodesk
RUN ni c:\license -ItemType directory
ADD /license-autodesk-2020-100155D070E7E.lic /license/autodesk_2020.lic

#Create logs directory and debug log required by some license services.
RUN ni c:\logs -ItemType directory; ni c:\logs\debug.log

#Add container start script
ADD /run.ps1 /run.ps1

#Container start command
CMD powershell -Command .\run.ps1