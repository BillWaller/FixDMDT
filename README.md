# RECONSTRUCTING A CORRUPTED DESKTOP CONFIGURATION

This repository contains a set of scripts that can be used to reconstruct a corrupted desktop configuration on a Linux system. I have used these scripts to fix a corrupted desktop configuration on my system, and I have documented the process in this README file. The scripts are designed to be run in order, but they can be run separately if needed. The scripts use the update-alternatives system to manage the displaymanagers and desktops, so they can be used to set the priorities for the displaymanagers and desktops.

Please check the scripts before running them, and make sure the paths and file names are consistent with your system. I have only tested these scripts with SuSE Tumbleweed
releases beginning in March 2025. Please check the scripts before running them, and make sure the paths and file names are consistent with your system. I realize there
is a lot of text in these scripts, but other than that, they aren't difficult to
understand.

I wrote these scripts because my display manager and desktop configuration kept
getting corrupted, and I wanted a way to easily fix it without having to
manually edit the configuration files. I have used these scripts without modification several times to fix my desktop configuration, and they have worked well for me. I hope they can be useful for others who are experiencing similar issues.

If your system is substantially different from mine, I hope you will modify
these programs to work with your system and share your modifications with others who might be in a similar situation. I have only tested these scripts with SuSE Tumbleweed releases beginning in March 2025, but they should work with other Linux distributions that use the update-alternatives system to manage the displaymanagers and desktops.

The scripts are designed to be run in order, but they can be run separately if needed. The scripts use the update-alternatives system to manage the displaymanagers and desktops, so they can be used to set the priorities for the displaymanagers and desktops.

Higher numbered scripts are meant to be run after lower numbered scripts. For example, 03-ua-in-dm-1.sh is meant to be run after 01-ua-rm-dm.sh and 02-ua-rm-dt.sh. The scripts are meant to be run in order, but they can be run separately if needed. For example, if you only want to prepare the list of wayland desktops for editing, you can run 05-ua-in-wdt-1.sh without running the other scripts.

The priority numbers are arbitrary and can be changed as needed. The important thing is that they are unique and that they reflect the desired order of the displaymanagers and desktops. For example, if you want sddm to be the default displaymanager, you can give it a higher priority than the other displaymanagers.

---

## Check the current displaymanager configuration

```bash
./chkdm.sh
```

The following is an example of the output of chkdm.sh, which shows the current displaymanager configuration and the available alternatives. The output includes the current default displaymanager, the best version (the one with the highest priority), and the list of all available displaymanagers with their priorities.

```bash
default-displaymanager - auto mode
  link best version is /usr/lib/X11/displaymanagers/sddm
  link currently points to /usr/lib/X11/displaymanagers/sddm
  link default-displaymanager is /usr/lib/X11/displaymanagers/default-displaymanager
/usr/lib/X11/displaymanagers/console - priority 20
/usr/lib/X11/displaymanagers/gdm - priority 10
/usr/lib/X11/displaymanagers/sddm - priority 40
/usr/lib/X11/displaymanagers/xdm - priority 30
```

---

## Check the current desktop configuration

```bash
./chkdt.sh
```

The following is an example of the output of chkdt.sh, which shows the current desktop configuration for both wayland and x sessions. The output includes the current default desktop, the best version (the one with the highest priority), and the list of all available desktops with their priorities.

```bash
default-waylandsession.desktop - auto mode
  link best version is /usr/share/wayland-sessions/plasmawayland.desktop
  link currently points to /usr/share/wayland-sessions/plasmawayland.desktop
  link default-waylandsession.desktop is /usr/share/wayland-sessions/default-desktop
/usr/share/wayland-sessions/gnome-wayland.desktop - priority 30
/usr/share/wayland-sessions/gnome.desktop - priority 10
/usr/share/wayland-sessions/plasmawayland.desktop - priority 40
----------------------------------------------------------------
default-xsession-desktop - auto mode
  link best version is /usr/share/xsessions/plasma6.desktop
  link currently points to /usr/share/xsessions/plasma6.desktop
  link default-xsession-desktop is /usr/share/xsessions/default-desktop
/usr/share/xsessions/icewm.desktop - priority 20
/usr/share/xsessions/plasma6.desktop - priority 40
----------------------------------------------------------------
```

---

## What caused my desktop configuration to get corrupted?

Here's one instance of how it happened. A process running with root access was causing some problems. I couldn't kill it. I found that it was part of gnome-extras, which I don't use, so I removed gnome-extras. Before zypper finished removing the package, my system abruptly rebooted. After the reboot, my desktop configuration was corrupted. I had no display manager, and I couldn't log in to my desktop environment. I had to use a virtual console to log in and fix the configuration.

