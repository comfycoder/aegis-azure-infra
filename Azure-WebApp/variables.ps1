#**********************************************************
# Retrieve values from environment variables (Azure DevOps)
#**********************************************************

$CREATED_DATE = Get-Date -Format "yyyy-MM-dd"
Write-Verbose "CREATED_DATE: $CREATED_DATE" -Verbose

$TEMPLATE_VERSION = $(If ($env:TEMPLATE_VERSION) { "$env:TEMPLATE_VERSION" } Else { Write-Error -Message "ERROR: Missing value for 'TEMPLATE_VERSION'" -ErrorAction Stop }) 
Write-Verbose "TEMPLATE_VERSION: $TEMPLATE_VERSION" -Verbose

#**********************************************************
# Managed Service Identity (MSI) variables
#**********************************************************

$APP_NAME = $(If ($env:APP_NAME) { "$env:APP_NAME" } Else { Write-Error -Message "ERROR: Missing value for 'APP_NAME'" -ErrorAction Stop }) 
Write-Verbose "APP_NAME: $APP_NAME" -Verbose

$APP_RG_NAME = $(If ($env:APP_RG_NAME) { "$env:APP_RG_NAME" } Else { Write-Error -Message "ERROR: Missing value for 'APP_RG_NAME'" -ErrorAction Stop }) 
Write-Verbose "APP_RG_NAME: $APP_RG_NAME" -Verbose

#**********************************************************
# Web App PaaS variables
#**********************************************************

$APP_NAME = $(If ($env:APP_NAME) { "$env:APP_NAME" } Else { Write-Error -Message "ERROR: Missing value for 'APP_NAME'" -ErrorAction Stop }) 
Write-Verbose "APP_NAME: $APP_NAME" -Verbose

$APP_RG_NAME = $(If ($env:APP_RG_NAME) { "$env:APP_RG_NAME" } Else { Write-Error -Message "ERROR: Missing value for 'APP_RG_NAME'" -ErrorAction Stop }) 
Write-Verbose "APP_RG_NAME: $APP_RG_NAME" -Verbose

$APP_LOCATION = $(If ($env:APP_LOCATION) { "$env:APP_LOCATION" } Else { Write-Error -Message "ERROR: Missing value for 'APP_LOCATION'" -ErrorAction Stop }) 
Write-Verbose "APP_LOCATION: $APP_LOCATION" -Verbose

$APP_ALWAYS_ON = $(If ($env:APP_ALWAYS_ON) { "$env:APP_ALWAYS_ON" } Else { "true" }) 
Write-Verbose "APP_ALWAYS_ON: $APP_ALWAYS_ON" -Verbose

$APP_CURRENT_STACK = $(If ($env:APP_CURRENT_STACK) { "$env:APP_CURRENT_STACK" } Else { "dotnetcore" }) 
Write-Verbose "APP_CURRENT_STACK: $APP_CURRENT_STACK" -Verbose

#**********************************************************
# App Service Plan variables
#**********************************************************

$PLAN_NAME = $(If ($env:PLAN_NAME) { "$env:PLAN_NAME" } Else { Write-Error -Message "ERROR: Missing value for 'PLAN_NAME'" -ErrorAction Stop }) 
Write-Verbose "PLAN_NAME: $PLAN_NAME" -Verbose

$PLAN_RG_NAME = $(If ($env:PLAN_RG_NAME) { "$env:PLAN_RG_NAME" } Else { $APP_RG_NAME }) 
Write-Verbose "PLAN_RG_NAME: $PLAN_RG_NAME" -Verbose

$PLAN_LOCATION = $(If ($env:PLAN_LOCATION) { "$env:PLAN_LOCATION" } Else { $APP_LOCATION }) 
Write-Verbose "PLAN_LOCATION: $PLAN_LOCATION" -Verbose

$PLAN_ENVIRONMENT = $(If ($env:PLAN_ENVIRONMENT) { "$env:PLAN_ENVIRONMENT" } Else { "" }) 
Write-Verbose "PLAN_ENVIRONMENT: $PLAN_ENVIRONMENT" -Verbose

$PLAN_SKU = $(If ($env:PLAN_SKU) { "$env:PLAN_SKU" } Else { "Standard" }) 
Write-Verbose "PLAN_SKU: $PLAN_SKU" -Verbose

$PLAN_SKU_CODE = $(If ($env:PLAN_SKU_CODE) { "$env:PLAN_SKU_CODE" } Else { "S1" }) 
Write-Verbose "PLAN_SKU_CODE: $PLAN_SKU_CODE" -Verbose

