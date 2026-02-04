$TempPath = "C:\IIS-monitoring-setup\temp_sim"

$count = 0
if (Test-Path $TempPath) {
    $count = (Get-ChildItem -Path $TempPath -Recurse -File -ErrorAction SilentlyContinue).Count
}

@"
# HELP windows_temp_file_count Number of temp-like files (simulated)
# TYPE windows_temp_file_count gauge
windows_temp_file_count $count
"@ | Out-File "C:\Program Files\windows_exporter\textfile_inputs\windows_temp_files.prom" -Encoding ascii
