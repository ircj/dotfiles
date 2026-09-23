# Tokyo Night appearance settings (apply with the commands below)
# GTK theme:
xfconf-query -c xsettings -p /Net/ThemeName    -s "Tokyonight-Dark-Storm"
# xfwm4 borders:
xfconf-query -c xfwm4    -p /general/theme    -s "Tokyonight-Dark-Storm"
# Icons:
xfconf-query -c xsettings -p /Net/IconThemeName -s "Tela-circle-blue-dark"

# --- Compositing UIT (Citrix: geen picom/xfwm4-compositing i.v.m. lag) ---
# Compositing + transparantie over Citrix veroorzaakt veel netwerkverkeer en
# daardoor traagheid. Panels en terminal blijven daarom ondoorzichtig.
xfconf-query -c xfwm4 -p /general/use_compositing -s false
for p in panel-1 panel-2; do
  xfconf-query -c xfce4-panel -p /panels/$p/background-style -s 0
done
xfce4-panel -r
