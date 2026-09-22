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
- [ ] Fase 2 — GTK-thema + icons + wallpaper
- [ ] Fase 3 — picom (geen blur) + xfce4-panel + rofi
- [ ] Fase 4 — conky + fastfetch

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

## Geen secrets

Echte geheimen staan nooit in deze repo (zie `.gitignore`); ze horen in
`~/.zsh_secrets.zsh` (git-ignored).
