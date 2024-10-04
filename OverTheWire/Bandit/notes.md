#Notes on Bandit Game

### Bandit 0
"The goal of this level is for you to log into the game using SSH. 
The host to which you need to connect is bandit.labs.overthewire.org, 
on port 2220. The username is bandit0 and the password is bandit0.
Once logged in, go to the Level 1 page to find out how to beat Level 1."
-Password in readme file

**ssh -p 2220 banditX@bandit.labs.overthewire.org**

X = level number

Password: ZjLjTmM6FvvyRnrb2rfNWOZOTa6ip5If
### Bandit 1
"The password for the next level is stored in a file called - 
located in the home directory"

We can search for 'dashed filenames'

We can read it with a cat ./-

Password: 263JGJPfgU6LtdEvgfWU1XP5yac29mFx
### Bandit 2
"The password for the next level is stored in a file called spaces 
in this filename located in the home directory"

We can simply cat it:
 cat spaces\ in\ this\ filename

Password: MNk8KNH3Usiio41PRUEoDFPqfxLPlSmx
### Bandit 3
"The password for the next level is stored in a hidden file
 in the inhere directory."

 cat ./...Hiding-From-You 

Password: 2WmrDFRmJIq3IPxneAaMGhap0pFhF3NJ
### Bandit 4
"The password for the next level is stored in the only human-readable file in 
the inhere directory. Tip: if your terminal is messed up, try the “reset” comma"

I entered the inhere folder and did:
 file ./-file0*

This shows all the types of files for all files in this folder.

I then read the only ASCII text folder

Password: 4oQYVPkxZOOEOO5pTW81FB8j8lxXGUQw
### Bandit 5
"The password for the next level is stored in a file somewhere under 
the inhere directory and has all of the following properties:

human-readable
1033 bytes in size
not executable"

I did man find to recall how to use it.

Looking into 'find' I find out that:
 find ./maybehere01 -type f ! -perm /111  (example)
will let me check files that do not have executable permissions:
! -perm /111 (meaning not executable)

I tried a few ways to check for human readable, but there were many like that.
I finally checked for exactly 1033 bytes. This is the end result:

bandit5@bandit:~/inhere$ find . -type f -size 1033c ! -perm /111
./maybehere07/.file2

We can then cat the file. Or we could, instead:
 cat "$(find . -type f -size 1033c ! -perm /111)"
HWasnPhtq9AVKe0dmk45nxy20cvUa6EG

Reasoning: 
 $(...) lets us use the outpute of the command inside as an argument for cat.
Nifty! Note that this works for a single output, not several files.

If there are more we can instead use -exec:

 find . -type f -size 1033c ! -perm /111 -exec cat {} \;

...which will cat each file found, individually.

Password: HWasnPhtq9AVKe0dmk45nxy20cvUa6EG
### Bandit 6
"The password for the next level is stored somewhere on the server and
 has all of the following properties:

owned by user bandit7
owned by group bandit6
33 bytes in size"

Again, using man find, I managed to get this:
 cat "$(find / -user bandit7 -group bandit6 -size 33c 2>/dev/null)"
morbNTDkSW6jIlUc0ymOdMaLnOlFVAaj

Password: morbNTDkSW6jIlUc0ymOdMaLnOlFVAaj
### Bandit 7
"The password for the next level is stored in the file data.txt 
next to the word millionth"

A simple grep should do it..
 grep -ia "millionth" data.txt

Password: dfwvzFQi4mU0wfNbFOe9RoWskMLg7eEc
### Bandit 8
"The password for the next level is stored in the file data.txt
 and is the only line of text that occurs only once"

Need to man grep to check out for non repeating text
I can use sort, actually and pipe grep into it.

Unfortunately I wasn't able to do it, so I resoreted to sort + uniq

 sort data.txt | uniq -u
(this works - see man uniq)

Password: 4CKMh1JI91bUIZZPXDqGanal4xvAg0JM
### Bandit 9
"The password for the next level is stored in the file data.txt 
in one of the few human-readable strings, preceded by several ‘=’ characters."

I did:
 cat data.txt | grep -ia "===" | strings
A bit rough around the edges, but it works.

More elegant would be:

 strings data.txt | grep -a '==='

Password: FGUW5ilLVJrxX9kMYMmlN4MgbpfMiqey
### Bandit 10
"The password for the next level is stored in the file data.txt, 
which contains base64 encoded data"
-Base64 wikipedia

 base64 -d data.txt

