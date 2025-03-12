# Hyprland Dotfiles

Welcome to my **Hyprland-Dots** repository! These dotfiles are tailored for a seamless, efficient, and aesthetically pleasing desktop environment on Arch Linux with Hyprland as the window manager.My Hyprland Dotfiles are Currently Work in Progress As I Have A lot to learn.
Feel free to share some advice


## 🖥️ System Details

- **OS**: Arch Linux  
- **Window Manager**: [Hyprland](https://hyprland.org/)  
- **Laptop**: ASUS TUF F15 FX506HC  
- **CPU**: Intel i5 11th Gen  
- **GPU**: NVIDIA RTX 3050  
- **RAM**: 24GB  
  

## ✨ Features

- **Dynamic Tiling**: Effortlessly manage windows with Hyprland’s advanced tiling features.
- **Custom Keybindings**: Optimized for productivity and easy navigation.
- **Theming**: A minimalist, elegant theme with GTK and [Pywal16](https://github.com/eylles/pywal16.git), [Waybar](https://github.com/Alexays/Waybar.git), and terminal integrations.
- **Applications Integrated**:
  - **Launcher**: Wofi & Rofi
  - **Terminal**: Kitty
  - **File Manager**: Nautilus & Vim
  - **Music**: Spotify 
  - **Gaming**: Steam, Heroic
  - **Image Tools**: Gwenview, GIMP
  - **Video Tools**: Kdenlive
  - **Code Editors**: VSCode, Kate, Vim
  - **Sddm Theme**: [Sequoia](https://codeberg.org/minMelody/sddm-sequoia)


 
  ## 📋 Prerequisites
Before applying the configurations, ensure your system has all the necessary packages installed. You can use the following command to install the required packages:
```ruby
yay -S hyprland xdg-desktop-portal-hyprland waypaper swww python-pywal16 wlogout sddm kitty rofi wofi waybar swaync nautilus btop vim kate pipewire pipewire-pulse wireplumber pavucontrol power-profiles-daemon wl-clipboard cliphist blueman bluez bluez-utils bluez-libs hyprlock hypridle hyprshot --needed
```
## 🛠️ Setting Up Configurations
  1. Clone the Repository:
     ```ruby
     git clone https://github.com/BloodstainedOath/Hyprland-Dots.git
     ```
  2. Apply Configurations:
     ```ruby
     cp -r ~/Hyprland-Dots/.config/* ~/.config/
     ```
  3. Restart Your Session: Log out and log back in to apply the setup.

### 🖥️ Requirements

Refer to the Prerequisites section for a list of necessary packages.

     
