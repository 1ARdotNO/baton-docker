$config = (get-content config.json) | ConvertFrom-Json

$config.connectors | ForEach-Object {
    
    if($_.enabled -eq "true"){ #check if connector is enabled
        "Starting $($_.connectorname)..."
        $tinput=$_
        $arguments=$_| Select-Object -ExcludeProperty connectorname,enabled | get-member | Where-Object {$_.membertype -eq "noteproperty"}
        #$arguments
        $argumentlist=$arguments.name | ForEach-Object {
            "--$_ $($tinput.$($_))"
        }
        #$argumentlist
        Start-Process -FilePath "baton-$($_.connectorname)" -ArgumentList $argumentlist -Wait
        #baton-$($_.name)
    }
}