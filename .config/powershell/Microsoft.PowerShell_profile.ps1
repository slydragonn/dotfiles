oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\half-life.omp.json" | Invoke-Expression

Import-Module -Name Terminal-Icons

# Alias

Set-Alias -Name vim -Value nvim
Set-Alias g git