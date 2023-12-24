#Conner
#12-24-2023

# Define the App Volumes Manager URL from the config JSON file
$config = Get-Content 'config.json' | ConvertFrom-Json
$avManagerUrl = $config.avManagerUrl

# Authentication body
$authBody = @{
    username = "conner_admin"
    password = Read-Host -Prompt "Enter your password"
}

# Convert authentication body to JSON
$jsonAuthBody = $authBody | ConvertTo-Json

# Create a session
$session = Invoke-RestMethod -Method Post -Uri "$avManagerUrl/cv_api/sessions" -ContentType "application/json" -Body $jsonAuthBody -SessionVariable avSession

if ($session.success -eq "Ok") {
    Write-Host "Authenticated"
} else {
    Write-Host "Auth Failed"
    return
}

# Get a list of App Volumes
$appVolumes = Invoke-RestMethod -Method Get -Uri "$avManagerUrl/cv_api/appstacks" -WebSession $avSession

# Print the names of each App Volume
$appVolumes | ForEach-Object { Write-Host $_.name }