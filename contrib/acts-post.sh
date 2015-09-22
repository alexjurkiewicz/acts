#!/bin/sh

# This is an example post-backup script for acts.

/usr/local/bin/tarsnap --print-stats > /var/lib/munin/tarsnap-stats.sh
