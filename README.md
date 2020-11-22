<div align="center">
    <h1>Raspberry tips</h1>
</div>

## Mount a CIFS Share Folder

Execute <code>sudo nano /etc/fstab</code> and add :

<pre>
//&lt;IPADRRESS>/&lt;DIRECTORY> /mnt/&lt;LOCALDIRECTORY> cifs user=&lt;USERNAME>,pass=&lt;PASSWORD>,uid=&lt;USERUID>,soft 0 0
</pre>

Get user uid: <code>id -u &lt;username></code>

## Backup:  SD Card Image command line

Gzip backup command line. Backup time may take time. About 1 hour for a 32GB card

<pre>sudo dd bs=4M if=/dev/&lt;DEVICEID> | gzip > /&lt;LOCALORMOUNTFOLDER>/&lt;BACKUPNAME>.img.gz
</pre>

<small>Default SD CARD DEVICE ID : <code>mmcblk0</code></small>
