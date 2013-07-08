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

Known issues:
  * CVS rev. 1.16 contains an intermediate certificate (!) by the US Postal Office.
    It has the never-before-seen-and-never-again-used trust setting NETSCAPE_VALID_DELEGATOR.
    I still need to find out how NSS treated this trust setting, i.e. I am not sure
    if that cert was ever trusted for SERVER_AUTH or not.
  * CVS rev. 1.11 and 1.12 contains a certificate where the SHA1 value in the trust
    object is wrong (does not match the SHA1 in the cert object). From what I read
    in agl's comments in his code, this cert would still have been accepted by NSS
    (NSS does not match on SHA1 but on issuer and serial number). If you do root
    store archaelogy on these two particular revisions, you need to take this into
    account. I am going to verify it with wtc. From CVS rev 1.13 on, the SHA1 value
    is correct.
  * CVS rev. 1.1-1.3 of Mozilla root store contain test certificates with
    such an unusual ASN.1 encoding that Go's X.509 library hickups and goes
    to sleep with an headache (throws error).
