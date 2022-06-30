function portcheck {
    [cmdletbinding()]
    param (
        [Parameter( Mandatory=$true,
        ValueFromPipeline=$true)]
        [string]$node1,
    [Parameter( Mandatory=$true,
        ValueFromPipeline=$true)]
        [string]$node2,
    [Parameter( Mandatory=$true,
        ValueFromPipeline=$true)]
        [string]$node3

    )
Process
{
   
    Invoke-Command -ComputerName $node1 -ScriptBlock{
        If (Test-NetConnection $Using:node2 -Port 3343 -InformationLevel Quiet) {
        Write-Host "TCP Port 3343 is  enabled from $env:COMPUTERNAME to $Using:node2 " -ForegroundColor Green
        }
        else {
        Write-Host "TCP Port 3343 is not enabled from $env:COMPUTERNAME to $Using:node2" -ForegroundColor Yellow
        }
        If (Test-NetConnection $Using:node2  -Port 135 -InformationLevel Quiet) {
            Write-Host "TCP Port 135 is  enabled from $env:COMPUTERNAME to $Using:node2 " -ForegroundColor Green
            }
            else {
            Write-Host "TCP Port 135 is not enabled from $env:COMPUTERNAME to $Using:node2" -ForegroundColor Yellow
            }
        If (Test-NetConnection $Using:node2  -Port 139 -InformationLevel Quiet) {
                Write-Host "TCP Port 139 is  enabled from $env:COMPUTERNAME to $Using:node2 " -ForegroundColor Green
                }
                else {
                Write-Host "TCP Port 139 is not enabled from $env:COMPUTERNAME to $Using:node2" -ForegroundColor Yellow
                }
        If (Test-NetConnection $Using:node2  -Port 445 -InformationLevel Quiet) {
                    Write-Host "TCP Port 445 is  enabled from $env:COMPUTERNAME to $Using:node2 " -ForegroundColor Green
                    }
                    else {
                    Write-Host "TCP Port 445 is not enabled from $env:COMPUTERNAME to $Using:node2" -ForegroundColor Yellow
                    }
        $connection = New-Object System.Net.Sockets.TcpClient($Using:node2 , 3343)
        if ($connection.Connected) {
             Write-Host "UDP port 3343 is enabled from $env:COMPUTERNAME to $Using:node2" -ForegroundColor Green 
        }
             else { 
             Write-Host "UDP port 3343 is not enabled from $env:COMPUTERNAME to $Using:node2" -ForegroundColor Yellow
        }
         $connection = New-Object System.Net.Sockets.TcpClient($Using:node2 , 137)
        if ($connection.Connected) {
             Write-Host "UDP port 137 is enabled from $env:COMPUTERNAME to $Using:node2" -ForegroundColor Green
        }
             else { 
             Write-Host "UDP port 137 is not enabled from $env:COMPUTERNAME to $Using:node2" -ForegroundColor Yellow 
        }
        $connection = New-Object System.Net.Sockets.TcpClient($Using:node2 , 138)
            if ($connection.Connected) {
                 Write-Host "UDP port 138 is enabled from $env:COMPUTERNAME to $Using:node2" -ForegroundColor Green
            }
                 else { 
                 Write-Host "UDP port 138 is not enabled from $env:COMPUTERNAME to $Using:node2" -ForegroundColor Yellow 
            }
        $connection = New-Object System.Net.Sockets.TcpClient($Using:node2 , 139)
        if ($connection.Connected) {
             Write-Host "UDP port 139 is enabled from $env:COMPUTERNAME to $Using:node2" -ForegroundColor Green
        }
             else { 
             Write-Host "UDP port 139 is not enabled from $env:COMPUTERNAME to $Using:node2" -ForegroundColor Yellow 
        }
        } -ErrorAction SilentlyContinue

        
        Invoke-Command -ComputerName $node2 -ScriptBlock{
            If (Test-NetConnection $Using:node1 -Port 3343 -InformationLevel Quiet) {
            Write-Host "TCP Port 3343 is  enabled from $env:COMPUTERNAME to $Using:node1 " -ForegroundColor Green
            }
            else {
            Write-Host "TCP Port 3343 is not enabled from $env:COMPUTERNAME to $Using:node1" -ForegroundColor Yellow
            }
            If (Test-NetConnection $Using:node1 -Port 135 -InformationLevel Quiet) {
                Write-Host "TCP Port 135 is  enabled from $env:COMPUTERNAME to $Using:node1 " -ForegroundColor Green
                }
                else {
                Write-Host "TCP Port 135 is not enabled from $env:COMPUTERNAME to $Using:node1" -ForegroundColor Yellow
                }
            If (Test-NetConnection $Using:node1  -Port 130 -InformationLevel Quiet) {
                    Write-Host "TCP Port 139 is  enabled from $env:COMPUTERNAME to $Using:node1 " -ForegroundColor Green
                    }
                    else {
                    Write-Host "TCP Port 139 is not enabled from $env:COMPUTERNAME to $Using:node1" -ForegroundColor Yellow
                    }
                If (Test-NetConnection $Using:node1  -Port 445 -InformationLevel Quiet) {
                        Write-Host "TCP Port 445 is  enabled from $env:COMPUTERNAME to $Using:node1 " -ForegroundColor Green
                        }
                        else {
                        Write-Host "TCP Port 445 is not enabled from $env:COMPUTERNAME to $Using:node1" -ForegroundColor Yellow
                        }
            $connection = New-Object System.Net.Sockets.TcpClient($Using:node1 , 3343)
            if ($connection.Connected) {
                 Write-Host "UDP port 3343 is enabled from $env:COMPUTERNAME to $Using:node1" -ForegroundColor Green 
            }
                 else { 
                 Write-Host "UDP port 3343 is not enabled from $env:COMPUTERNAME to $Using:node1" -ForegroundColor Yellow
            }
             $connection = New-Object System.Net.Sockets.TcpClient($Using:node1 , 137)
            if ($connection.Connected) {
                 Write-Host "UDP port 137 is enabled from $env:COMPUTERNAME to $Using:node1" -ForegroundColor Green
            }
                 else { 
                 Write-Host "UDP port 137 is not enabled from $env:COMPUTERNAME to $Using:node1" -ForegroundColor Yellow 
            }
            $connection = New-Object System.Net.Sockets.TcpClient($Using:node1 , 138)
            if ($connection.Connected) {
                 Write-Host "UDP port 138 is enabled from $env:COMPUTERNAME to $Using:node1" -ForegroundColor Green
            }
                 else { 
                 Write-Host "UDP port 138 is not enabled from $env:COMPUTERNAME to $Using:node1" -ForegroundColor Yellow 
            }
            $connection = New-Object System.Net.Sockets.TcpClient($Using:node1 , 139)
            if ($connection.Connected) {
                 Write-Host "UDP port 139 is enabled from $env:COMPUTERNAME to $Using:node1" -ForegroundColor Green
            }
                 else { 
                 Write-Host "UDP port 139 is not enabled from $env:COMPUTERNAME to $Using:node1" -ForegroundColor Yellow 
            }
            } -ErrorAction SilentlyContinue  
            
            
            
            Invoke-Command -ComputerName $node1 -ScriptBlock{
                If (Test-NetConnection $Using:node3 -Port 3343 -InformationLevel Quiet) {
                Write-Host "TCP Port 3343 is  enabled from $env:COMPUTERNAME to $Using:node3 " -ForegroundColor Green
                }
                else {
                Write-Host "TCP Port 3343 is not enabled from $env:COMPUTERNAME to $Using:node3" -ForegroundColor Yellow
                }
                If (Test-NetConnection $Using:node3  -Port 135 -InformationLevel Quiet) {
                    Write-Host "TCP Port 135 is  enabled from $env:COMPUTERNAME to $Using:node3 " -ForegroundColor Green
                    }
                    else {
                    Write-Host "TCP Port 135 is not enabled from $env:COMPUTERNAME to $Using:node3" -ForegroundColor Yellow
                    }
                If (Test-NetConnection $Using:node3  -Port 139 -InformationLevel Quiet) {
                        Write-Host "TCP Port 139 is  enabled from $env:COMPUTERNAME to $Using:node3 " -ForegroundColor Green
                        }
                        else {
                        Write-Host "TCP Port 139 is not enabled from $env:COMPUTERNAME to $Using:node3" -ForegroundColor Yellow
                        }
                If (Test-NetConnection $Using:node3  -Port 445 -InformationLevel Quiet) {
                            Write-Host "TCP Port 445 is  enabled from $env:COMPUTERNAME to $Using:node3 " -ForegroundColor Green
                            }
                            else {
                            Write-Host "TCP Port 445 is not enabled from $env:COMPUTERNAME to $Using:node3" -ForegroundColor Yellow
                            }
                $connection = New-Object System.Net.Sockets.TcpClient($Using:node3 , 3343)
                if ($connection.Connected) {
                     Write-Host "UDP port 3343 is enabled from $env:COMPUTERNAME to $Using:node3" -ForegroundColor Green 
                }
                     else { 
                     Write-Host "UDP port 3343 is not enabled from $env:COMPUTERNAME to $Using:node3" -ForegroundColor Yellow
                }
                 $connection = New-Object System.Net.Sockets.TcpClient($Using:node3 , 137)
                if ($connection.Connected) {
                     Write-Host "UDP port 137 is enabled from $env:COMPUTERNAME to $Using:node3" -ForegroundColor Green
                }
                     else { 
                     Write-Host "UDP port 137 is not enabled from $env:COMPUTERNAME to $Using:node3" -ForegroundColor Yellow 
                }
                $connection = New-Object System.Net.Sockets.TcpClient($Using:node3 , 138)
                    if ($connection.Connected) {
                         Write-Host "UDP port 138 is enabled from $env:COMPUTERNAME to $Using:node3" -ForegroundColor Green
                    }
                         else { 
                         Write-Host "UDP port 138 is not enabled from $env:COMPUTERNAME to $Using:node3" -ForegroundColor Yellow 
                    }
                $connection = New-Object System.Net.Sockets.TcpClient($Using:node3 , 139)
                if ($connection.Connected) {
                     Write-Host "UDP port 139 is enabled from $env:COMPUTERNAME to $Using:node3" -ForegroundColor Green
                }
                     else { 
                     Write-Host "UDP port 139 is not enabled from $env:COMPUTERNAME to $Using:node3" -ForegroundColor Yellow 
                }
                } -ErrorAction SilentlyContinue
} 

}

