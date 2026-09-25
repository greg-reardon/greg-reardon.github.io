# Run from any directory with PowerShell:
# powershell -NoProfile -ExecutionPolicy Bypass -File scripts/export-banner-thumbnails.ps1
# Rasterizes the banner's existing CSS fit/position/zoom settings, without changing originals.
$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.Drawing
$root = Split-Path $PSScriptRoot -Parent
$configPath = Join-Path $root '_data/publication_banner.yml'
$configJson = & ruby -ryaml -rjson -e 'puts JSON.generate(YAML.load_file(ARGV[0]))' $configPath
if ($LASTEXITCODE -ne 0) { throw 'Could not read banner crop settings with Ruby.' }
$config = $configJson | ConvertFrom-Json
$output = Join-Path $root 'images/banner'
[System.IO.Directory]::CreateDirectory($output) | Out-Null
$encoder = [System.Drawing.Imaging.ImageCodecInfo]::GetImageEncoders() | Where-Object MimeType -eq 'image/jpeg'
$parameters = [System.Drawing.Imaging.EncoderParameters]::new(1)
$parameters.Param[0] = [System.Drawing.Imaging.EncoderParameter]::new([System.Drawing.Imaging.Encoder]::Quality, [long]88)
$width = 900
$height = 600
try {
    foreach ($entry in $config.PSObject.Properties) {
        $crop = $entry.Value
        $image = [System.Drawing.Image]::FromFile((Join-Path $root ('images/user/' + $entry.Name)))
        $bitmap = [System.Drawing.Bitmap]::new($width, $height)
        $graphics = [System.Drawing.Graphics]::FromImage($bitmap)
        try {
            $graphics.Clear([System.Drawing.Color]::White)
            $graphics.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
            $graphics.PixelOffsetMode = [System.Drawing.Drawing2D.PixelOffsetMode]::HighQuality
            $scale = [math]::Max($width / $image.Width, $height / $image.Height)
            if ($crop.fit -eq 'contain') { $scale = [math]::Min($width / $image.Width, $height / $image.Height) }
            $position = @(0.5, 0.5)
            $origin = @(0.5, 0.5)
            if ($crop.position) { $position = @($crop.position.Split(' ') | ForEach-Object { [double]$_.TrimEnd('%') / 100 }) }
            if ($crop.origin) { $origin = @($crop.origin.Split(' ') | ForEach-Object { [double]$_.TrimEnd('%') / 100 }) }
            $zoom = 1.0
            if ($crop.zoom) { $zoom = [double]$crop.zoom }
            $drawWidth = $image.Width * $scale
            $drawHeight = $image.Height * $scale
            $x = ($width - $drawWidth) * $position[0] * $zoom + (1 - $zoom) * $origin[0] * $width
            $y = ($height - $drawHeight) * $position[1] * $zoom + (1 - $zoom) * $origin[1] * $height
            $graphics.DrawImage($image, [single]$x, [single]$y, [single]($drawWidth * $zoom), [single]($drawHeight * $zoom))
            $name = [System.IO.Path]::GetFileNameWithoutExtension($entry.Name) + '.jpg'
            $bitmap.Save((Join-Path $output $name), $encoder, $parameters)
            Write-Output "Exported $name ($width x $height)"
        } finally {
            $graphics.Dispose()
            $bitmap.Dispose()
            $image.Dispose()
        }
    }
} finally { $parameters.Dispose() }
