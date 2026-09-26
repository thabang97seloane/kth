# Windows version of download-images.sh
# Downloads the remaining 7 website photos (5 are already included) into assets\img\photos\ and updates the
# pages to use those local copies. Run from the website folder:
#   powershell -ExecutionPolicy Bypass -File scripts\download-images.ps1
$ErrorActionPreference = 'Stop'
$cdn  = 'https://d8j0ntlcm91z4.cloudfront.net/user_3JV4uleisDnfjPxWDEigzoZjHHt/'
$site = 'https://www.kasitechhub.co.za'
$imgs = [ordered]@{
  'poster'       = 'hf_20260926_125216_51a10f20-39b2-4c3d-bf39-344d93b96498'
  'social-media' = 'hf_20260926_125216_acf73781-5646-41f3-902a-8734a750a89c'
  'powerpoint'   = 'hf_20260926_125216_dae05018-004c-401d-9f7d-161fc2ddcc3b'
  'job-search'   = 'hf_20260926_125216_9ce984f4-3634-44bd-bc05-bc726876c1a0'
  'building'     = 'hf_20260926_125216_9e14f090-a2b2-4d70-9766-797fb8b77fbd'
  'graduates'    = 'hf_20260926_125243_c3351b5f-0755-4ce2-a9d0-02a6b1ad0cc9'
  'word'         = 'hf_20260926_125216_6c82ff08-cc99-49a5-a837-b574ddd1720a'
}
New-Item -ItemType Directory -Force -Path 'assets\img\photos' | Out-Null
$files = @(Get-ChildItem -Path . -Filter *.html) + @(Get-Item 'sitemap.xml')
foreach ($name in $imgs.Keys) {
  $id = $imgs[$name]
  Invoke-WebRequest -Uri "$cdn${id}_min.webp" -OutFile "assets\img\photos\$name.webp" -UseBasicParsing
  Invoke-WebRequest -Uri "$cdn$id.png"        -OutFile "assets\img\photos\$name.png"  -UseBasicParsing
  foreach ($f in $files) {
    $text = [IO.File]::ReadAllText($f.FullName)
    $text = $text.Replace("$cdn${id}_min.webp", "assets/img/photos/$name.webp")
    $text = $text.Replace("$cdn$id.png", "$site/assets/img/photos/$name.png")
    [IO.File]::WriteAllText($f.FullName, $text)
  }
  Write-Host "saved $name"
}
foreach ($f in Get-ChildItem -Path . -Filter *.html) {
  $lines = [IO.File]::ReadAllLines($f.FullName) | Where-Object { $_ -notmatch 'd8j0ntlcm91z4\.cloudfront\.net' }
  [IO.File]::WriteAllLines($f.FullName, $lines)
}
Write-Host 'Done. All photos are in assets\img\photos'
