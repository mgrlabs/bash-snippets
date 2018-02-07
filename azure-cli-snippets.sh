
# Grab a specific field from a tab seperated output
az keyvault secret show --vault-name 'keyvault-test1' -n 'SSHPublicKey' -o tsv | cut -f7
