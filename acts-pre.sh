#!/bin/sh

# This is an example pre-backup script for acts. You probably want to customise it.

nice mysqldump --all-databases --skip-extended-insert > /root/mysqldump.today.sql
dpkg --get-selections > /root/dpkg-selections.txt
