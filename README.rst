====
ACTS
====
Another Calendar-based Tarsnap Script, or
Alex's Calendar-based Tarsnap Script

Introduction
------------
ACTS is a minimal shell script that creates backups with Tarsnap. Some design goals:

* Just backup, no restore.

* Calendar-based backup schedule.

* Inflexible rotation schedule.

* Portable, small code footprint.

Usage
-----
1. Take 'acts.conf' and customise it for your environment. Put it in /etc.
2. Run 'acts' daily from cron.

Note: acts creates archives of the form 'hostname-period-yyyy-mm-dd_HH:MM:SS-dir'. If you have any existing archives starting with 'hostname-(daily|monthly|yearly)', they might confuse ACTS and it would be best if you delete or rename them.

Help
----
Email me (alex@bluebottle.net.au), or find me in #tarsnap (checkers).

