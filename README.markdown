Extending script by agl
=======================

This is a slightly modified script to extract the Mozilla root store from a
a certdata.txt. The original script, which contains all the magic, has been
written by agl.

My modifications:
  * Add some command-line flags I need to run it in batch mode
  * Make script parse older root store formats, too (from CVS rev 1.1 on)
  * In particular, trust values and descriptions have changed over time. Parse them all.

For the original description what the script does, and how to use it, please go to:

    https://github.com/agl/extract-nss-root-certs

