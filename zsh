
timezsh - time the shell

exec zsh - restarts the shell

Movement:

Ctrl + a - move to the beginning of the line
Ctrl + e - move to the end of the line
Alt + F - to move the cursor forward one word
Alt + B - to move the cursor backward

editing:

Alt + w  - delete from the cursor to the begining of the line
Ctrl + k – delete from the cursor to the end of the line.

Ctrl + u – delete whole line
Ctrl + w – delete from the cursor to the start of the preceding word.

Alt + d – delete from the cursor to the end of the next word.

Ctrl + L – clear the terminal.



zsh vim mode / https://github.com/jeffreytse/zsh-vi-mode#insertion

Movement

$ : To the end of the line
^ : To the first non-blank character of the line
0 : To the first character of the line
w : [count] words forward
W : [count] WORDS forward
e : Forward to the end of word [count] inclusive
E : Forward to the end of WORD [count] inclusive
b : [count] words backward
B : [count] WORDS backward
t{char} : Till before [count]'th occurrence of {char} to the right
T{char} : Till before [count]'th occurrence of {char} to the left
f{char} : To [count]'th occurrence of {char} to the right
F{char} : To [count]'th occurrence of {char} to the left
; : Repeat latest f, t, F or T [count] times
, : Repeat latest f, t, F or T in opposite direction

Insertion

i : Insert text before the cursor
I : Insert text before the first character in the line
a : Append text after the cursor
A : Append text at the end of the line
o : Insert new command line below the current one
O : Insert new command line above the current one



copybuffer plugin - This plugin binds the ctrl-o keyboard shortcut to a command 
that copies the text that is currently typed in the command line ($BUFFER) to the system clipboard.

Dirhistory plugin this plugin adds keyboard shortcuts for navigating directory history and hierarchy.
Alt + Left	Go to previous directory
Alt + Right	Go to next directory
Alt + Up	Move into the parent directory
Alt + Down	Move into the first child directory by alphabetical order



JSON-TOOLS / https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/jsontools
# curl json data and pretty print the results
curl https://coderwall.com/bobwilliams.json | pp_json


SUDO 

Easily prefix your current or previous commands with sudo by pressing esc twice.