function Enablefailoverclustering {
    [cmdletbinding()]
    param (
        [Parameter( Mandatory=$true,
        ValueFromPipeline=$true)]
        [string]$node1,
    [Parameter( Mandatory=$true,
        ValueFromPipeline=$true)]
        [string]$node2,
    [Parameter( Mandatory=$true,
        ValueFromPipeline=$true)]
        [string]$node3
  
    )
   process
    {
        $servers = "$node2","$node3","$node1"
        foreach ($server in $servers) {
        Invoke-Command -computername $Server -scriptblock {
        Install-WindowsFeature –Name Failover-Clustering –IncludeManagementTools
        Write-Host -ForegroundColor Green '$env:COMPUTERNAME Required start to complete Failover cluster enabled . Restart computer now?'
        Restart-Computer -Force -Confirm
        }
}
    }
}
function clusterconfiguration {
    [cmdletbinding()]
    param (
        [Parameter( Mandatory=$true,
        ValueFromPipeline=$true)]
        [string]$node1,
    [Parameter( Mandatory=$true,
        ValueFromPipeline=$true)]
        [string]$node2,
    [Parameter( Mandatory=$true,
        ValueFromPipeline=$true)]
        [string]$node3,
    [Parameter( Mandatory=$true,
        ValueFromPipeline=$true)]
        [string]$clustername,
    [Parameter( Mandatory=$true,
        ValueFromPipeline=$true)]
        $clusterprimaryip,
    [Parameter( Mandatory=$true,
        ValueFromPipeline=$true)]
        $clustersecondaryip
   
    )

process 
{ 

    $confirmations = Read-Host "Do you want to Initiate cluster validation [y/n] :"
if ($confirmations -eq 'y') {
    Test-Cluster -Node $node1, $node2, $node3
    Write-host "Cluster validation has been completed " -ForegroundColor Green
}
else {
Write-host "Skipping cluster validation.... " -ForegroundColor Green
}
Start-Sleep -s 30 
$confirmation = Read-Host "Do you have cluster static IP address [y/n] :"
if ($confirmation -eq 'y') {
  New-Cluster –Name $clustername –Node $node1, $node2, $node3 -StaticAddress $clusterprimaryip, $clustersecondaryip -NoStorage
}
else {
New-Cluster –Name $clustername –Node $node1, $node2, $node3 -NoStorage
}
Start-Sleep -s 120
if (Get-Cluster -name $clustername) {
        write-host "$clustername Cluster has been created" -ForegroundColor Green
        }
        else {
        Write-Host "$clustername is not created" -ForegroundColor Yellow
        }

}

}
    