Password: dtR173fZKb0RRsDFSGsg2RWnpNVj3qRr
### Bandit 11
"The password for the next level is stored in the file data.txt, 
where all lowercase (a-z) and uppercase (A-Z) letters have been 
rotated by 13 positions"
-Rot13 on wikipedia

The way to solve this was in the wikipedia article:
tr 'A-Za-z' 'N-ZA-Mn-za-m' < data.txt

We're doing a transformation of text using 'tr' (translate)
'A-Za-z' is including all uppercase and lowercase letters
'N-ZA-Mn-za-m' is shifting the alphabet by 13 places (ROT13)

Password: 7x16WNeHIi5YkIhWsfFIqoognUTyj9Q4
### Bandit 12
"The password for the next level is stored in the file data.txt, 
which is a hexdump of a file that has been repeatedly compressed. 
For this level it may be useful to create a directory under /tmp 
in which you can work. Use mkdir with a hard to guess 
directory name. Or better, use the command “mktemp -d”. 
Then copy the datafile using cp, and rename it using mv 
(read the manpages!)"
-Hex dump on wikipedia

This one is a bit lengthy. You have to first use xxd because of the
hexdump, and then you have to deal with compression, using gunzip,
bunzip2, tar.

Make sure you use the 'file' command, and the man library to learn
more about these commands.

Password: FO5dwFsc0cbaIiH0h8J2eUks2vdTDwAn
### Bandit 13
"The password for the next level is stored in /etc/bandit_pass/bandit14
and can only be read by user bandit14. For this level, 
you don’t get the next password, but you get a private SSH key 
that can be used to log into the next level. Note: localhost is
a hostname that refers to the machine you are working on"
- SSH/OpenSSH/Keys

IMAGE

I checked how to use a file with an SSH key to jump into another machine

ssh -p 2220 -i /path_to/file user@localhost


Password: (MU4VWeTyJk8ROof1qqmcBPaLh7lDCPvS) -> SSH key
### Bandit 14
"The password for the next level can be retrieved by submitting 
the password of the current level to port 30000 on localhost."

So, we retrieve the pass from this level, which we can do
because we're user bandit14.

$ cat /etc/bandit_pass/bandit14
MU4VWeTyJk8ROof1qqmcBPaLh7lDCPvS

And we then use this password to port 30000

pic

also:

echo "PASS_HERE" | nc localhost 30000
or
no localhost 30000
and then use pass

Password: 8xCjnmgoKbGLhHFAZlGE5Tmu4M2tKJQo 
### Bandit 15
"The password for the next level can be retrieved by submitting 
the password of the current level to port 30001 on localhost using 
SSL/TLS encryption.

Helpful note: Getting “DONE”, “RENEGOTIATING” or “KEYUPDATE”? 
Read the “CONNECTED COMMANDS” section in the manpage."
-> Secure Socket Layer/Transport Layer Security on wikipedia
-> read the wiki article

Password: kSkvUpMQ7lBYyCM4GBPvCvT1BfWRy0Dx
### Bandit 16
"The credentials for the next level can be retrieved by 
submitting the password of the current level to a port on 
localhost in the range 31000 to 32000. First find out which 
of these ports have a server listening on them. Then find out 
which of those speak SSL/TLS and which don’t. There is only 1 
server that will give the next credentials, the others will 
simply send back to you whatever you send to it.

Helpful note: Getting “DONE”, “RENEGOTIATING” or “KEYUPDATE”? 
Read the “CONNECTED COMMANDS” section in the manpage."

-> Manpage wasn't too helpful. But I got this from chatgpt:

There is no visible manpage dealing with KEYUPDATE, etc...

The server is interpreting the first letter of the password 'k'
as being KEYUPDATE. The -ign_eof flag tells openssl s_client
not to close the connection immediately after receiving the EOF

So, use:

openssl s_client -ign_eof localhost:PORT

This gives me an RSA private key, which I then saved to a file
in my pc.

chmod 600 /tmp/file
ssh -p 2220 -i /tmp/file bandit17@bandit.labs.overthewire.org

This sends us to the next level.

