# ASUS VPN Toggle
This project allows you to toggle VPN Client 5 on your Asus RT-AC87U router running Asuswrt-Merlin firmware using a hardware button, and shows the VPN status via the router LEDs.
* VPN active → LED off
* VPN inactive → LED on
* Works using the AllLED trigger (button press detection)
* Runs as a background service via Cron

## Features
* Toggle VPN Client 5 on/off with a physical button (LED button) (VPN Client can be changed)
* Automatic LED feedback: LED shows inverted VPN status
* Runs in the background and starts automatically at boot
* Uses only built-in firmware hooks (nvram, service) – **no firmware modifications**

## Requirements
* ASUS Router (I used the RT-AC87U)
* Asuswrt-Merlin firmware installed
* VPN Client configured and working (for me its Client 5)
* SSH access to /jffs/scripts

## Installation
1. SSH into your router
2. Create the scripts folder (if it doesn’t exist):
```mkdir -p /jffs/scripts```

3. Upload the scripts:

- toggle_vpn.sh → /jffs/scripts/toggle_vpn.sh

4. Make the scripts executable:
```chmod +x /jffs/scripts/toggle_vpn.sh```

## Cron configuration
```cru a vpn_monitor "@reboot /jffs/scripts/toggle_vpn.sh &"```
- This ensures the monitor script runs automatically in the background after each reboot

Check your cron configuration with: ```cru l```

## How does this work?
- Watches AllLED for changes (button presses)
- Detects when the button is pressed

- Checks VPN Client 5 status (nvram get vpn_client5_state)

- Toggles VPN on/off

- **LED Behavior** (inverted by design)

  - VPN active → LED off

  - VPN inactive → LED on
 

# ⚠️ Designed for RT-AC87U and Merlin firmware; may not work on other models! ⚠️
