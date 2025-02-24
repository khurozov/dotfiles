#/bin/sh

# update pacman db
sudo pacman -Sy

# audio
sudo pacman -S --noconfirm ttc-iosevka noto-fonts-{cjk,emoji,extra} ttf-dejavu ttf-nerd-fonts-symbols-mono

# audio
sudo pacman -S --noconfirm pipewire-{alsa,jack,pulse}
systemctl --user enable pipewire{,-pulse} wireplumber

# must have
sudo pacman -S --noconfirm hyprland xdg-desktop-portal-hyprland qt{5,6}-wayland xdg-user-dirs hyprlock hyprpaper foot fuzzel waybar bash-completion libnotify dunst wl-clipboard keepassxc
paru -S --noconfirm hyprpolkitagent hyprshade

# needed (for scripts, etc.)
sudo pacman -S --noconfirm firefox gtk4 breeze-gtk btop mpv yt-dlp fastfetch man-db ntfs-3g cliphist wtype slurp grim jq libqalculate syncthing nsxiv lf chafa bat gnumeric perl-image-exiftool ffmpegthumbnailer docx2txt catdoc odt2txt transmission-cli zbar pulsemixer
paru -S clipboard-bin

# totally extra
sudo pacman -S --noconfirm zathura-pdf-poppler jdk{,8}-openjdk libreoffice-fresh telegram-desktop tailscale docker cronie
paru -S --noconfirm sftpman bruno-bin intellij-idea-ultimate-edition

# copy config files
dir="$(dirname "$0")"

[ -d "$HOME/.config" ] || mkdir "$HOME/.config"
for cc in $(ls "$dir/.config"); do
    cp -rivf "$dir/.config/$cc" "$HOME/.config/$cc"
done

[ -d "$HOME/.local/bin" ] || mkdir "$HOME/.local/bin"
for bb in $(ls "$dir/.local/bin"); do
    cp -ivf "$dir/.local/bin/$bb" "$HOME/.local/bin/$bb"
done

[ -d "$HOME/.local/share" ] || mkdir "$HOME/.local/share"
for ss in $(ls "$dir/.local/share"); do
    cp -rivf "$dir/.local/share/$ss" "$HOME/.local/share/$ss"
done

cp -ivf "$dir/.bash_profile" "$HOME/.bash_profile"
cp -ivf "$dir/.bashrc" "$HOME/.bashrc"

# enable hyprshade timer
hyprshade install
systemctl --user enable hyprshade.timer
