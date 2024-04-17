Started with a simple installation of Ubuntu (considered Mint and Debian) but I've been haging good experiences with Ubuntu lately.

Besides, my dual boot home PC has Mint, and my laptop has Debian. So, it's good to chage things a little.

Decided against Red Hat (for now). But I'll have to visit that 'can of worms' sooner rather than later.

The installation is straightforward.

There are quite a few programs that can wonderfully do for you the USB boot flash installation.


It's just that: get the ISO, use the program (Rufus or Balena Etcher, as examples) to flash the disk, and now it's ready to go.

You need to retart your computer and go to the BIOS, so as to set the proper order of boot, or to simply boot directly into the USB.

You might also need to disable fast restart - probably won't be necessary with most modern and widely available Linux systems, but ymmv.

So, you do that and then you start the installation of (in this case) Ubuntu.

Since I'm dual booting, I decided to create my own partitions.

To do that I had to empty said partitions beforehand, so that they could be empty space (I did that on windows, under device manager - in fact, it was already free, for reasons. But hey. It's simple to do).

I then created 3 different partitions. A Root partition, a Home partition and a Swap partition.

The installation was pretty simple, from that point on, and mostly gui guided.
If you want to encrypt the disk you can choose to do so.

Since this is a work computer, I'm encrypting it. Again, ymmv.

--snip--
