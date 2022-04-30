- [Overview](#orga442aac)
- [Roles](#org4e981d5)
  - [misc-packages](#org0314559)
  - [awesome](#org7cc3e81)
  - [menu](#org1854fe6)
  - [kitty](#org054d61b)
  - [emacs](#org307a047)
  - [mpd](#org531ec67)



<a id="orga442aac"></a>

# Overview

This contains an Ansible playbook that deploys my configuration. Each role configure something specific, with each role to some degree indipendent of the other: you can see it as a module.


<a id="org4e981d5"></a>

# Roles

This section is kind of a todo-list.

Planned roles:

-   Brave browser
-   shell configuration
-   Pipewire and Pulseaudio masking


<a id="org0314559"></a>

## misc-packages

-   Add autojump


<a id="org7cc3e81"></a>

## awesome

-   Rewrite configuration to literate programming
-   Reload throws an error?


<a id="org1854fe6"></a>

## menu

-   Add the menuing part: right now it just install a dmenu script.
-   Theme rofi.


<a id="org054d61b"></a>

## kitty

-   In the end, this will be my backup


<a id="org307a047"></a>

## emacs

-   Move to straight-el
-   Auto-tangle for org-files?
-   vterm with multiple instances and shell integration


<a id="org531ec67"></a>

## mpd

-   mpdscribble: why isn't it starting? Maybe it is waiting for mpd, which on start fails since ~/Music is not mounted
