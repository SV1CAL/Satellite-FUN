$regsvrp = Start-Process regsvr32.exe -ArgumentList "/s DJTSatLib.dll" -PassThru
$regsvrp.WaitForExit(5000) # Wait (up to) 5 seconds
if($regsvrp.ExitCode -ne 0)
{
    Write-Warning "regsvr32 exited with error $($regsvrp.ExitCode)"
}