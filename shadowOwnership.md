Mon  8 Apr 17:03:57 WEST 2024

Noticed something odd. During an interview for an internship, I was asked about the shadow folder (/etc/shadow) and its uses in Linux.

Having replied passably well, I was then asked what happens when trying to cat /etc/shadow as a regular user, through a symbolic link we have to that file, where we have enough permissions.

I've noticed while experimenting with the idea, that if we change the ownership of that symbolic link, we instead are changing the actual ownership of the file it points to (in this case /etc/shadow).

I need to research a bit more this issue. These results aren't expected.
