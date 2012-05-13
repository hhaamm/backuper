Backuper is a tool for automatizing backups from a remote server. It contains two configurable executables, a remote one using crontab which runs periodical backups and a local one wich synchronizes a local folder with a remote backup folder.

Use
===

You have to download backuper in your remote server and in your local computer too. You can avoid, if you want, the local part. But the remote part is mandatory.

Remote install
--------------

1. Create a folder and give write permissions to your user.
2. Download Backuper and put it somewhere in your user folder.
3. Open the file 'backuper_remote' and configure it.
4. Set a crontab that executes backuper_remote in the interval that you want.
5. Done! Easy, right?

Local install
-------------

1. Create a folder and give write permissions to your user.
2. Download Backuper and put it somewhere in your user folder.
3. Open the file 'backuper_local' and configure it.
4. If you want, create a cron that runs backuper_local periodically. But you can run backuper_local in a manual mode too!
5. Done! Even easier, right?

TODO
====

Make configurable files with YAML or another plain text format. Remove configuration from executables (ugly for end-users).

Make an option for installing automatically (which creates the desired folders, give permissions, creates the crontab, etc.)

Implement rotations for don't have to store alot of files (just the number of versions you need: 3, 4, whathever).