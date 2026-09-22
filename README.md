# dotfiles — backup branch `backup/2026-09-22`

Pre-rice snapshot van de XFCE-desktopconfiguratie op de werkplek (Debian 11,
XFCE, Citrix-omgeving) gemaakt op **2026-09-22** vóór de Tokyo Night ricing.

Deze branch dient puur als terugval-punt. De gericede configuratie komt op
`master`.

## Inhoud

- `xfce4/` — XFCE4 configuratie (panel, xfwm4, terminal, desktop, xfconf)
- `conky/` — conky widget-configuratie
- `autostart/` — XDG autostart entries
- `gtk-3.0/` — GTK3 instellingen
- `dotfiles/` — kopie van `~/dotfiles` (zsh + Powerlevel10k); geneste `.git` is
  verwijderd in deze snapshot
- `*-dump.txt` — volledige `xfconf-query` exports (xsettings, xfwm4, panel,
  desktop) als naslag voor handmatig herstel

## Geen secrets

Er staan geen geheimen in deze snapshot: alleen `.zsh_secrets.zsh.example` met
placeholders. Het echte `~/.zsh_secrets.zsh` staat in `.gitignore` en is nooit
meegekopieerd.

## Terugzetten

```bash
cp -a xfce4 conky autostart gtk-3.0 ~/.config/
# daarna uitloggen/inloggen of `xfce4-panel -r`
```
