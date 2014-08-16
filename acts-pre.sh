#!/bin/sh

# This is an example pre-backup script for acts.

nice mysqldump --all-databases > /root/mysqldump.today.sql
