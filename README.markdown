Backuper is a tool for automatizing backups from a remote server. It's composed of two main executable files: backuper and backup_sync:

* backuper loads a configuration files and does a backup.

* backuper_sync downloads a backup made by backuper from a remote server to a local folder. It's use is optional.

Targets for backup are files, folders, MySQL and MongoDB databases, but you can add your own "backupers" (classes that runs backup processes) if you know Ruby.

The content of backups are compressend and rotated. You can specify a number of backups in a folder, and if there's more backups the older will be deleted.

You can use backuper in addition with crontab for making daily, weekly or any intervaled - backups for making all your data secure.

Hugo Massaroli - 2012

Dependencies
============

ruby, bash, tar, crontab, rsync, scp

On Ubuntu and another Debian based distributions of Linux, run:

sudo apt-get install ruby tar crontab rsync
gem install trollop


Install
=======

You have to download backuper in your remote server and in your local computer too. You can avoid, if you want, the local part. But the remote part is mandatory.

Backuper install
--------------

1. Create a folder and give write permissions to your user.
2. Download Backuper and put it somewhere in your user folder.

  cd myfolder && git clone https://github.com/hhaamm/backuper.git

3. Copy a sample config file (i.e. local_config.rb.sample) somwhere and edit the file.
4. Set a crontab that executes backuper in the interval that you want.

  Example:

  crontab -e

  20 0 * * * cd /home/your-user/backuper_folder && ruby backuper --config-file <my-config-file-path>

  This line will run backuper every day at 12:20 am.

  If you are using RVM, this line won't work! You have to use:

  20 0 * * * /bin/bash -l -c 'cd /home/your-user/backuper_folder && ./backuper --config-file <my-config-file-path>'

  Because in this way bash will have the neccesary environment to know where is the ruby install.

5. Done! Easy, right?

Sync install
-------------

1. Create a folder and give write permissions to your user.
2. Download Backuper and put it somewhere in your user folder.
3. Copy the file sync_config.rb.sample to sync_config.rb and configure it.
4. If you want, create a cron that runs backuper_sync periodically. But you can run backuper_sync in a manual mode too!
5. Done! Even easier, right?

Use
===

Backuper
--------

./backuper --config-file <my-config-file>

Local synchronization
---------------------

./backuper_sync

Restore backup
--------------

1. Check the .tar.gz backup file you want to restore.
2. Uncompress: 

   tar -xf <file>.tar.gz
   
3. Manually upload and restore your files.