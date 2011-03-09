====
ACTS
====
Another Calendar-based Tarsnap Script, or
Alex's Crappy Tarsnap Script

Introduction
------------
``acts`` is a minimal shell script that creates backups with Tarsnap. Some design goals:

* Just backup, no restore.

* Calendar-based (daily, monthly, yearly) backup schedule

* Portable, small code footprint.

Overview
--------
``acts`` is intended to be run daily from cron to backup directories your system. One Tarsnap archive is created per-directory per-run. 31 daily backups are kept, 12 monthy backups are kept, and yearly backups are kept indefinitely.

Usage
-----
1. Take 'acts.conf' and customise it for your environment. Put it in /etc.
2. Run ``acts`` daily from cron.

Notes on behaviour:

* ``acts`` creates archives of the form '<hostname>-<period>-yyyy-mm-dd_HH:MM:SS-dir'. If you have any existing archives starting with 'hostname-daily/monthly/yearly)', they will confuse ``acts`` and it would be best if you delete or rename them.

* Archives are deleted using the following logic:
  * Take the most recent 31 days a daily backup exists, and delete any older daily backups.
  * Take the most recent 12 months a monthly backup exists, and delete any older monthly backups.
  * Do not delete any yearly backups.

* Dates in archive names are given in UTC time, not server local time.

* If you don't specify any directories to back up, ``acts`` will still delete old archives using the above logic.

TODO
----
* Add per-directory excludes handling. For now, add global excludes in your tarsnap.conf/tarsnaprc file.

* Add some backup period configurability.

Help
----
Email me (alex@bluebottle.net.au), or IRC me (checkers in #tarsnap).

