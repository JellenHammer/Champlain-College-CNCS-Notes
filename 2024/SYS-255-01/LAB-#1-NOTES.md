# January 18th Lab - Pfsense & Windows 10 Configuration
## Pfsense Firewall (fw01) | WAN = em0 | LAN = em1 |
- The LAN address of fw01 (.5.2) acts as the default gateway for wks01 (.5.100)
- The WAN address of fw01 (.17.109) goes upstream to .17.2
- Address conflicts will occur (as usual) if someone uses the same WAN address as me by mistake.
## Workstation 01 (wks01) | .5.100 |
- Windows 10
- Default gateway of 5.2 (LAN address of fw01)
- Can access and/or ping Champlain.edu if no address conflicts occur
## Notes from Today
I would like to think I need to brush up on traceroute and tracert. We do not use it too much at the Leahy Center, but it will most likely help to learn it, nor had I used it much while I worked as an IT Technician before moving to Burlington. 
I should note I have not used Pfsense as much as I have experience with Cisco ASAs. My primary expertise has always been enterprise Cisco equipment, rather than vendor neutral equipment. 
Powershell is another one. I'm learning powershell over time, and while the commands given were fine for today, I’d like to learn more about it.
## TLDR Notes from Today
- Brush up on traceroute / tracert
- Look more into powershell
- Start the next labs before next class if schedule is free
