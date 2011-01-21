====
ACTS
====
Another Calendar-based Tarsnap Script, or
Alex's Calendar-based Tarsnap Script

Introduction
------------
ACTS is a minimal shell script that creates backups with Tarsnap. Some points (and reasons) on the design:

* Just backup, no restore.

* Simplicity is a design goal.

* Calendar-based backup schedule.

* Inflexible backup schedule.

The feature list:

* Inflexible backup schedule (run daily)

* Inflexible backup retention (keeps 30 daily backups, 12 monthly backups, all yearly backups)

* Small code footprint

Usage
-----
1. Take 'acts.conf' and customise it for your environment. Put it in /etc.
2. Run 'acts' daily from cron.

Note: acts creates archives of the form 'hostname-period-yyyy-mm-dd_HH:MM:SS-dir'. If you have any existing archives starting with 'hostname-(daily|monthly|yearly)', they might confuse ACTS and it would be best if you delete or rename them.

Help
----
Email me (alex@bluebottle.net.au), or find me in #tarsnap (checkers).

