## Crontab Setup (Linux)
Add the the following line (using crontab -e) to cron to apply the changes hourly
```
0 * * * * cd ~/dotfiles && git pull origin main && stow -v * >> ~/dotfiles/stow.log 2>&1

```
