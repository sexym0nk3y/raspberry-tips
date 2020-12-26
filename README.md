<div align="center">
    <h1>Raspberry Tips & Tricks & Hacks</h1>
</div>

## General ##

Change root password : <code>sudo passwd root</code>

## Enable SSH before first boot

Recent Raspbian disabled SSH by default.

If you want to enable SSH, all you need to do is to put a file called <code>ssh</code> in the <code>/boot/</code> directory.

Default user / password : <code>pi</code> / <code>raspberry</code>

## Install & Enabling VNC

Install VNC with
<pre>
sudo apt update
sudo apt install realvnc-vnc-server
</pre>

You can enable VNC Server with
<pre>sudo raspi-config</pre>

Navigate to <strong>Interfacing Options</strong> and select <strong>VNC > Yes</strong>

### Troubleshooting ###

#### Cannot Currently Show the Desktop ####
Launch <code>sudo raspi-config</code>

Select <code>Advanced Options > Resolution</code> and select a lower resolution. And reboot.

## Mount a CIFS Share Folder

Execute <code>sudo nano /etc/fstab</code> and add :

<pre>
//&lt;IPADRRESS>/&lt;DIRECTORY> /mnt/&lt;LOCALDIRECTORY> cifs user=&lt;USERNAME>,pass=&lt;PASSWORD>,uid=&lt;UID>,x-systemd.automount 0 0
</pre>

Get user uid: <code>id -u &lt;username></code> Default: pi username.

Mount folder <code>sudo mount -a</code>

## Backup:  SD Card Image command line

Gzip backup command line. Backup time may take time. About 1 hour for a 32GB card

<pre>sudo dd bs=4M if=/dev/&lt;DEVICEID> | gzip > /&lt;LOCALORMOUNTFOLDER>/&lt;BACKUPNAME>.img.gz
</pre>

<small>Default SD CARD DEVICE ID : <code>mmcblk0</code></small>

## Send an email notification when someone logs in through SSH

/!\ Require <code>sendmail</code>.

1. Create a new folder in <code>/usr</code>
    ```
    sudo mkdir /usr/custom
    ```
2. Create a new script <code>sudo touch /usr/custom/ssh_alert.sh</code>
3. Change permissions 
    ```
    sudo chmod 0700 /usr/custom/ssh_alert.sh && chown root:root /usr/custom/ssh_alert.sh
    ```
4. Use your favorite editor to edit the file and copy and paste this file [ssh_alert.sh](scripts/ssh_alert.sh)
5. Final step - add this line at the end of <code>/etc/pam.d/sshd</code>
   ```
   session required pam_exec.so /usr/custom/ssh_alert.sh
   ```
