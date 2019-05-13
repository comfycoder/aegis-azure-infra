Write-Verbose "Deploying MSI: $MSI_NAME" -Verbose

$MSI_TEMPLATE_FILE = (Join-Path $SCRIPT_DIRECTORY "MSI\deployMSI.json")
Write-Verbose "MSI_TEMPLATE_FILE: $MSI_TEMPLATE_FILE" -Verbose

$DEPLOYMENT_NAME = "deployAppInsights-$(get-date -f yyyyMMddHHmmss)"

# az group deployment validate `
#     -g "$MSI_RG_NAME" `
#     --template-file "$MSI_TEMPLATE_FILE" `
#     --parameters "msiName=$MSI_NAME" `
#                 "location=$MSI_LOCATION" `
#                 "createdDate=$CREATED_DATE" `
#                 "TemplateVersion=$TEMPLATE_VERSION" 

az group deployment create `
    -g "$MSI_RG_NAME" `
    -n "$DEPLOYMENT_NAME" `
    --template-file "$MSI_TEMPLATE_FILE" `
    --parameters "msiName=$MSI_NAME" `
                "location=$MSI_LOCATION" `
                "createdDate=$CREATED_DATE" `
                "TemplateVersion=$TEMPLATE_VERSION" 

Write-Verbose "Successfully Deployed MSI: $AIS_MSI_NAMENAME" -Verbose
