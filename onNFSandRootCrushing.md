Wed  7 Feb 18:20:01 WET 2024

- This document comes after studying, in class, about NFS (Network File System), a distributed file system protocl that allows a user on a client computer to mount and access a folder (belonging to another person, which has that folder on their machine).

- In particular, I was surprised to find that, despite being root on my client machine, I had very few if any rights on the mounted folder. In fact, I learned that through 'root squashing' the root's UID is changed from 0 (root) to 65534 (nobody), actually crushing its rights and making it the least important user. So, the root can't list attributes, for example, and can only read or read and write, if the folder owner actually attributed said rights to the 'foreign root'.

- Since I had never heard about 'root squashing' and find the subject interesting, I decided to open up this document, and just place here my thoughts and findings, as small as they may be.

- The root squashing privilege escalation didn't work as expected and requires a serious error on the part of the admin (to include in /etc/export the line 'no_root_squash') which makes no sense, but makes it very easy to escalate privileges (by using setuid - and making our UID and GID go to 0). Still, an interesting thing to know.

- Need to learn more about root squashing.
