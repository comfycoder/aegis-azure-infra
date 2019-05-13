#**********************************************************
# Get PowerSchell Script Execution Path
#**********************************************************

# Get the directory where the main script is executing
$SCRIPT_DIRECTORY = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
Write-Verbose "Script Directory: $SCRIPT_DIRECTORY" -Verbose

#**********************************************************
# Get Azure Devops RM Service Principal Variables
#**********************************************************

# Get the Account Subscription Id
$SUBSCRIPTION_ID = $(az account show --query id -o tsv)
Write-Verbose "SUBSCRIPTION_ID: $SUBSCRIPTION_ID" -Verbose

# Get the Tenant Id in which the Subscription exists
$TENANT_ID = $(az account show --query tenantId -o tsv)
Write-Verbose "TENANT_ID: $TENANT_ID" -Verbose

# Get the Subscription Name
$SUBSCRIPTION_NAME = $(az account show --query name -o tsv)
Write-Verbose "SUBSCRIPTION_NAME: $SUBSCRIPTION_NAME" -Verbose

# Get the name of the user who launched this script
$USER_NAME = $(az account show --query user.name -o tsv)
Write-Verbose "User Name: $USER_NAME" -Verbose

#**********************************************************
# Get Azure DevOps Release Pipeline Variables
#**********************************************************

. (Join-Path $SCRIPT_DIRECTORY "variables.test.ps1")

. (Join-Path $SCRIPT_DIRECTORY "variables.ps1")

. (Join-Path $SCRIPT_DIRECTORY "Utilities\azure-utilities.ps1")

#**********************************************************
# Deploy app permission, routes and services
#**********************************************************

. (Join-Path $SCRIPT_DIRECTORY "AppServicePlan\deployAppServicePlan.ps1")

. (Join-Path $SCRIPT_DIRECTORY "ApplicationInsights\deployAppInsights.ps1")

. (Join-Path $SCRIPT_DIRECTORY "KeyVault\deployKeyVault.ps1")

# . (Join-Path $SCRIPT_DIRECTORY "MSI\deployMSI.ps1")

. (Join-Path $SCRIPT_DIRECTORY "WebApp\deployWebApp.ps1")

. (Join-Path $SCRIPT_DIRECTORY "KeyVault\set-key-vault-secrets.ps1")