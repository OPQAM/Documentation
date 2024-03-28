Thu 28 Mar 09:22:09 WET 2024

This doc file describes my (very unnecessary) rookie mistake.

So, as described elsewhere in my documentation (or Linux) files, whenever I open a terminal in one of my regular machines, a series of things happen.

- A stoic quote pops up;
- Rust cargo stuff gets loaded;
- Linux gets automatically updated (script);
- Linux gets automatically upgraded (script);
- An SSH agent and key are both loaded, for github access (script);
(the step above requires a complex password)
- All my personal repositories are automatically pulled (script);
- A certain folder is automatically added to my PATH (so that scripts within it can run anywhere on my machine).

And that last line right there was creating an issue.

Before realizing where my mistake was, this was what I was observing:
When opening a new terminal, all my processes were running and doing their own thing, but as soon as I got control of my machine (after entering my password and seeing all the processes running) I wasn't able to run simple commands such as 'ls', 'vim', etc.

Since this wasn't happening before, and, as I came to notice, didn't happen every time I created a new session, I thought it had to do with the way .bashrc is loading - and that perhaps it needed a second or so before all resources were properly loaded.

I tried different approaches, with echo messages and with small breaks to see what was wrong. Nothing was working.

- Do note that I was considering, at the time, that when my terminal was opening normally everything was going according to plan, and when I lost the ability to use simple commands, my program was simply working badly. This was exactly backwards.

Whenever the script wasn't running properly (some serious hickup on the repo retrieval, or some other problem that required me to ctrl-C into the terminal) the offending (last) line wasn't running, and when the program was running to the end, flawlessly, I lost control of the terminal.

In the end I suspected that the PATH wasn't running properly, since alias like 'ls' weren't detected. So this is what I did...

Detection:
echo $PATH

This gave me the only folder that was now included within the path (my local folder executed into the .bashrc file).

Solution to the issue:
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

This added the standard folders to my PATH, thus allowing me to grasp control of my machine.

But I still wanted my folder to be added to the PATH variables. 
This wasn't hard, of course. I just did what I should have done right in the beginning. I added this line to my script (the same script that was already sourced from within .bashrc):

export PATH=$PATH:/path/to/my/folder/here

This makes sure that the path is being added, instead of overwriting the existing PATH.

No more issues. Now everything loads smoothly.

--snip--
