
Clear-Host

Write-Host {
    # 0-OK
    # 1-Warning 
    # 2-Error 
    # 3-Unknown
    }
Try { # Get Cluster Nodes Status
    [Object[]]$clusterNodes = gwmi -class MSCluster_Node -namespace "root\mscluster" -ErrorAction Stop
    $clusterNodes | %{
        $ItemName = 'Cl_Node_'+$_.Name
        if ($_.State -eq '-1'){$Status = 3; $CheckOutput = 'UNKNOWN - '+$_.Name+' node is in Unknown State' }
        elseif ($_.State -eq '0') {$Status = 0; $CheckOutput = 'OK - '+$_.Name+' node is Up' }
        elseif ($_.State -eq '1') {$Status = 2; $CheckOutput = 'ERROR - '+$_.Name+' node is Down' }
        elseif ($_.State -eq '2') {$Status = 1; $CheckOutput = 'WARNING - '+$_.Name+' node is Paused' }
        else {$Status = 3; $CheckOutput = 'UNKNOWN - '+$_.Name+' node is in Unknown State'}
        write-output "$status $ItemName $PerfData $CheckOutput" |Out-String
    } #foreach clusternode
} # Try ClusterNodes
Catch {write-output "1 Cluster - WARNING - CIM class for Failover Cluster Nodes missing" |Out-String}



Try { # Get Cluster Group Status
    [Object[]]$clusterGroups = gwmi -class MSCluster_ResourceGroup -namespace "root\mscluster" -ErrorAction Stop
    $clusterGroups | ?{$_.Name -ne 'Available Storage'} | %{
        $ItemName = ('Cl_Group_'+$_.Name).Replace(" ","_")
        if ($_.State -eq '-1'){$Status = 3; $CheckOutput = 'UNKNOWN - '+$_.Name+' group is in Unknown State' }
        elseif ($_.State -eq '0') {$Status = 0; $CheckOutput = 'OK - '+$_.Name+' group is Online' }
        elseif ($_.State -eq '1') {$Status = 1; $CheckOutput = 'WARNING - '+$_.Name+' group is Offline' }
        elseif ($_.State -eq '2') {$Status = 2; $CheckOutput = 'ERROR- '+$_.Name+' group is Failed' }
        elseif ($_.State -eq '3') {$Status = 1; $CheckOutput = 'WARNING - '+$_.Name+' group is Partial Online' }
        elseif ($_.State -eq '4') {$Status = 1; $CheckOutput = 'WARNING - '+$_.Name+' group is Pending' }
        else {$Status = 3; $CheckOutput = 'UNKNOWN - '+$_.Name+' group is in Unknown State'}
        write-output "$status $ItemName $PerfData $CheckOutput" |Out-String
    } #foreach clusternode
} # Try ClusterGroups
Catch {write-output "1 Cluster - WARNING - CIM class for Failover Cluster Groups missing" |Out-String}


Try { # Get Cluster Resources Status
    [Object[]]$clusterResource = gwmi -Namespace "root\mscluster" -Class MSCluster_Resource -ErrorAction Stop
    $clusterResource | %{
        $ItemName = ('Cl_Res_'+$_.Name).Replace(" ","_")
        if ($_.State -eq '-1')    {$Status = 3; $CheckOutput = 'UNKNOWN - '+$_.Name+' resource is in Unknown State' }
        elseif ($_.State -eq '0') {$Status = 3; $CheckOutput = 'UNKNOWN - '+$_.Name+' resource is in Unknown State' }
        elseif ($_.State -eq '1') {$Status = 1; $CheckOutput = 'WARNING - '+$_.Name+' resource is Initializing' }
        elseif ($_.State -eq '2') {$Status = 0; $CheckOutput = 'OK - '+$_.Name+' resource is Online' }
        elseif ($_.State -eq '3') {$Status = 1; $CheckOutput = 'WARNING - '+$_.Name+' resource is Offline' }
        elseif ($_.State -eq '4') {$Status = 2; $CheckOutput = 'ERROR - '+$_.Name+' resource is Failed' }
        elseif ($_.State -eq '128') {$Status = 1; $CheckOutput = 'WARNING - '+$_.Name+' resource is Pending' }
        elseif ($_.State -eq '129') {$Status = 1; $CheckOutput = 'WARNING - '+$_.Name+' resource is Online Pending' }
        elseif ($_.State -eq '130') {$Status = 1; $CheckOutput = 'WARNING - '+$_.Name+' resource is Offline Pending' }
        else {$Status = 3; $CheckOutput = 'UNKNOWN - '+$_.Name+' resource is in Unknown State'}
        write-output "$status $ItemName $PerfData $CheckOutput" |Out-String
    } #foreach clusternode
} # Try ClusterResources
Catch {write-output "1 Cluster - WARNING - CIM class for Failover Cluster Resources missing" |Out-String}


Try { # Get Cluster Group Prefered OwnerStatus
    [Object[]]$clusterGroups = Get-CimInstance -Namespace root/MSCluster -ClassName MSCluster_ResourceGroup  -ErrorAction Stop
    $clusterGroups | %{
        $ItemName = ('Cl_Preference_'+$_.Name).Replace(" ","_")
        $PreferedOwners = (Invoke-CimMethod -InputObject $_ -MethodName GetPreferredOwners).NodeNames
        if ($PreferedOwners.Count -gt 0) {
            if ($PreferedOwners -contains $_.OwnerNode) {$status = 0; $CheckOutput = 'OK - '+$_.Name+' group is runnign on node '+$_.OwnerNode+'. Prefered Owner is: '+$PreferedOwners}
            else {$status = 1; $CheckOutput = 'WARNING- '+$_.Name+' group is runnign on node '+$_.OwnerNode+'. Prefered Owner is: '+$PreferedOwners}
            write-output "$status $ItemName $PerfData $CheckOutput" |Out-String
        }
        else {write-output ('0 '+$ItemName+' - OK - '+$_.Name+' group is runnign on node '+$_.OwnerNode+' and prefered Owner is not set') |Out-String}
    } #foreach clusternode
} # Try ClusterGroups
Catch {write-output "1 Cluster - WARNING - CIM method for Failover Cluster Preffered Node missing" |Out-String}