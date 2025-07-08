#/bin/sh

# update pacman db
sudo pacman -Sy

if ! which paru >/dev/null; then
    git clone https://aur.archlinux.org/paru-bin.git
    cd paru-bin
    makepkg -si
    cd ..
    rm -rf paru-bin
fi

# audio
sudo pacman -S --noconfirm ttc-iosevka noto-fonts-{cjk,emoji,extra} ttf-dejavu ttf-nerd-fonts-symbols-mono

# audio
sudo pacman -S --noconfirm pipewire-{alsa,jack,pulse}
systemctl --user enable pipewire{,-pulse} wireplumber

# must have
sudo pacman -S --noconfirm hyprland xdg-desktop-portal-hyprland qt{5,6}-wayland xdg-user-dirs hyprlock hyprpaper hyprsunset foot fuzzel waybar bash-completion libnotify dunst wl-clipboard openssh keepassxc
paru -S --noconfirm hyprpolkitagent

# needed (for scripts, etc.)
sudo pacman -S --noconfirm gtk4 breeze-gtk btop mpv yt-dlp fastfetch man-db ntfs-3g cliphist wtype slurp grim jq libqalculate syncthing nsxiv lf chafa bat gnumeric perl-image-exiftool ffmpegthumbnailer docx2txt catdoc odt2txt transmission-cli zbar pulsemixer wev swappy
paru -S --noconfirm librewolf-bin

# totally extra
sudo pacman -S --noconfirm tesseract-data-{eng,rus} zathura-pdf-mupdf jdk{,8}-openjdk libreoffice-fresh telegram-desktop tailscale docker cronie
paru -S --noconfirm bruno-bin intellij-idea-ultimate-edition

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

# autologin, see https://wiki.archlinux.org/title/Getty#Virtual_console
sudo mkdir -p /etc/systemd/system/getty@tty1.service.d/
 echo "[Service]
ExecStart=
ExecStart=-/sbin/agetty -o '-p -f -- \\\\u' --noclear --autologin $USER %I \$TERM" > /etc/systemd/system/getty@tty1.service.d/autologin.conf