Password:
  1 -----BEGIN RSA PRIVATE KEY-----
  2 MIIEogIBAAKCAQEAvmOkuifmMg6HL2YPIOjon6iWfbp7c3jx34YkYWqUH57SUdyJ
  3 imZzeyGC0gtZPGujUSxiJSWI/oTqexh+cAMTSMlOJf7+BrJObArnxd9Y7YT2bRPQ
  4 Ja6Lzb558YW3FZl87ORiO+rW4LCDCNd2lUvLE/GL2GWyuKN0K5iCd5TbtJzEkQTu
  5 DSt2mcNn4rhAL+JFr56o4T6z8WWAW18BR6yGrMq7Q/kALHYW3OekePQAzL0VUYbW
  6 JGTi65CxbCnzc/w4+mqQyvmzpWtMAzJTzAzQxNbkR2MBGySxDLrjg0LWN6sK7wNX
  7 x0YVztz/zbIkPjfkU1jHS+9EbVNj+D1XFOJuaQIDAQABAoIBABagpxpM1aoLWfvD
  8 KHcj10nqcoBc4oE11aFYQwik7xfW+24pRNuDE6SFthOar69jp5RlLwD1NhPx3iBl
  9 J9nOM8OJ0VToum43UOS8YxF8WwhXriYGnc1sskbwpXOUDc9uX4+UESzH22P29ovd
 10 d8WErY0gPxun8pbJLmxkAtWNhpMvfe0050vk9TL5wqbu9AlbssgTcCXkMQnPw9nC
 11 YNN6DDP2lbcBrvgT9YCNL6C+ZKufD52yOQ9qOkwFTEQpjtF4uNtJom+asvlpmS8A
 12 vLY9r60wYSvmZhNqBUrj7lyCtXMIu1kkd4w7F77k+DjHoAXyxcUp1DGL51sOmama
 13 +TOWWgECgYEA8JtPxP0GRJ+IQkX262jM3dEIkza8ky5moIwUqYdsx0NxHgRRhORT
 14 8c8hAuRBb2G82so8vUHk/fur85OEfc9TncnCY2crpoqsghifKLxrLgtT+qDpfZnx
 15 SatLdt8GfQ85yA7hnWWJ2MxF3NaeSDm75Lsm+tBbAiyc9P2jGRNtMSkCgYEAypHd
 16 HCctNi/FwjulhttFx/rHYKhLidZDFYeiE/v45bN4yFm8x7R/b0iE7KaszX+Exdvt
 17 SghaTdcG0Knyw1bpJVyusavPzpaJMjdJ6tcFhVAbAjm7enCIvGCSx+X3l5SiWg0A
 18 R57hJglezIiVjv3aGwHwvlZvtszK6zV6oXFAu0ECgYAbjo46T4hyP5tJi93V5HDi
 19 Ttiek7xRVxUl+iU7rWkGAXFpMLFteQEsRr7PJ/lemmEY5eTDAFMLy9FL2m9oQWCg
 20 R8VdwSk8r9FGLS+9aKcV5PI/WEKlwgXinB3OhYimtiG2Cg5JCqIZFHxD6MjEGOiu
 21 L8ktHMPvodBwNsSBULpG0QKBgBAplTfC1HOnWiMGOU3KPwYWt0O6CdTkmJOmL8Ni
 22 blh9elyZ9FsGxsgtRBXRsqXuz7wtsQAgLHxbdLq/ZJQ7YfzOKU4ZxEnabvXnvWkU
 23 YOdjHdSOoKvDQNWu6ucyLRAWFuISeXw9a/9p7ftpxm0TSgyvmfLF2MIAEwyzRqaM
 24 77pBAoGAMmjmIJdjp+Ez8duyn3ieo36yrttF5NSsJLAbxFpdlc1gvtGCWW+9Cq0b
 25 dxviW8+TFVEBl1O4f7HVm6EpTscdDxU+bCXWkfjuRb7Dy9GOtt9JPsX8MBTakzh3
 26 vBgsyi/sN3RqRBcGU40fOoZyfAMT8s1m/uYv52O6IgeuZ/ujbjY=
 27 -----END RSA PRIVATE KEY-----

### Bandit 17
"There are 2 files in the homedirectory: passwords.old and 
passwords.new. The password for the next level is in passwords.new 
and is the only line that has been changed between passwords.old 
and passwords.new

NOTE: if you have solved this level and see ‘Byebye!’ when trying to 
log into bandit18, this is related to the next level, bandit19"

We need to use diff, of course

As a result, when entering lvl 18, we get Bye bye!

Password: x2gLTTjFwMOhQ8oWNbMN362QKxfRqGlO
### Bandit 18
"The password for the next level is stored in a file readme in the 
homedirectory. Unfortunately, someone has modified .bashrc to log 
you out when you log in with SSH."