function quoramconfiguration {
    [cmdletbinding()]
    param (
     [Parameter( Mandatory=$true,
        ValueFromPipeline=$true)]
        [string]$Quorampath,
     [Parameter( Mandatory=$true,
        ValueFromPipeline=$true)]
        [string]$clustername   
    )

process 
{
    if(Test-Path $Quorampath) {
        Write-Host "-------------------------------" -ForegroundColor Green
        Write-Host "Quoram witness path is existing" -ForegroundColor Green
        Write-Host "-------------------------------" -ForegroundColor Green
    } else {
      
         Write-Host "Quoram witness path is not existing" -ForegroundColor Red  
         exit
        }
   
   (Get-ACL -Path "$Quorampath").Access | Format-Table IdentityReference,FileSystemRights
   if((Get-ACL -Path "$Quorampath").Access | Where-Object {$_.IdentityReference -like "*$clustername*"}) {
    Write-Host "$clustername cluster is having access on the witness share path " -ForegroundColor Green
    Write-Host "-----------------------------------" -ForegroundColor Green
    Write-Host "-----------------------------------" -ForegroundColor Green
    Write-Host "Adding Quoram witness into cluster" -ForegroundColor Green
    Set-ClusterQuorum -FileShareWitness $Quorampath
 } else 
    {
    Write-Host "$clustername cluster is not having access on the witness share path " -ForegroundColor Red   
}
    
}

}
