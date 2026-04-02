$root='C:\R1CL-Padavan-NG'
$files=@('configs\board.h','configs\partition.map','configs\wifi_eeprom.map','configs\.config','patches\mt7628_led_fix.patch')
$ok=$true
foreach($f in $files){
  $p=Join-Path $root $f
  if(-not (Test-Path $p)){ Write-Host "MISSING: $f" -ForegroundColor Red; $ok=$false } else {
    $size = (Get-Item $p).Length
    if($size -eq 0){ Write-Host "EMPTY: $f (size 0)" -ForegroundColor Yellow; $ok=$false } else { Write-Host "OK: $f (size $size bytes)" -ForegroundColor Green }
  }
}
if($ok){ Write-Host "All files present and non-empty." -ForegroundColor Cyan } else { Write-Host "Fix missing/empty files before push." -ForegroundColor Magenta }
