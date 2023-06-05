$InputFile = "input.txt"
$ConfigFileName = "setting_number_of_characters_per_line.txt"
$OutputFile = "output.txt"

if (Test-Path $InputFile) {
    $Content = Get-Content $InputFile | Out-String
    $ConfigFilePath = Join-Path -Path (Split-Path -Parent $MyInvocation.MyCommand.Path) -ChildPath $ConfigFileName

    if (Test-Path $ConfigFilePath) {
        $CharactersPerLine = [int](Get-Content $ConfigFilePath | Out-String)
        $ContentWithLineBreaks = ""
        $Index = 0

        while ($Index -lt $Content.Length) {
            $ContentWithLineBreaks += $Content.Substring($Index, [Math]::Min($CharactersPerLine, $Content.Length - $Index))
            $Index += $CharactersPerLine
            $ContentWithLineBreaks += "`n"
        }

        $ContentWithLineBreaks | Out-File -FilePath $OutputFile -Encoding UTF8
        Write-Host "Line breaks added correctly."
    } else {
        Write-Host "Error: Configuration file not found."
    }
} else {
    Write-Host "Error: Input file not found."
}