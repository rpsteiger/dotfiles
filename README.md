## Crontab Setup (Linux)
Add the the following line (using crontab -e) to cron to apply the changes hourly
```
0 * * * * cd ~/dotfiles && git pull origin main && stow -v * >> ~/dotfiles/stow.log 2>&1

```

## Cronjob Using Launchers (macOS)
Great! You can use **launchd**, which is the macOS equivalent of cron, to run your command every hour. Here’s how:

### **Step 1: Create a Launch Agent**
1. Open Terminal and create a new `.plist` file:
   ```bash
   mkdir -p ~/Library/LaunchAgents
   nano ~/Library/LaunchAgents/com.user.dotfiles.sync.plist
   ```
2. Add the following content:
   ```xml
   <?xml version="1.0" encoding="UTF-8"?>
   <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
   <plist version="1.0">
       <dict>
           <key>Label</key>
           <string>com.user.dotfiles.sync</string>

           <key>ProgramArguments</key>
           <array>
               <string>/bin/bash</string>
               <string>-c</string>
               <string>cd ~/dotfiles && git pull origin main && stow -v * >> ~/dotfiles/stow.log 2>&1</string>
           </array>

           <key>StartInterval</key>
           <integer>3600</integer>  <!-- Runs every hour -->

           <key>RunAtLoad</key>
           <true/>
       </dict>
   </plist>
   ```
   - `StartInterval` is set to **3600 seconds (1 hour)**.
   - `RunAtLoad` ensures it runs when the agent is first loaded.

### **Step 2: Load the Launch Agent**
Run:
```bash
launchctl load ~/Library/LaunchAgents/com.user.dotfiles.sync.plist
```
This will schedule your task to run every hour.

### **Step 3: Verify It’s Running**
You can check if your job is loaded with:
```bash
launchctl list | grep com.user.dotfiles.sync
```

### **Step 4: Unload If Needed**
If you ever want to stop the scheduled task:
```bash
launchctl unload ~/Library/LaunchAgents/com.user.dotfiles.sync.plist
```
