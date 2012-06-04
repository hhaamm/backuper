Backuper is a tool for automatizing backups from a remote server. It contains two configurable executables, a remote one using crontab which runs periodical backups and a local one wich synchronizes a local folder with a remote backup folder.

Targets for backup are files, folders and MySQL databases, but you can add your own "backupers" if you know Ruby. If you do, please let me know so I can add the option and have an improved "Backuper" :)

The content of backups are compressend and rotated. You can specify a number of backups in a folder, and if there's more backups the older will be deleted.

You can use backuper in addition with crontab for making daily, weekly or any intervaled - backups for making all your data secure.

Hugo Massaroli - 2012

Dependencies
============

ruby, bash, tar, crontab, rsync

On Ubuntu and another Debian based distributions of Linux, run:

sudo apt-get install ruby tar crontab rsync


Install
=======

You have to download backuper in your remote server and in your local computer too. You can avoid, if you want, the local part. But the remote part is mandatory.

Remote install
--------------

1. Create a folder and give write permissions to your user.
2. Download Backuper and put it somewhere in your user folder.

  cd myfolder && git clone https://github.com/hhaamm/backuper.git

3. Copy the file remote_config.rb.sample to remote_config.rb and configure it.
4. Set a crontab that executes backuper_remote in the interval that you want.

  Example:

  crontab -e

  20 0 * * * cd /home/your-user/backuper && ruby backuper_remote

  This line will run backuper every day at 12:20 am.

  If you are using RVM, this line won't work! You have to use:

  20 0 * * * /bin/bash -l -c 'cd /home/your-user/backuper && ./backuper_remote'

  Because in this way bash will have the neccesary environment to know where is the ruby install.

5. Done! Easy, right?

Local install
-------------

1. Create a folder and give write permissions to your user.
2. Download Backuper and put it somewhere in your user folder.
3. Copy the file local_config.rb.sample to local_config.rb and configure it.
4. If you want, create a cron that runs backuper_local periodically. But you can run backuper_local in a manual mode too!
5. Done! Even easier, right?

Use
===

Remote backup
-------------

./backuper_remote

Local synchronization
---------------------

./backuper_local

Restore backup
--------------

1. Check the .tar.gz backup file you want to restore.
2. Uncompress: 
   tar -xf <file>.tar.gz
3. Manually upload and restore your files.

TODO
====

Make configurable files with YAML or another plain text format. Remove configuration from executables (ugly for end-users).

Make an option for installing automatically (which creates the desired folders, give permissions, creates the crontab, etc.)

Extract the last backup in a custom folder.
