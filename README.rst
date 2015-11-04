========
ACTS 1.2
========

Another Calendar-based Tarsnap Script.

Introduction
------------

``acts`` is a minimal shell script that creates backups with Tarsnap. Our design goals:

* Just backup, no restore.
* Calendar-based backup schedule
* Portable, small, code footprint.

One Tarsnap archive is created per-target per-run. 31 daily, 12 monthly, and indefinite yearly backups are kept.

Download
--------

You can use the development version of ``acts`` by cloning this repository, or `download the latest stable release <https://github.com/alexjurkiewicz/acts/releases/latest>`_.

Usage
-----

1. Take ``acts.conf.sample``, customise it for your environment, and save it to ``/etc/acts.conf`` or ``/usr/local/etc/acts.conf``.
2. Run ``acts`` daily from cron.

Notes on behaviour:

* ``acts`` creates archives of the form ``<hostname>-<period>-yyyy-mm-dd_HH:MM:SS-target``.

* Archives are created using the following logic:

  * If no yearly backup for the current year exists, create a yearly backup.
  * If no monthly backup for the current month exists, create a monthly backup.
  * Otherwise, create a daily backup.
  
* Archives are deleted using the following logic:

  * If any backups failed, delete nothing.
  * Keep the most recent 31 daily backups, and delete any older ones.
  * Keep the most recent 12 monthly backups, and delete any older ones.
  * Do not delete any yearly backups.
  
* Times in archive names use UTC, not the server's timezone.

TODO
----

* Add per-directory excludes handling. (For now, add global excludes in your ``tarsnap.conf`` or ``.tarsnaprc`` file.)
* Add some backup period configurability. (For now, you can edit the hardcoded values in the script.)

License
-------

This is free and unencumbered software released into the public domain.

Help
----

Email me (alex@jurkiewi.cz) or open a Github issue.