-> This likely means that we'll need to use ssh to instead of 
jumping into the machine, simply reasing what's writen in readme

Indeed that was it:

ssh -p 2220 bandit18@bandit.labs.overthewire.org -i /home/bandit18/readme "cat readme"

ssh -i:
identity file

NOTE: See pic. This is why we are exiting (cat to .bashrc) :)
Other restrictions: pics

Password: cGWpMaKXVwDUNgPAVJbWYuGHVn9zl3j8
### Bandit 19
"To gain access to the next level, you should use the setuid binary in the 
homedirectory. Execute it without arguments to find out how to use it. 
The password for this level can be found in the usual place 
(/etc/bandit_pass), after you have used the setuid binary."

./bandit20-do cat /etc/bandit_pass/bandit20

Password: 0qXahG8ZjOVMN9Ghs7iOWsCfZyXOUbYO
### Bandit 20
"There is a setuid binary in the homedirectory that does the following: 
it makes a connection to localhost on the port you specify as a commandline 
argument. It then reads a line of text from the connection and compares it to 
the password in the previous level (bandit20). If the password is correct, it 
will transmit the password for the next level (bandit21)."

Did a nmap search with nmap localhost -p 1-65535
Got a list of open ports
One interesting result on
./suconnect 4321
Read: 100 phrack search daemon, type help for more information

I then tested that port out:

nc localhost 4321
Then I typed help

PIC

Then I found the pincode checker (port 30002):

PIC

I don't have the pin, only the password
Searching for pincode:

I found a HACKER - pic :D

This happened because of how we can jump into tmux.
They attached to my session, I think. Something along the lines of:
tmux list-sessions
tmux attach-session -t 0
Or even a while loop until someone falls in. :)
I finally did it.........
Had long conversations with an AI, but I finally figured it out.

PIC


Testing session attaching by myself and against myself.


Password: EeoULMCra2q0dSkYj561DX7s1CpBuOBt
### Bandit 21
"A program is running automatically at regular intervals from cron, 
the time-based job scheduler. Look in /etc/cron.d/ for the configuration 
and see what command is being executed."

We go to that cronjob and understand that reading permissions is
being given (every minute) to all users on a file that actually 
keeps the pass. So we just cat that specific file.

Password: tRae0UfB9v0UzbCdn9cY0gQnds9GF58Q
### Bandit 22
"A program is running automatically at regular intervals from cron, 
the time-based job scheduler. Look in /etc/cron.d/ for the configuration 
and see what command is being executed.

NOTE: Looking at shell scripts written by other people is a very 
useful skill. The script for this level is intentionally made easy 
to read. If you are having problems understanding what it does, t
ry executing it to see the debug information it prints."

Simple. Just read the code and find out where the pass is hidden.

Password: 0Zf11ioIjMVN551jX3CmStKLYqjk54Ga
### Bandit 23
"A program is running automatically at regular intervals from cron, 
the time-based job scheduler. Look in /etc/cron.d/ for the 
configuration and see what command is being executed.

NOTE: This level requires you to create your own first shell-script. 
This is a very big step and you should be proud of yourself 
when you beat this level!

NOTE 2: Keep in mind that your shell script is removed once 
executed, so you may want to keep a copy around…"


Password: gb8KRRCsshuZXI0tUuR6ypOFjiZbf3G8
### Bandit 24
"A daemon is listening on port 30002 and will give you the 
password for bandit25 if given the password for bandit24 and 
a secret numeric 4-digit pincode. There is no way to retrieve 
the pincode except by going through all of the 10000 combinations, 
called brute-forcing. 
You do not need to create new connections each time"

My solution:

#!/bin/bash
my_pass=gb8KRRCsshuZXI0tUuR6ypOFjiZbf3G8
{
        while :; do
                for i in $(seq -w 0000 9999); do
                        echo "$my_pass $i"
                done
        done
} | nc localhost 30002 2>/dev/null | grep -v "Wrong! Please enter the correct current password and pincode"


Password: iCi86ttT4KSNe1armKiwbQNmB3YJP3q4
### Bandit 25
"Logging in to bandit26 from bandit25 should be fairly easy… 
The shell for user bandit26 is not /bin/bash, but something else. 
Find out what it is, how it works and how to break out of it."

This was an unintuitive slog.
I get an ssh key to jump into bandit26.
I cat /etc/passwd and I get that user bandit26 has a specific
shell: /usr/bin/showtext
I open that and run that:

