# Load lmgrd.exe process and start license server
Start-Process 'C:\FlexLM\lmgrd.exe' '-c "C:\license\maya2019.lic" -L "C:\Logs\debug.log"' -PassThru | Wait-Process;

# Note beginning of log file output
Write-Output 'Tailing log file'

# Tail the log output to keep container running
Get-Content -path 'C:\Logs\debug.log' -Tail 1 -Wait
