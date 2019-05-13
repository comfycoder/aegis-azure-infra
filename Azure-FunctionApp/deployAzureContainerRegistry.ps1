Write-Verbose "Deploying Azure Container Registry: $ACR_NAME" -Verbose

$ACR_TEMPLATE_FILE = (Join-Path $SCRIPT_DIRECTORY "AzureContainerRegistry\deployAzureContainerRegistry.json")
Write-Verbose "ACR_TEMPLATE_FILE: $ACR_TEMPLATE_FILE" -Verbose

$DEPLOYMENT_NAME = "deployAzureContainerRegistry-$(get-date -f yyyyMMddHHmmss)"

az group deployment create `
    -g "$ACR_RG_NAME" `
    -n "$DEPLOYMENT_NAME" `
    --template-file "$ACR_TEMPLATE_FILE" `
    --parameters "registryName=$ACR_NAME" `
                 "registryLocation=$ACR_LOCATION" `
                 "registrySku=$ACR_SKU"

Write-Verbose "Successfully Deployed Azure Container Registry: $ACR_NAME" -Verbose