#!/bin/sh
export TERM=linux
exec more ~/text.txt
exit 0

more: cannot open /home/bandit25/text.txt: No such file or directory
So, now I know where the pass is. How do I use more to get that?

We can use -n 1 to, for example, load 1 line at a time.
Remember that we want to 'stop' more so that we can input commands.
So we use the SSH private key, and jump into the werver with 'more'

Either way, when inside we can:

type 'v' to get the vi editor.
Type
:e /etc/bandit_pass/bandit26
We can also open a shell session:
:set shell=/bin/bash
:shell

-> This grants us access to the shell inside bandit26.
So, to sum it up: 'more' is a pager and it displays one page at a time.
We can break it's process by forcing it to not fulfill what it's supposed
to do (not having a full page to print). Then we can insert commands
into it, for example, letting us use 'vi' in it, and then creating a 
shell for our own use.

In the man page we have several commands that we are told we can use
with 'vi' while more is running.
But remember: if there is only one page to be shown, the command
will have fulfilled its purpose after showing said page.

Password: s0773xxkk0MXfdqOfPRVr9L3jJBUOgCZ
### Bandit 26
"Good job getting a shell! Now hurry and grab the password for bandit27!"

The program bandit27-do lets us run commands as if we were the user of that level

So:

./bandit27-do cat /etc/bandit_pass/bandit27

Password: upsNCc7vzaRDx6oZC6GiR6ERwe1MowGB
### Bandit 27
"There is a git repository at ssh://bandit27-git@localhost/home/bandit27-git/repo 
via the port 2220. The password for the user bandit27-git is the same as for the 
user bandit27.

Clone the repository and find the password for the next level."

direct with:

git clone ssh://bandit27-git@localhost:PORT_NUMBER/home/bandit27-git/repo
(in /tmp, of course)

Password: Yz9IpL0sBcCeuG7m9uQFt8ZNpS4HZRcN
### Bandit 28
"There is a git repository at ssh://bandit28-git@localhost/home/bandit28-git/repo 
via the port 2220. The password for the user bandit28-git 
is the same as for the user bandit28.

Clone the repository and find the password for the next level."

Did a git log and checked a previous version, which had the pass

Password: 4pT1t5DENaYuqnqvadYs1oE4QLCdjmJ7
### Bandit 29
"There is a git repository at ssh://bandit29-git@localhost/home/bandit29-git/repo 
via the port 2220. The password for the user bandit29-git is the same as for 
the user bandit29.

Clone the repository and find the password for the next level."

-> Need to read the notes for bandit30
(place no passwords in production... that's sensible)

git branch -a (to see branches)

git checkout dev (pass here)

Password: qp30ex3VLz5MDG1n91YowTv4Q8l7CDZL
### Bandit 30
"There is a git repository at ssh://bandit30-git@localhost/home/bandit30-git/repo 
via the port 2220. The password for the user bandit30-git is the same as for 
the user bandit30."

git tag
(secret)
git show secret

Password: fb5S2xb7bRyFmAvQYQGEqsbhVyJqhnDy
### Bandit 31
"There is a git repository at ssh://bandit31-git@localhost/home/bandit31-git/repo 
via the port 2220. The password for the user bandit31-git is the same as for 
the user bandit31."

There is a .gitconfig file in the home directory.
I'm assuming this will have to be copied into my created cloned folder

We need to push some changes, removing the gitignore file

Password: 3O9RfhqyAlVBEZpVb6LYStshZoqoSx5K
### Bandit 32
"After all this git stuff, it’s time for another escape. Good luck!"

WELCOME TO THE UPPERCASE SHELL
>

...ok...

most letters: 1: permission denied
! : 2: syntax error: newline expected
/ tries to find stuff

I did $0
I'm basically invokind the shell itself.
The uppershel was running a restricted sh or bash underneath
So $0 told the shell to re-execute itself, without uppercase conversion.
And this got me into some sort of normal-ish shell.
I then grabed the pass from the usual folder.

Note: I could have executed the regular bash or sh with, for example:
bash

uppershell is a setuid binary owned by bandit33

This escape method led to privilege escalation.

Password: tQdtbs5D5i2vJwkO8mEyYEyTL8izoeJ0
### Bandit 33
"the end"
:D

**IDEA: OPEN THESE CHALLENGE BINARIES AND REVERSE ENGINEER IT**

