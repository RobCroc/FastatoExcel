``
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
    "$InputFasta = 'C:\Data\input.fasta';" ^
    "$OutputCsv = 'C:\Data\output.csv';" ^
    "$sequences = @();" ^
    "$currentID = ''; $currentSeq = '';" ^
    "Get-Content $InputFasta | ForEach-Object { " ^
        "if ($_ -match '^>(.+)') { " ^
            "if ($currentID -ne '') { $sequences += [PSCustomObject]@{ID=$currentID; Sequence=$currentSeq} };" ^
            "$currentID = $Matches[1]; $currentSeq = ''; " ^
        "} elseif ($_ -ne '') { " ^
            "$currentSeq += $_ " ^
        "}" ^
    "}; " ^
    "if ($currentID -ne '') { $sequences += [PSCustomObject]@{ID=$currentID; Sequence=$currentSeq} }; " ^
    "$sequences | Export-Csv -Path $OutputCsv -NoTypeInformation -Encoding UTF8; " ^
    "Write-Host 'Conversion complete! CSV file saved to' $OutputCsv;"
``
Note: Replace 'C:\Data\input.fasta' and 'C:\Data\output.csv' with the actual paths to your input FASTA file and desired output CSV file.
