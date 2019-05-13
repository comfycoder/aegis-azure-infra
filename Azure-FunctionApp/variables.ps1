
# $ACR_NAME = "$env:ACR_NAME"
# Write-Verbose "ACR_NAME: $ACR_NAME" -Verbose

# $ACR_RG_NAME = "$env:ACR_RG_NAME"
# Write-Verbose "ACR_RG_NAME: $ACR_RG_NAME" -Verbose

# $ACR_LOCATION = "$env:ACR_LOCATION"
# Write-Verbose "ACR_LOCATION: $ACR_LOCATION" -Verbose

# $ACR_SKU = "$env:ACR_SKU"
# Write-Verbose "ACR_SKU: $ACR_SKU" -Verbose

$APP_RG_NAME = "RG-MM-MyFuncApp"
Write-Verbose "APP_RG_NAME: $APP_RG_NAME" -Verbose

$APP_NAME = "FA-MM-MyFuncApp"
Write-Verbose "APP_NAME: $APP_NAME" -Verbose

$APP_LOCATION = "eastus2"
Write-Verbose "APP_LOCATION: $APP_LOCATION" -Verbose

$AIS_NAME = "AIS-MM-MyFuncApp"
Write-Verbose "AIS_NAME: $AIS_NAME" -Verbose

$STORAGE_NAME = "sammmyfuncapp2"
Write-Verbose "STORAGE_NAME: $STORAGE_NAME" -Verbose

$PLAN_RG_NAME = "RG-MM-MyFuncApp"
Write-Verbose "PLAN_RG_NAME: $PLAN_RG_NAME" -Verbose

$PLAN_NAME = "ASP-MM-MyFunc"
Write-Verbose "PLAN_NAME: $PLAN_NAME" -Verbose

# $PLAN_ENVIRONMENT = ""
# Write-Verbose "ACR_SKU: $ACR_SKU" -Verbose

$PLAN_SKU = "Standard"
Write-Verbose "PLAN_SKU: $PLAN_SKU" -Verbose

$PLAN_SKU_CODE = "S1"
Write-Verbose "PLAN_SKU_CODE: $PLAN_SKU_CODE" -Verbose

$WORKER_SIZE = "0"
Write-Verbose "WORKER_SIZE: $WORKER_SIZE" -Verbose
