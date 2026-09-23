# dotfiles — XFCE Tokyo Night rice

Riced desktopconfiguratie voor een **Debian 11 / XFCE / Citrix**-werkplek
(glibc 2.31, geen geaccelereerde GPU). Kleurthema: **Tokyo Night**.

De pre-rice snapshot staat op branch `backup/2026-09-22`.

## Structuur

Bestanden staan onder hun home-relatieve pad:

- `.config/kitty/` — kitty terminal (Tokyo Night, JetBrainsMono Nerd Font)
- `.config/xfce4/helpers.rc` — kitty als XFCE-standaardterminal
- `.local/share/xfce4/helpers/custom-TerminalEmulator.desktop` — helper-definitie
- `zsh/.zshrc`, `zsh/.p10k.zsh` — zsh + Powerlevel10k prompt

## Voortgang

- [x] Fase 1 — terminal & fonts (kitty + JetBrainsMono Nerd Font + Tokyo Night)
- [x] Fase 2 — GTK-thema (Tokyonight-Dark-Storm) + Tela-circle-blue-dark icons + wallpaper
- [x] Fase 3 — picom (xrender, geen blur) + transparant panel + ulauncher thema
- [x] Fase 4 — conky Tokyo Night widget + fastfetch (polyfilled)

## Installatie op een nieuwe machine

```bash
# fonts (niet in deze repo wegens grootte)
curl -fsSL -o /tmp/JBMono.zip \
  https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip
mkdir -p ~/.local/share/fonts/JetBrainsMonoNerd
unzip -o /tmp/JBMono.zip 'JetBrainsMonoNerdFont*.ttf' -d ~/.local/share/fonts/JetBrainsMonoNerd
fc-cache -f

# kitty 0.36.4 (laatste versie die op glibc 2.31 werkt)
curl -fsSL -o /tmp/kitty.txz \
  https://github.com/kovidgoyal/kitty/releases/download/v0.36.4/kitty-0.36.4-x86_64.txz
mkdir -p ~/.local/kitty.app && tar xf /tmp/kitty.txz -C ~/.local/kitty.app
ln -sf ~/.local/kitty.app/bin/kitty ~/.local/bin/kitty

# configs
cp -a .config/kitty            ~/.config/
cp -a zsh/.zshrc zsh/.p10k.zsh ~/dotfiles/   # of ~/ afhankelijk van je setup
```

## Fase 2 — desktop-thema

GTK/xfwm4-thema **Tokyonight-Dark-Storm** (build met `sassc`), icons
**Colloid-dark**, en een lokaal met ImageMagick gegenereerde Tokyo Night
wallpaper.

```bash
# thema bouwen + installeren naar ~/.themes
curl -fsSL -o /tmp/tn.tar.gz \
  https://github.com/Fausto-Korpsvart/Tokyo-Night-GTK-Theme/archive/refs/heads/master.tar.gz
tar xf /tmp/tn.tar.gz -C /tmp
cd /tmp/Tokyonight-GTK-Theme-master/themes && bash install.sh -c dark -t default --tweaks storm

# toepassen (of run xfce-appearance/apply-appearance.sh)
xfconf-query -c xsettings -p /Net/ThemeName     -s "Tokyonight-Dark-Storm"
xfconf-query -c xfwm4     -p /general/theme      -s "Tokyonight-Dark-Storm"
xfconf-query -c xsettings -p /Net/IconThemeName  -s "Colloid-dark"
```

## Geen secrets

Echte geheimen staan nooit in deze repo (zie `.gitignore`); ze horen in
`~/.zsh_secrets.zsh` (git-ignored).
