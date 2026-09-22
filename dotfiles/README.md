# dotfiles

Persoonlijke zsh-configuratie (Oh My Zsh + Powerlevel10k). De echte bestanden
staan in deze repo (`~/dotfiles/`); in `$HOME` staan symlinks ernaartoe, zodat
je gewoon de bestanden bewerkt en git de wijzigingen live ziet.

## Inhoud

| Bestand | Rol |
| --- | --- |
| `.zshrc` | hoofd-zsh-config (Oh My Zsh, plugins, NVM lazy-load, PATH) |
| `.p10k.zsh` | Powerlevel10k prompt-configuratie |
| `.zsh_secrets.zsh.example` | sjabloon voor je geheimen (kopieer naar `~/.zsh_secrets.zsh`) |
| `.gitignore` | sluit geheimen en OS-rommel uit |

> Geheimen (`~/.zsh_secrets.zsh`) staan **niet** in de repo en horen daar ook
> nooit in.

## Vereisten

- [zsh](https://www.zsh.org/)
- [Oh My Zsh](https://ohmyz.sh/) in `~/.oh-my-zsh`
- [Powerlevel10k](https://github.com/romkatv/powerlevel10k) als thema
- Oh My Zsh plugins: `zsh-autosuggestions` en `zsh-syntax-highlighting`
  (custom plugins onder `~/.oh-my-zsh/custom/plugins/`)
- Optioneel: [nvm](https://github.com/nvm-sh/nvm) in `~/.nvm` (lazy geladen)

## Installatie

```bash
# 1. Repo clonen
git clone git@github.com:ircj/ohmyzsh.git ~/dotfiles

# 2. Symlinks in $HOME zetten (-f overschrijft bestaande)
ln -sf ~/dotfiles/.zshrc   ~/.zshrc
ln -sf ~/dotfiles/.p10k.zsh ~/.p10k.zsh

# 3. Geheimen aanmaken op basis van het voorbeeld
cp ~/dotfiles/.zsh_secrets.zsh.example ~/.zsh_secrets.zsh
chmod 600 ~/.zsh_secrets.zsh
$EDITOR ~/.zsh_secrets.zsh      # vul je echte keys in

# 4. Nieuwe shell openen
exec zsh
```

> Bestaat er al een `~/.zshrc` die je wil bewaren? Maak eerst een back-up
> (`mv ~/.zshrc ~/.zshrc.bak`) voordat je de symlink zet.

## Geheimen / environment variables

`~/.zsh_secrets.zsh` wordt automatisch gesourcet door `.zshrc` als het bestaat.
Zet daarin de volgende variabelen (zie `.zsh_secrets.zsh.example`):

| Variabele | Waarvoor | Waar te vinden |
| --- | --- | --- |
| `LITELLM_API_KEY` | provider `litellm` in `opencode.json` | LiteLLM-gateway |
| `OBSIDIAN_MCP_BEARER_TOKEN` | Obsidian MCP-server in `opencode.json` | Local REST API plugin-instellingen (rauwe key) |

Voorbeeld:

```sh
export LITELLM_API_KEY="<jouw-litellm-key>"
export OBSIDIAN_MCP_BEARER_TOKEN="<jouw-obsidian-bearer-token>"
```

## Wijzigingen bijwerken

Omdat `$HOME` naar deze repo symlinkt, is bewerken + committen genoeg:

```bash
cd ~/dotfiles
git add -A
git commit -m "Update zsh config"
git push
```
