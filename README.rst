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
``acts`` is intended to be run daily from cron to backup directories on your system. One Tarsnap archive is created per-directory per-run. 31 daily, 12 monthly, and indefinite yearly backups are kept.

Usage
-----
1. Take *acts.conf* and customise it for your environment. Put it in */etc*.
2. Run ``acts`` daily from cron.

Notes on behaviour:

* ``acts`` creates archives of the form *<hostname>-<period>-yyyy-mm-dd_HH:MM:SS-dir*. If you have any existing archives starting with *hostname-(daily|monthly|yearly)*, they will confuse ``acts``, so don't do that.

* Archives are created using the following logic:
    * If no yearly backup for the current year exists, create a yearly backup.
    * If a yearly backup exists but no monthly backup, create a monthly backup.
    * Otherwise, create a daily backup.

* Archives are deleted using the following logic:
    * Keep the most recent 31 daily backups, and delete any older ones.
    * Keep the most recent 12 monthly backups, and delete any older ones.
    * Do not delete any yearly backups.

* Dates in archive names are given in UTC time, not server local time.

* If you don't specify any directories to back up, ``acts`` will still delete old archives using the above logic.

TODO
----
* Add per-directory excludes handling. (For now, add global excludes in your *tarsnap.conf* or *.tarsnaprc* file.)

* Add some backup period configurability. (For now, you can edit the hardcoded values in the script.)

Help
----
Email me (alex@jurkiewi.cz) or open a Github issue.

