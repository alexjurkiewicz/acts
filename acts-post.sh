#!/bin/sh

# This is a post-backup script for acts. You probably want to customise it.

/usr/local/bin/tarsnap --print-stats > /var/lib/munin/tarsnap-stats.sh
