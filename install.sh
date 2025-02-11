#/bin/sh

# audio
sudo pacman -S --noconfirm ttc-iosevka noto-fonts-{cjk,emoji,extra} ttf-dejavu ttf-nerd-fonts-symbols-mono

# audio
sudo pacman -S --noconfirm pipewire-{alsa,jack,pulse}
systemctl --user enable pipewire{,-pulse} wireplumber

# must have
sudo pacman -S --noconfirm hyprland xdg-desktop-portal-hyprland qt{5,6}-wayland xdg-user-dirs hyprlock hyprpaper foot fuzzel waybar bash_completion libnotify dunst wl-clipboard
paru -S --noconfirm hyprpolkitagent

# needed (for scripts, etc.)
sudo pacman -S --noconfirm firefox gtk4 breeze-gtk btop mpv yt-dlp fasfetch mand-db ntfs-3g cliphist wtype slurp grim jq libqalculate syncthing lf gnumeric perl-image-exiftool ffmpegthumbnailer docx2txt catdoc odt2txt transmission-cli zbar

# totally extra
sudo pacman -S --noconfirm zathura-pdf-popple jdk{,8}-openjdk libreoffice-fresh telegram-desktop tailscale docker
paru -S --noconfirm sftpman bruno-bin intellij-idea-ultimate

dir="$(dirname "$0")"

if [ -d "~/.config" ] || mkdir "~/.config"
for cc in $(ls "$dir/.config"); do
    cp -riv "$dir/.config/$cc" "~/.config/cc"
done

if [ -d "~/.local/bin" ] || mkdir "~/.local/bin"
for bb in $(ls "$dir/.local/bin"); do
    cp -iv "$dir/.local/bin/$bb" "~/.local/bin/bb"
done

if [ -d "~/.local/share" ] || mkdir "~/.local/share"
for ss in $(ls "$dir/.local/share"); do
    cp -riv "$dir/.local/share/$ss" "~/.local/share/ss"
done

cp -iv "$dir/.bash_profile" "~/.bash_profile"
cp -iv "$dir/.bashrc" "~/.bashrc"
