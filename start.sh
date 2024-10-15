# Downloads
curl -s -o login.sh -L "https://raw.githubusercontent.com/Hoanganhdev111/luu_tru/refs/heads/main/login.sh"

# Disable spotlight indexing
sudo mdutil -i off -a

# Create new account
sudo dscl . -create /Users/runneradmin
sudo dscl . -create /Users/runneradmin UserShell /bin/bash
sudo dscl . -create /Users/runneradmin RealName "Runner_Admin"
sudo dscl . -create /Users/runneradmin UniqueID 1001
sudo dscl . -create /Users/runneradmin PrimaryGroupID 80
sudo dscl . -create /Users/runneradmin NFSHomeDirectory /Users/tcv
sudo dscl . -passwd /Users/runneradmin P@ssw0rd!
sudo createhomedir -c -u runneradmin > /dev/null
sudo dscl . -append /Groups/admin GroupMembership runneradmin

# Enable Remote Management
sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -configure -allowAccessFor -allUsers -privs -all

# Start Remote Management/reset changes
sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -restart -agent -console
sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -activate

# Install ngrok for remote access (optional)
brew install --cask ngrok

# Configure ngrok and start it
ngrok authtoken $1
ngrok tcp 3389 &  # RDP uses port 3389

# Restart the machine to apply changes (optional)
# sudo reboot
