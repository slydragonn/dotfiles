#!/bin/bash

# --- Variables ---
DOTFILES_DIR="$HOME/dotfiles"
BACKUP_DIR="$HOME/dotfiles_backup_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$BACKUP_DIR"

# --- Symlink function ---
link_dotfile() {
    local source="$1"
    local target="$2"

    if [ -e "$target" ] || [ -L "$target" ]; then
        echo "🔹 Backing up $target → $BACKUP_DIR/"
        mv "$target" "$BACKUP_DIR/"
    fi

    echo "🔗 Linking $source → $target"
    ln -sf "$source" "$target"
}

# --- Interactive menu ---
echo "🛠️  Select configurations to install:"
options=(
    "Neovim (Lazy.nvim)"
    "PowerShell"
    "Qtile"
    "Everything"
    "Exit"
)

select opt in "${options[@]}"; do
    case $opt in
        "Neovim (Lazy.nvim)")
            link_dotfile "$DOTFILES_DIR/nvim/lazy" "$HOME/.config/nvim"
            ;;
        "PowerShell")
            if [ -d "$HOME/.config/powershell" ]; then
                link_dotfile "$DOTFILES_DIR/powershell/profile.ps1" "$HOME/.config/powershell/Microsoft.PowerShell_profile.ps1"
            else
                echo "⚠️  PowerShell is not installed or path doesn't exist."
            fi
            ;;
        "Qtile")
            link_dotfile "$DOTFILES_DIR/qtile" "$HOME/.config/qtile"
            ;;
        "Everything")
            link_dotfile "$DOTFILES_DIR/nvim/lazy" "$HOME/.config/nvim"
            link_dotfile "$DOTFILES_DIR/powershell/profile.ps1" "$HOME/.config/powershell/Microsoft.PowerShell_profile.ps1"
            link_dotfile "$DOTFILES_DIR/qtile" "$HOME/.config/qtile"
            echo "✅ All configurations installed."
            break
            ;;
        "Exit")
            echo "🚪 Exiting..."
            exit 0
            ;;
        *)
            echo "❌ Invalid option. Please use the corresponding number."
            ;;
    esac
    echo "✔️  Installed: $opt"
done

echo "📦 Backup available at: $BACKUP_DIR"
