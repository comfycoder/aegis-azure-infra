Write-Verbose "Deploying Azure Function App: $APP_NAME" -Verbose

$FA_TEMPLATE_FILE = (Join-Path $SCRIPT_DIRECTORY "FunctionApp\deployFunctionApp.json")
Write-Verbose "FA_TEMPLATE_FILE: $FA_TEMPLATE_FILE" -Verbose

$DEPLOYMENT_NAME = "deployFunctionApp-$(get-date -f yyyyMMddHHmmss)"

# az group deployment VALIDATE `
#     -g "$APP_RG_NAME" `
#     --template-file "$FA_TEMPLATE_FILE" `
#     --parameters "appName=$APP_NAME" `
#                  "location=$APP_LOCATION" `
#                  "aisName=$AIS_NAME" `
#                  "storageName=$STORAGE_NAME" `
#                  "serverFarmResourceGroup=$PLAN_RG_NAME" `
#                  "hostingPlanName=$PLAN_NAME" `
#                  "hostingEnvironment=$PLAN_ENVIRONMENT" `
#                  "planSku=$PLAN_SKU" `
#                  "planSkuCode=$PLAN_SKU_CODE" `
#                  "workerSize=$WORKER_SIZE" `
#                  "subscriptionId=$SUBSCRIPTION_ID" 

az group deployment create `
    -g "$APP_RG_NAME" `
    -n "$DEPLOYMENT_NAME" `
    --template-file "$FA_TEMPLATE_FILE" `
    --parameters "appName=$APP_NAME" `
                 "location=$APP_LOCATION" `
                 "aisName=$AIS_NAME" `
                 "storageName=$STORAGE_NAME" `
                 "serverFarmResourceGroup=$PLAN_RG_NAME" `
                 "hostingPlanName=$PLAN_NAME" `
                 "hostingEnvironment=$PLAN_ENVIRONMENT" `
                 "planSku=$PLAN_SKU" `
                 "planSkuCode=$PLAN_SKU_CODE" `
                 "workerSize=$WORKER_SIZE" `
                 "subscriptionId=$SUBSCRIPTION_ID" 

Write-Verbose "Successfully Deployed Azure Function App: $APP_NAME" -Verbose
