Notes

Narnia0

WIP

entry is done with the usual ssh access. Password and username are the same (narnia0).

We're presented with C code. A binary program will want us to basically overflow a variable and write exactly what is specified
I first tried to use strings and reead the contents of the binary. But since I have the original code, why bother?

I was having a hard time creating the correct text, in order to get the specific hex. I learned that I wasn't inputing in ASCII, but atually in UTF-8 (link).

So, I tried looking at tables of UTF-8 characters and have some correspondence beetween what I needed (in little endian). Seemingly, it's hard with my current layout, to have a 'DE'

Therefore I created a separate file, called key, in the /tmp folder, and try an feed that to my program.

So, I did thus:

printf "aaaaaaaaaaaaaaaaaaaa\xef\xbe\xad\xde" > /tmp/key

I then tried to open the file with this file as an input, but that didn't work:
./narnia0 < /tmp/key

[LINK](./Pics/narnia0_code)

This gave the correct result, but no upping my privileges. See here: Also pic of error:

[LINK](./Pics/narnia0_main_screen)

After all this I went to /etc/narnia_pass and got the password 'WDcYUTG5ul'.

Here's a pic of the C code:

[LINK](./Pics/narnia0_solution)
