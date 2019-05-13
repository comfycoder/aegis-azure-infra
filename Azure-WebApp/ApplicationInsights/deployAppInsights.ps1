Write-Verbose "Deploying Azure App Insights: $AIS_NAME" -Verbose

$AIS_TEMPLATE_FILE = (Join-Path $SCRIPT_DIRECTORY "ApplicationInsights\deployAppInsights.json")
Write-Verbose "AIS_TEMPLATE_FILE: $AIS_TEMPLATE_FILE" -Verbose

$DEPLOYMENT_NAME = "deployAppInsights-$(get-date -f yyyyMMddHHmmss)"

# az group deployment validate `
#     -g "$AIS_RG_NAME" `
#     --template-file "$AIS_TEMPLATE_FILE" `
#     --parameters "appInsightsName=$AIS_NAME" `
#                 "appName=$APP_NAME" `
#                 "location=$AIS_LOCATION" `
#                 "createdDate=$CREATED_DATE" `
#                 "TemplateVersion=$TEMPLATE_VERSION" 

az group deployment create `
    -g "$AIS_RG_NAME" `
    -n "$DEPLOYMENT_NAME" `
    --template-file "$AIS_TEMPLATE_FILE" `
    --parameters "appInsightsName=$AIS_NAME" `
                "appName=$APP_NAME" `
                "location=$AIS_LOCATION" `
                "createdDate=$CREATED_DATE" `
                "TemplateVersion=$TEMPLATE_VERSION" 

Write-Verbose "Successfully Deployed App Insights: $AIS_NAME" -Verbose

