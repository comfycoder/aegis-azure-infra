Write-Verbose "Deploying Azure App Service Plan: $PLAN_NAME" -Verbose

$ASP_TEMPLATE_FILE = (Join-Path $SCRIPT_DIRECTORY "AppServicePlan\deployAppServicePlan.json")
Write-Verbose "ASP_TEMPLATE_FILE: $ASP_TEMPLATE_FILE" -Verbose

$DEPLOYMENT_NAME = "deployAppServicePlan-$(get-date -f yyyyMMddHHmmss)"

# az group deployment validate `
#     -g "$PLAN_RG_NAME" `
#     --template-file "$ASP_TEMPLATE_FILE" `
#     --parameters "planName=$PLAN_NAME" `
#                 "planEnvironment=$PLAN_ENVIRONMENT" `
#                 "planSku=$PLAN_SKU" `
#                 "planSkuCode=$PLAN_SKU_CODE" `
#                 "workerSize=$WORKER_SIZE" `
#                 "workerSizeId=$WORKER_SIZE_ID" `
#                 "numberOfWorkers=$WORKER_SIZE" `
#                 "location=$PLAN_LOCATION" `
#                 "createdDate=$CREATED_DATE" `
#                 "TemplateVersion=$TEMPLATE_VERSION" 

az group deployment create `
    -g "$PLAN_RG_NAME" `
    -n "$DEPLOYMENT_NAME" `
    --template-file "$ASP_TEMPLATE_FILE" `
    --parameters "planName=$PLAN_NAME" `
                "planEnvironment=$PLAN_ENVIRONMENT" `
                "planSku=$PLAN_SKU" `
                "planSkuCode=$PLAN_SKU_CODE" `
                "workerSize=$WORKER_SIZE" `
                "workerSizeId=$WORKER_SIZE_ID" `
                "numberOfWorkers=$WORKER_SIZE" `
                "location=$PLAN_LOCATION" `
                "createdDate=$CREATED_DATE" `
                "TemplateVersion=$TEMPLATE_VERSION" 

Write-Verbose "Successfully Deployed App Service Plan: $PLAN_NAME" -Verbose

