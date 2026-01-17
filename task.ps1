$unattechedDisks = @()

Get-AzDisk | ForEach-Object {
    $disk = $_
    $state = $disk.DiskState

    if ($state -eq 'Unattached') {
        $unattechedDisks += $disk
        Write-Output "Found unattached disk: $($disk.Name)"
    }
    else {
        Write-Output "Skipping disk: $($disk.Name) (State: $state)"
    }
}

$unattechedDisks | ConvertTo-Json | Out-File ./result.json
