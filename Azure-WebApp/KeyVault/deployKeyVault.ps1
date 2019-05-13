Write-Verbose "Deploying Azure Key Vault: $AIS_NAME" -Verbose

$KV_TEMPLATE_FILE = (Join-Path $SCRIPT_DIRECTORY "KeyVault\deployKeyVault.json")
Write-Verbose "KV_TEMPLATE_FILE: $KV_TEMPLATE_FILE" -Verbose

$DEPLOYMENT_NAME = "deployKeyVault-$(get-date -f yyyyMMddHHmmss)"

# az group deployment validate `
#     -g "$KV_RG_NAME" `
#     --template-file "$KV_TEMPLATE_FILE" `
#     --parameters "kvName=$KV_NAME" `
#                 "location=$KV_LOCATION" `
#                 "tenantId=$TENANT_ID" `
#                 "createdDate=$CREATED_DATE" `
#                 "TemplateVersion=$TEMPLATE_VERSION" 

az group deployment create `
    -g "$KV_RG_NAME" `
    -n "$DEPLOYMENT_NAME" `
    --template-file "$KV_TEMPLATE_FILE" `
    --parameters "kvName=$KV_NAME" `
                "location=$KV_LOCATION" `
                "tenantId=$TENANT_ID" `
                "createdDate=$CREATED_DATE" `
                "TemplateVersion=$TEMPLATE_VERSION" 

Write-Verbose "Successfully Deployed Key Vault: $KV_NAME" -Verbose

