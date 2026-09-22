# Tokyo Night appearance settings (apply with the commands below)
# GTK theme:
xfconf-query -c xsettings -p /Net/ThemeName    -s "Tokyonight-Dark-Storm"
# xfwm4 borders:
xfconf-query -c xfwm4    -p /general/theme    -s "Tokyonight-Dark-Storm"
# Icons:
xfconf-query -c xsettings -p /Net/IconThemeName -s "Colloid-dark"

# --- Fase 3: panel transparency (Tokyo Night) ---
xfconf-query -c xfwm4 -p /general/use_compositing -s false
for p in panel-1 panel-2; do
  xfconf-query -c xfce4-panel -p /panels/$p/background-style -s 1
  xfconf-query -c xfce4-panel -p /panels/$p/background-rgba -s 0.102 -s 0.106 -s 0.149 -s 0.85
done
xfce4-panel -r
