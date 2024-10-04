#Notes on Leviathan Game
 
ssh -p 2223 leviathan0@leviathan.labs.overthewire.org

"Data for the levels can be found in the homedirectories. 
You can look at /etc/leviathan_pass for the various level passwords."
(all levels have the following text: "There is no information for this level, intentionally.")

### Leviathan 0
There is a weird folder called .backup. And inside a bookmarks.html.
I first checked all text with sed:
sed 's/<[^>]*>//g' bookmarks.html | less

Then I opened with vi and searched for 'leviathan'
The password is in plain sight


Password: 3QJ3TgzHDq
### Leviathan 1
-r-sr-x---  1 leviathan2 leviathan1 15080 Sep 19 07:07 check*

I did: 
strings check

It looks like some sort of password checker.
I'm tempted to disassemble it.

Disassembling. Entered gdb and did disassemble main
A bit too much for me atm.

I tried:
ltrace ./check
(could also use strace)


'sex' got me into a limited shell. I then went to the password folder and cat the file

ltrace:
ltrace is a debugging utility that intercepts and records dynamic library calls 
made by a program. It's extremely useful for understanding how a program interacts 
with libraries without needing to analyze the assembly code.
strace:
strace is similar to ltrace, but it traces system calls and signals. 
It's useful for seeing how a program interacts with the operating system.

Password: NsN1HwFoyN
### Leviathan 2
-r-sr-x---  1 leviathan3 leviathan2 15068 Sep 19 07:07 printfile*

Testing out strings, ltrace and strace

It requires an injection of two requests, instead of one.
The program has no inner controls. It uses a system() call which is vulnerable.
In the end, I created a file called "my;file" and a symbolic link called file
that was pointing towards the actual password file. This resulted in:

leviathan2@gibson:/tmp/myzone$ ./printfile "my;file"
/bin/cat: my: No such file or directory
/tmp/file: 1: qEs5Io5yM8: Permission denied


Glitch?

I then used an empty space and then it worked, giving me a different password...

(Heavy stuff...wtf -> could I have caught this mid cycling?)
Password: qEs5Io5yM8
Passowrd: f0n8h2iWLP
### Leviathan 3
Same as Leviathan 1. Run the program twice..

Password: WG1egElCvO
### Leviathan 4
Erm.. just a binary when we run the bin program. Converting to ASCII returns pass

Password: 0dyxT7F4QD
### Leviathan 5
This one is looking for a specific log file. And when it has it:
$ ltrace ./leviathan5 
__libc_start_main(0x804910d, 1, 0xffffd344, 0 <unfinished ...>
fopen("/tmp/file.log", "r")                                                 = 0x804d1a0
fgetc(0x804d1a0)                                                            = '\377'
feof(0x804d1a0)                                                             = 1
fclose(0x804d1a0)                                                           = 0
getuid()                                                                    = 12005
setuid(12005)                                                               = 0
unlink("/tmp/file.log")                                                     = 0
+++ exited (status 0) +++

- I created the file but as a symbolic link to the password I wanted.

Password: szo7HDB88w
### Leviathan 6

Asking for a 4 digit code.
I guess I could bruteforce this... but do I need to?
I bruteforced it as gdb was kicking me (note to self: get more debugging practice)
-> I have now disassembled it with radare2 (partially) and gdb
Showcase this

"Ah, even when I set the correct value into gdb (7123, the correct password) and I 
get the shell, I'm still not with privileged escalation. Very interesting.
ChatGPT said:
ChatGPT
Absolutely, it’s a fascinating aspect of how security is handled in modern operating systems! 
Even if you successfully provide the correct input (like the correct PIN) and get 
to the point where the program launches a shell, the protections in place will 
still prevent that shell from having escalated privileges if you invoked the 
program in a debugging context. Here are a few additional points to consider:"
-> Explain/Show this(!)

Password: qEs5Io5yM8
### Leviathan 7
Well Done, you seem to have used a *nix system before, now try something more serious.
(Please don't post writeups, solutions or spoilers about the games on the web. Thank you!)
