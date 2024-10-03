# fasta_to_excel.ps1
# Script to convert FASTA files to CSV format for Excel

Param (
    [Parameter(Mandatory = $true)]
    [string]$InputFasta,

    [Parameter(Mandatory = $true)]
    [string]$OutputCsv
)

# Initialize variables
$sequences = @()
$currentID = ""
$currentSeq = ""

# Read the FASTA file line by line
Get-Content $InputFasta | ForEach-Object {
    $line = $_.Trim()
    if ($line -match '^>(.+)') {
        # If there is a current sequence, add it to the list
        if ($currentID -ne "") {
            $sequences += [PSCustomObject]@{
                ID       = $currentID
                Sequence = $currentSeq
            }
        }
        # Start a new sequence
        $currentID = $Matches[1]
        $currentSeq = ""
    }
    elseif ($line -ne "") {
        # Append to the current sequence
        $currentSeq += $line
    }
}

# Add the last sequence after the loop
if ($currentID -ne "") {
    $sequences += [PSCustomObject]@{
        ID       = $currentID
        Sequence = $currentSeq
    }
}

# Export to CSV
$sequences | Export-Csv -Path $OutputCsv -NoTypeInformation -Encoding UTF8

Write-Host "Conversion complete! CSV file saved to '$OutputCsv'."
