ACTS 1.4b2
==========

Another Calendar-based Tarsnap Script.

Introduction
------------

`acts` is a minimal shell script that creates backups with Tarsnap. Our
design goals:

-   Just backup, no restore.
-   Calendar-based backup schedule
-   Portable, small, code footprint.

One daily Tarsnap archive is created per-target per-run. By default,
31 daily and 12 monthly backups are kept, and yearly backups are
kept indefinitely.

Download
--------

You can use the development version of `acts` by cloning this
repository, or [download the latest stable
release](https://github.com/alexjurkiewicz/acts/releases/).

Usage
-----

1.  Take `acts.conf.sample`, customise it for your environment, and save
    it to `/etc/acts.conf` or `/usr/local/etc/acts.conf`.
2.  Run `acts` daily from cron.

Notes on behaviour:

-   `acts` creates archives of the form
    `<hostname>-<period>-yyyy-mm-dd_HH:MM:SS-target`.
-   Archives are created using the following logic:
    -   Daily archives are created every time acts is run.
    -   Monthly/yearly archives are copied from the most recent
        daily archive if they don't exist.
-   Archives are deleted using the following logic by default:
    -   If any backups failed, delete nothing.
    -   Keep the most recent 31 daily backups, and delete any older
        ones.
    -   Keep the most recent 12 monthly backups, and delete any older
        ones.
    -   Do not delete any yearly backups.
-   If you ever remove a backup path from your config, its old backups will no longer be automatically cleaned.

TODO
----

-   Add per-directory excludes handling. (For now, add global excludes
    in your `tarsnap.conf` or `.tarsnaprc` file.)

FAQ
---

* **How do I back up directories with spaces?** Sorry, acts doesn't support this. I suggest you create a symlink to the target directory which doesn't have spaces in its path, and add `-L` to `tarsnapbackupoptions` in your configuration file.

License
-------

This is free and unencumbered software released into the public domain.

Help
----

Open a Github issue, or you can email me (<alex@jurkiewi.cz>).
