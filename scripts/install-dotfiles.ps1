# --- Variables ---
$DOTFILES_DIR = "$env:USERPROFILE\dotfiles"
$BACKUP_DIR = "$env:USERPROFILE\dotfiles_backup_$(Get-Date -Format 'yyyyMMdd_HHmmss')"
New-Item -ItemType Directory -Path $BACKUP_DIR | Out-Null

# --- Symlink function ---
function Link-Dotfile {
    param ($Source, $Target)
    if (Test-Path $Target) {
        Write-Host "🔹 Backing up $Target → $BACKUP_DIR"
        Move-Item $Target $BACKUP_DIR -Force
    }
    Write-Host "🔗 Linking $Source → $Target"
    New-Item -ItemType SymbolicLink -Path $Target -Target $Source -Force | Out-Null
}

# --- Interactive menu ---
Write-Host "🛠️  Select configurations to install:"
$options = @(
    "Neovim (Lazy.nvim)",
    "PowerShell",
    "Everything",
    "Exit"
)

$selection = 0
while ($selection -lt 1 -or $selection -gt $options.Length) {
    for ($i = 0; $i -lt $options.Length; $i++) {
        Write-Host "$($i+1). $($options[$i])"
    }
    $selection = Read-Host "Enter your choice number"
}

switch ($selection) {
    1 {
        Link-Dotfile "$DOTFILES_DIR\nvim\lazy" "$env:USERPROFILE\AppData\Local\nvim"
    }
    2 {
        Link-Dotfile "$DOTFILES_DIR\powershell\profile.ps1" "$env:USERPROFILE\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
    }
    3 {
        Link-Dotfile "$DOTFILES_DIR\nvim\lazy" "$env:USERPROFILE\AppData\Local\nvim"
        Link-Dotfile "$DOTFILES_DIR\powershell\profile.ps1" "$env:USERPROFILE\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
        Write-Host "✅ All configurations installed."
    }
    4 {
        Write-Host "🚪 Exiting..."
        exit 0
    }
    default {
        Write-Host "❌ Invalid option."
    }
}

Write-Host "📦 Backup available at: $BACKUP_DIR"
