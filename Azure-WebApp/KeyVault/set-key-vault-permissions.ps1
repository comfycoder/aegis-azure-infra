$MSI_OBJECT_ID = Get-MSI -msiName "$MSI_NAME" -rgName $MSI_RG_NAME -queryParam "principalId"
Write-Verbose "MSI_OBJECT_ID: $MSI_OBJECT_ID" -Verbose

# Set MSI Permissions
az keyvault set-policy --name "$KV_NAME" `
    --secret-permissions "get", "list" `
    --object-id "$MSI_OBJECT_ID"

$DEVELOPER_AD_GROUP_OBJECT_ID = Get-AD-Group -groupName "$DEVELOPER_AD_GROUP_NAME" -queryParam "objectId"
Write-Verbose "DEVELOPER_AD_GROUP_OBJECT_ID: $DEVELOPER_AD_GROUP_OBJECT_ID" -Verbose

# Set Developer AD Group Permissions
az keyvault set-policy --name "$KV_NAME" `
    --certificate-permissions backup, create, delete, deleteissuers, get, getissuers, import, list, listissuers, managecontacts, manageissuers, purge, recover, restore, setissuers, update `
    --key-permissions backup, create, decrypt, delete, encrypt, get, import, list, purge, recover, restore, sign, unwrapKey, update, verify, wrapKey `
    --secret-permissions backup, delete, get, list, purge, recover, restore, set `
    --storage-permissions backup, delete, deletesas, get, getsas, list, listsas, purge, recover, regeneratekey, restore, set, setsas, update `
    --object-id "$DEVELOPER_AD_GROUP_OBJECT_ID"


