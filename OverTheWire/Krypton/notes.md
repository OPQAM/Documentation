# Krypton Wargame, from OverTheWire

Host: krypton.labs.overthewire.org
Port: 2231
You can find the files for other levels in /krypton/

### Krypton 0
"Welcome to Krypton! The first level is easy. 
The following string encodes the password using Base64:

S1JZUFRPTklTR1JFQVQ="

base64 -d level0_pass

Password: KRYPTONISGREAT
### Krypton 1
"The password for level 2 is in the file ‘krypton2’. It is ‘encrypted’ using a simple rotation. 
It is also in non-standard ciphertext format. When using alpha characters for cipher text it 
is normal to group the letters into 5 letter clusters, regardless of word boundaries. 
This helps obfuscate any patterns. This file has kept the plain text word boundaries and 
carried them to the cipher text. Enjoy!"

YRIRY GJB CNFFJBEQ EBGGRA

Direct rotation gives:
LEVEL TWO PASSWORD ROTTEN

We could have used:
echo "YRIRY GJB CNFFJBEQ EBGGRA" | tr 'A-Za-z' 'N-ZA-Mn-za-m'


Password: ROTTEN
### Krypton 2
"ROT13 is a simple substitution cipher.

Substitution ciphers are a simple replacement algorithm. In this example of a substitution cipher, 
we will explore a ‘monoalphebetic’ cipher. Monoalphebetic means, literally, “one alphabet” 
and you will see why.
This level contains an old form of cipher called a ‘Caesar Cipher’. 
A Caesar cipher shifts the alphabet by a set number. For example:
plain:  a b c d e f g h i j k ...
cipher: G H I J K L M N O P Q ...
In this example, the letter ‘a’ in plaintext is replaced by a ‘G’ in the ciphertext so, 
for example, the plaintext ‘bad’ becomes ‘HGJ’ in ciphertext.
The password for level 3 is in the file krypton3. It is in 5 letter group ciphertext. 
It is encrypted with a Caesar Cipher. Without any further information, 
this cipher text may be difficult to break. You do not have direct access to the key, 
however you do have access to a program that will encrypt anything you wish to give it 
using the key. If you think logically, this is completely easy.
One shot can solve it!
Have fun."

The binary is enctrypting everything with a +12 rotation. So we'll want to rotate that back by -12, with:

echo "OMQEMDUEQMEK" | tr 'A-Z' 'O-ZA-N'

Password: CAESARISEASY
### Krypton 3
"Well done. You’ve moved past an easy substitution cipher.

The main weakness of a simple substitution cipher is repeated use of 
a simple key. In the previous exercise you were able to introduce arbitrary 
plaintext to expose the key. In this example, the cipher mechanism is not 
available to you, the attacker.

However, you have been lucky. You have intercepted more than one message. 
The password to the next level is found in the file ‘krypton4’. 
You have also found 3 other files. (found1, found2, found3)

You know the following important details:

The message plaintexts are in American English (*** very important) 
- They were produced from the same key (*** even better!)
Enjoy."

-> "Frequency Analysis" (letter counting)
Most frequent trigrams:
grep -o ... combined_cipher.txt | sort | uniq -c | sort -nr | head -10
(digrams with .. instead)
Found most frequent letter (.)
Changing file, swapping D for h
sed -i 's/D/h/g' combined_cipher
Collapsing, in vim, all empty spaces:
:%s/\s\+//g
Creating spaces around the word 'the':
sed 's/the/ the /g' filename
Repeated doubles in text:
grep -o '\([A-Z]\)\1' filename | sort | uniq -c | sort -nr

Password: BRUTE
### Krypton 4
"So far we have worked with simple substitution ciphers. 
They have also been ‘monoalphabetic’, meaning using a fixed key, 
and giving a one to one mapping of plaintext (P) to ciphertext (C). 
Another type of substitution cipher is referred to as ‘polyalphabetic’,
where one character of P may map to many, or all, possible 
ciphertext characters.

An example of a polyalphabetic cipher is called a Vigenère Cipher. 
It works like this:

If we use the key(K) ‘GOLD’, and P = PROCEED MEETING AS AGREED, 
then “add” P to K, we get C. When adding, if we exceed 25, then 
we roll to 0 (modulo 26).

P P R O C E E D M E E T I N G A S A G R E E D\
K G O L D G O L D G O L D G O L D G O L D G O\
becomes:

P 15 17 14 2 4 4 3 12 4 4 19 8 13 6 0 18 0 6 17 4 4 3\
K 6 14 11 3 6 14 11 3 6 14 11 3 6 14 11 3 6 14 11 3 6 14\
C 21 5 25 5 10 18 14 15 10 18 4 11 19 20 11 21 6 20 2 8 10 17\
So, we get a ciphertext of:

VFZFK SOPKS ELTUL VGUCH KR
This level is a Vigenère Cipher. You have intercepted two longer, 
english language messages (American English). 
You also have a key piece of information. You know the key length!

For this exercise, the key length is 6. 
The password to level five is in the usual place, 
encrypted with the 6 letter key."


sed '/^$/d' yourfile.txt | tr -d '[:space:]'
sed '/^$/d' yourfile.txt | tr -d '[:space:]' | fold -w 6
sed '/^$/d' yourfile.txt | tr -d '[:space:]' | fold -w 6 | xclip -selection clipboard

Make a column:
cat found2 >> found1
grep -v '^$' found1 | tr -d ' ' | fold -w 6 > baseline
fold -w 6 < found3 > baseline
Altogether:
grep -v '^$' found1 | tr -d ' ' | fold -w 6 | xclip -selection clipboard


---
Basic parser:

#!/bin/bash

for i in {1..6}; do
    echo "Position $i:"
    cut -c $i baseline | sort | uniq -c | sort -nr
done
---
see python script
---

Changing column in Vim (characterd D into h):
CTRL + V
(select column)
:
s/D/h/g

Password:
### Krypton 5
""


Password:
### Krypton 6
""
