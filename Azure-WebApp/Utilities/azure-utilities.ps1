function Get-Key-Vault-Secret
{
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)][string]$kvName, 
        [Parameter(Mandatory=$true)][string]$secretName,
        [Parameter(Mandatory=$false)][string]$queryParam
    )

    $result = $null

    try {
        If ($queryParam) {
            Write-Verbose "Getting value for secret called '$secretName' from a key vault called '$kvName'" -Verbose
            $result = az keyvault secret show --name "$secretName" --vault-name "$kvName" --query "$queryParam" -o tsv 2> $null
        }
        else {
            Write-Verbose "Getting secret called '$secretName' from a key vault called '$kvName'" -Verbose
            $result = az keyvault secret show --name "$secretName" --vault-name "$kvName" 2> $null
        }
    }
    catch {
    }
    finally {
        $global:lastExitCode = $null
    }

    return $result
}

function Set-Key-Vault-Secret
{
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)][string]$kvName, 
        [Parameter(Mandatory=$true)][string]$secretName, 
        [Parameter(Mandatory=$true)][string]$secretValue
    )

    $setSecret = $true

    try {
        # Get a secret from the key vault
        $value = Get-Key-Vault-Secret `
            -kvName "$kvName" `
            -secretName "$secretName" `
            -queryParam "value"

        if ($null -ne $value) 
        {
            if ($value -eq $secretValue) 
            {
                $setSecret = $false
                Write-Verbose "A secret called '$secretName' in a key vault called '$kvName' already has the desired value." -Verbose
            }
        }
        else 
        {
            Write-Verbose "Unable to find secret called '$secretName' in a key vault called '$kvName'" -Verbose
        }

        if ($true -eq $setSecret)
        {
            Write-Verbose "Setting value for secret called '$secretName' in a key vault called '$kvName'" -Verbose

            az keyvault secret set `
                --name "$secretName" `
                --vault-name "$kvName" `
                --value "$secretValue"            
        }
    }
    catch {
    }
    finally {
        $global:lastExitCode = $null
    }

    return $hasSecret
}

function Get-Service-Principal
{
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)][string]$appIdUri, 
        [Parameter(Mandatory=$false)][string]$queryParam
    )

    $result = $null

    try {
        If ($queryParam) {
            Write-Verbose "Getting AD Service Principal value for '$queryParam'" -Verbose
            $result = az ad sp show --id "$appIdUri" --query "$queryParam" -o tsv 2> $null
        }
        else {
            Write-Verbose "Getting AD Service Principal json data" -Verbose
            $result = az ad sp show --id "$appIdUri" 2> $null
        }
    }
    catch {
    }
    finally {
        $global:lastExitCode = $null
    }

    return $result
}

function Get-MSI
{
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)][string]$msiName, 
        [Parameter(Mandatory=$true)][string]$rgName, 
        [Parameter(Mandatory=$false)][string]$queryParam
    )

    $result = $null

    try {
        If ($queryParam) {
            Write-Verbose "Getting MSI value for '$queryParam'" -Verbose
            $result = az identity show --name "$msiName" --resource-group "$rgName" --query "$queryParam" -o tsv 2> $null
        }
        else {
            Write-Verbose "Getting MSI json data" -Verbose
            $result = az identity show --name "$msiName" --resource-group "$rgName" 2> $null
        }
    }
    catch {
    }
    finally {
        $global:lastExitCode = $null
    }

    return $result
}

function Get-AD-Group
{
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)][string]$groupName, 
        [Parameter(Mandatory=$false)][string]$queryParam
    )

    $result = $null

    try {
        If ($queryParam) {
            Write-Verbose "Getting AD Group value for '$queryParam'" -Verbose
            $result = az ad group show -g "$groupName" --query "$queryParam" -o tsv 2> $null
        }
        else {
            Write-Verbose "Getting AD Group json data" -Verbose
            $result = az ad group show -g "$groupName" # 2> $null
        }
    }
    catch {
    }
    finally {
        $global:lastExitCode = $null
    }

    return $result
}