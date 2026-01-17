$unattechedDisks = @()

Get-AzDisk | ForEach-Object {
    $disk = $_
    $state = $disk.DiskState
    $diskgroup = $disk.ResourceGroupName

    if ($state -eq 'Unattached' -and $diskgroup -eq 'mate-azure-task-5') {
        $unattechedDisks += $disk
        Write-Output "Found unattached disk: $($disk.Name)"
    }
    else {
        Write-Output "Skipping disk: $($disk.Name) (State: $state)"
    }
}

$unattechedDisks | ConvertTo-Json | Out-File ./result.json
