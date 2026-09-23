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

# --- Topbar (panel-1) restyle: Whisker-menu, opgeschoond, Tokyo Night ---
# Whisker-menu plugin (vervangt klassiek applicationsmenu)
xfconf-query -c xfce4-panel -p /plugins/plugin-100 -n -t string -s "whiskermenu"
xfconf-query -c xfce4-panel -p /plugins/plugin-100/button-icon -n -t string -s "org.xfce.panel.whiskermenu"
xfconf-query -c xfce4-panel -p /plugins/plugin-100/show-button-title -n -t bool -s false
# Uitrekkende separator (id 5) om rechterkant weg te duwen
xfconf-query -c xfce4-panel -p /plugins/plugin-5/expand -n -t bool -s true
# Opgeschoonde plugin-volgorde
# Vaste spacer tussen klok en naam (actions)
xfconf-query -c xfce4-panel -p /plugins/plugin-101 -n -t string -s "separator"
xfconf-query -c xfce4-panel -p /plugins/plugin-101/style -n -t int -s 0
xfconf-query -c xfce4-panel -p /plugins/plugin-101/expand -n -t bool -s false
xfconf-query -c xfce4-panel -p /panels/panel-1/plugin-ids -t int -s 100 -t int -s 2 -t int -s 4 -t int -s 5 -t int -s 6 -t int -s 8 -t int -s 10 -t int -s 12 -t int -s 101 -t int -s 14
# Afmetingen + klok + achtergrond
xfconf-query -c xfce4-panel -p /panels/panel-1/size -s 28
xfconf-query -c xfce4-panel -p /panels/panel-1/icon-size -s 18
xfconf-query -c xfce4-panel -p /panels/panel-1/length -s 100
xfconf-query -c xfce4-panel -p /plugins/plugin-12/digital-format -s "%a %d %b  %H:%M"
xfconf-query -c xfce4-panel -p /plugins/plugin-12/tooltip-format -s "%A %d %B %Y"
xfconf-query -c xfce4-panel -p /panels/panel-1/background-style -s 1
xfconf-query -c xfce4-panel -p /panels/panel-1/background-rgba -t double -s 0.102 -t double -s 0.106 -t double -s 0.149 -t double -s 1.0
xfce4-panel -r
