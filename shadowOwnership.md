Mon  8 Apr 17:03:57 WEST 2024

Noticed something odd. During an interview for an internship, I was asked about the shadow folder (/etc/shadow) and its uses in Linux.

Having replied passably well, I was then asked what happens when trying to cat /etc/shadow as a regular user, through a symbolic link we have to that file, where we have enough permissions.

I've noticed while experimenting with the idea, that if we change the ownership of that symbolic link, we instead are changing the actual ownership of the file it points to (in this case /etc/shadow).

I need to research a bit more this issue. These results aren't expected.

--snip--

The permission settings on any symbolic link are only dummy permissions. in truth, the symlink will actually have whatever permissions that are on the original file it is pointing to (it's actually pointing to the name of the file, but nevermind that now).

So, any change in user or group ownership, or even file permission changes will take effect on the original gile, not on the symlink.

I got this info from the wonderful book'Unix and Linux System Administration Handbook', page 132.

Mystery solved. I think that my interviewer was trying to grasp the depth of my knowledge on the subject matter.

So! in fact... if you were to successfully change permissions to the symlink, you'd be changing said permissions to the original file, and said hypothetical user would be able to cat the file. :)

--snip--