$WORKER_SIZE = $(If ($env:WORKER_SIZE) { "$env:WORKER_SIZE" } Else { "0" }) 
Write-Verbose "WORKER_SIZE: $WORKER_SIZE" -Verbose

$WORKER_SIZE_ID = $(If ($env:WORKER_SIZE_ID) { "$env:WORKER_SIZE_ID" } Else { "0" }) 
Write-Verbose "WORKER_SIZE_ID: $WORKER_SIZE_ID" -Verbose

$NUMBER_OF_WORKERS = $(If ($env:NUMBER_OF_WORKERS) { "$env:NUMBER_OF_WORKERS" } Else { "1" }) 
Write-Verbose "NUMBER_OF_WORKERS: $NUMBER_OF_WORKERS" -Verbose

#**********************************************************
# App Insights variables
#**********************************************************

$AIS_NAME = $(If ($env:AIS_NAME) { "$env:AIS_NAME" } Else { Write-Error -Message "ERROR: Missing value for 'AIS_NAME'" -ErrorAction Stop }) 
Write-Verbose "AIS_NAME: $AIS_NAME" -Verbose

$AIS_RG_NAME = $(If ($env:AIS_RG_NAME) { "$env:AIS_RG_NAME" } Else { $APP_RG_NAME }) 
Write-Verbose "AIS_RG_NAME: $AIS_RG_NAME" -Verbose

$AIS_LOCATION = $(If ($env:AIS_LOCATION) { "$env:AIS_LOCATION" } Else { $APP_LOCATION }) 
Write-Verbose "AIS_LOCATION: $AIS_LOCATION" -Verbose

#**********************************************************
# MSI variables
#**********************************************************

$MSI_NAME = $(If ($env:MSI_NAME) { "$env:MSI_NAME" } Else { Write-Error -Message "ERROR: Missing value for 'MSI_NAME'" -ErrorAction Stop }) 
Write-Verbose "MSI_NAME: $MSI_NAME" -Verbose

$MSI_RG_NAME = $(If ($env:MSI_RG_NAME) { "$env:MSI_RG_NAME" } Else { $APP_RG_NAME }) 
Write-Verbose "MSI_RG_NAME: $MSI_RG_NAME" -Verbose

$MSI_LOCATION = $(If ($env:MSI_LOCATION) { "$env:MSI_LOCATION" } Else { $APP_LOCATION }) 
Write-Verbose "MSI_LOCATION: $MSI_LOCATION" -Verbose

#**********************************************************
# MSI variables
#**********************************************************

$KV_NAME = $(If ($env:KV_NAME) { "$env:KV_NAME" } Else { Write-Error -Message "ERROR: Missing value for 'KV_NAME'" -ErrorAction Stop }) 
Write-Verbose "KV_NAME: $KV_NAME" -Verbose

$KV_RG_NAME = $(If ($env:KV_RG_NAME) { "$env:KV_RG_NAME" } Else { $APP_RG_NAME }) 
Write-Verbose "KV_RG_NAME: $KV_RG_NAME" -Verbose

$KV_LOCATION = $(If ($env:KV_LOCATION) { "$env:KV_LOCATION" } Else { $APP_LOCATION }) 
Write-Verbose "KV_LOCATION: $KV_LOCATION" -Verbose

$KV_SECRET1 = $(If ($env:KV_SECRET1) { "$env:KV_SECRET1" } Else { Write-Error -Message "ERROR: Missing value for 'KV_SECRET1'" -ErrorAction Stop }) 
Write-Verbose "KV_SECRET1: $KV_SECRET1" -Verbose

$KV_SECRET2 = $(If ($env:KV_SECRET2) { "$env:KV_SECRET2" } Else { Write-Error -Message "ERROR: Missing value for 'KV_SECRET2'" -ErrorAction Stop }) 
Write-Verbose "KV_SECRET2: $KV_SECRET2" -Verbose

#**********************************************************
# Permission variables
#**********************************************************

$DEVELOPER_AD_GROUP_NAME = $(If ($env:DEVELOPER_AD_GROUP_NAME) { "$env:DEVELOPER_AD_GROUP_NAME" } Else { Write-Error -Message "ERROR: Missing value for 'DEVELOPER_AD_GROUP_NAME'" -ErrorAction Stop }) 
Write-Verbose "DEVELOPER_AD_GROUP_NAME: $DEVELOPER_AD_GROUP_NAME" -Verbose
