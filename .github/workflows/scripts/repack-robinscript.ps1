##########################################################
#
# This script will read all *.data.robin files in the 
# specified  folder and pack them into their associated 
# *.data.xml files.
#
##########################################################

param (
    [string]$folderName
)

# Ensure the folder exists
if (-Not (Test-Path -Path $folderName)) {
    Write-Host "The folder does not exist."
    exit
}

# Loop through all XML files in the folder
Get-ChildItem -Path $folderName -Filter *.robin | ForEach-Object {

    $robinFile = $_.FullName
    [string]$robinContent = Get-Content -Path $robinFile  -Encoding UTF8
        
    $xmlFile = [System.IO.Path]::ChangeExtension($robinFile, ".xml")
    [xml]$xmlContent = Get-Content -Path $xmlFile
    
    [string]$modifiedContent = ""

    foreach($line in [System.IO.File]::ReadLines($robinFile))
    {
    
        $modifiedContent = $modifiedContent + $line 

        # Add a newline on every line except the last
        if($line -ne "`"")
        {   
            $modifiedContent = $modifiedContent + "\r\n"
        }
    }

    $xmlContent.Workflow.Definition = $modifiedContent

    $xmlContent.Save($xmlFile)

}