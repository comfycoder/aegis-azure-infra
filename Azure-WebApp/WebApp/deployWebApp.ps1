Write-Verbose "Deploying Azure Web App: $APP_NAME" -Verbose

$WA_TEMPLATE_FILE = (Join-Path $SCRIPT_DIRECTORY "WebApp\deployWebApp.json")
Write-Verbose "WA_TEMPLATE_FILE: $WA_TEMPLATE_FILE" -Verbose

$DEPLOYMENT_NAME = "deployFunctionApp-$(get-date -f yyyyMMddHHmmss)"

# az group deployment validate `
#     -g "$APP_RG_NAME" `
#     --template-file "$WA_TEMPLATE_FILE" `
#     --parameters "appName=$APP_NAME" `
#                  "location=$APP_LOCATION" `
#                  "appInsightsName=$AIS_NAME" `
#                  "planName=$PLAN_NAME" `
#                  "planRGName=$PLAN_RG_NAME" `
#                  "planEnvironment=$PLAN_ENVIRONMENT" `
#                  "alwaysOn=$APP_ALWAYS_ON" `
#                  "currentStack=$APP_CURRENT_STACK" `
#                  "createdDate=$CREATED_DATE" `
#                  "TemplateVersion=$TEMPLATE_VERSION" 

az group deployment create `
    -g "$APP_RG_NAME" `
    -n "$DEPLOYMENT_NAME" `
    --template-file "$WA_TEMPLATE_FILE" `
    --parameters "appName=$APP_NAME" `
                 "location=$APP_LOCATION" `
                 "appInsightsName=$AIS_NAME" `
                 "planName=$PLAN_NAME" `
                 "planRGName=$PLAN_RG_NAME" `
                 "planEnvironment=$PLAN_ENVIRONMENT" `
                 "alwaysOn=$APP_ALWAYS_ON" `
                 "currentStack=$APP_CURRENT_STACK" `
                 "createdDate=$CREATED_DATE" `
                 "TemplateVersion=$TEMPLATE_VERSION" 

Write-Verbose "Successfully Deployed Web App: $APP_NAME" -Verbose