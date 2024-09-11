param (
    [string]$folderName
)

# Ensure the folder exists
if (-Not (Test-Path -Path $folderName)) {
    Write-Host "The folder does not exist."
    exit
}

# Loop through all XML files in the folder
Get-ChildItem -Path $folderName -Filter *.xml | ForEach-Object {
    $xmlFile = $_.FullName
    [xml]$xmlContent = Get-Content -Path $xmlFile

    # Extract the content of the <Definition> node
    $definitionContent = $xmlContent.SelectSingleNode("//Definition").InnerText

    if ($definitionContent -ne $null) {
        # Replace all instances of \r\n with a newline
        $modifiedContent = $definitionContent -replace "\\r\\n", "`r`n"

        # Save the modified content to a new file with a .robin suffix
        $newFileName = [System.IO.Path]::ChangeExtension($xmlFile, ".robin")
        Set-Content -Path $newFileName -Value $modifiedContent
    }
}