Every time I had to deal with a corrupted desktop configuration, it was after removing some package with zypper. I don't think there is anything wrong with zypper. It's more likely that the dependency data was incorrect or became corrupted.

In fact, it happened again just a few days ago, but it was no problem to fix with this set of scripts. I figure they save me an hour or two of work each time I have to fix the configuration, so they are worth the effort to write and maintain.

---

## Acknowledgements

I want to thank the developers of the update-alternatives system, which is a powerful tool for managing the displaymanagers and desktops on a Linux system. I also want to thank the developers of the displaymanagers and desktops that I use, which are sddm and plasma, respectively. Finally, I want to thank the open source community for providing the tools and resources that I used to write these scripts.

I also want to thank Copilot for helping me figure the problem out and write these scripts. Copilot is an AI-powered code completion tool that can help you write code faster and with fewer errors. I found it to be a useful tool for writing these scripts, and I appreciate the help it provided.

---

## 🐸 Enjoy! If you encounter any issues or have questions, feel free to open an issue on my github page.

---

## To Fix a Corrupted Displaymanager and Desktop configuration:

The intended way to use the scripts is to run 00-backup.sh first, check that the
backups were made correctly, and then run the other scripts in order. For example, you can run 01-ua-rm-dm.sh to remove the displaymanagers from update-alternatives, then run 03-ua-in-dm-1.sh to prepare the list of displaymanagers for editing, then edit dms.lst to set the priorities for the displaymanagers, and then run 04-ua-in-dm-2.sh to add the displaymanagers back to update-alternatives with the new priorities.

### backup update alternatives data

00-Run.sh makes a basckup of the update alternatives data you are about to change with scripts 01.. through 08.. in the current directory under ua-backups

    WARNING: Do not run this script after running any of the other scripts 01 throug 08 because it will overwrite the backup files

### remove displaymanagers from update-alternatives

```bash
./01-ua-rm-dm.sh
```

### remove desktops from update-alternatives

```bash
./02-ua-rm-dt.sh
```

### prepares list of displaymanagers for editing

```bash
./03-ua-in-dm-1.sh
```

    After the above script runs successfully:
    edit dms.lst to set priorities for displaymanagers. The format is:
    path to desktop file followed by priority. For example:
    /usr/lib/X11/displaymanagers/sddm 40

### add displaymanagers to update-alternatives

```bash
./04-ua-in-dm-2.sh
```

### prepare list of wayland desktops for editing

```bash
./05-ua-in-wdt-1.sh
```

    After the above script runs successfully:
    edit wdt.lst to set priorities for wayland desktops. The format is:
    path to desktop file followed by priority. For example:
    /usr/share/wayland-sessions/plasmawayland.desktop 40

### add wayland desktops to update-alternatives

```bash
./06-ua-in-wdt-2.sh
```

### prepare list of x desktops for editing

```bash
./07-ua-in-xdt-1.sh
```

    After the above script runs successfully:
    user: edit xdt.lst to set priorities for x desktops. The format is:
    path to desktop file followed by priority. For example:
    /usr/share/xsessions/plasma6.desktop 40

### add x desktops to update-alternatives

```bash
./08-ua-in-xdt-2.sh
```

## Intermediate Files

These files may be deleted after the scripts have been run, but they are included here for reference. They show the format of the files that are used to store the list of displaymanagers and desktops with their priorities.

dms.out displaymanager raw list
dms.lst displaymanager prioritized list

```bash
/usr/lib/X11/displaymanagers/sddm 40
/usr/lib/X11/displaymanagers/console 20
/usr/lib/X11/displaymanagers/xdm 30
/usr/lib/X11/displaymanagers/gdm 10
```

wdt.out wayland desktop raw list
wdt.lst wayland desktop prioritized list

```bash
/usr/share/wayland-sessions/plasmawayland.desktop 40
/usr/share/wayland-sessions/gnome.desktop 10
/usr/share/wayland-sessions/gnome-wayland.desktop 30
```

xdt.out x desktop raw list
xdt.lst x desktop prioritized list

```bash
/usr/share/xsessions/plasma6.desktop 40
/usr/share/xsessions/icewm.desktop 20
```

### The composite-wm-dt.sh script

This script is meant to be a consolidation of the previous scripts that
you use customize according to your particular configuration. It is easier
to use that 9 separate scripts, but it is less flexible. You can use it to set the priorities for the displaymanagers and desktops in one step, but you will need to
edit the script to set the priorities for your particular configuration.
