- [Overview](#orgfd1613e)
- [Ansible playbook](#orgddd8962)
  - [preparations](#org71f9c3e)
  - [awesome](#orgb320e2c)
    - [Fix layouts mismatch](#org2f90b34)
  - [menu](#orgd995f8d)
  - [kitty](#org029bbac)
  - [emacs](#org41a212e)
  - [mpd](#orgf8f5c6f)



<a id="orgfd1613e"></a>

# Overview

This repo contains my dotfiles and an Ansible playbook.

My dotfiles are in the `files/` directory, which is structured like this:

```
files
├── awesome
│   ├── rc.lua
│   ├── rc.org
│   └── theme.lua
└── emacs
    ├── init.el
    └── init.org
```

Files ending with `.org` are [org](https://orgmode.org) files. These files can contain code blocks, which can be extracted using [Babel](https://orgmode.org/worg/org-contrib/babel/) to create the configuration files.

The Ansible playbook configures the machine and is further described in its section. I usually run it using the included `configure` script.


<a id="orgddd8962"></a>

# Ansible playbook

The playbook is splitted into roles, each role dedicated to a program.

Planned roles:

-   Brave browser
-   shell configuration
-   Pipewire and Pulseaudio masking


<a id="org71f9c3e"></a>

## preparations

-   Add autojump


<a id="orgb320e2c"></a>

## awesome

-   Rewrite configuration to literate programming
-   Reload throws an error?


<a id="org2f90b34"></a>

### TODO Fix layouts mismatch

On start, `awesomewm` uses the floating layout, probably due to tags being set before layouts.


<a id="orgd995f8d"></a>

## menu

-   Add the menuing part: right now it just install a dmenu script.
-   Theme rofi.


<a id="org029bbac"></a>

## kitty

-   In the end, this will be my backup


<a id="org41a212e"></a>

## emacs

-   Move to straight-el
-   Auto-tangle for org-files?
-   vterm with multiple instances and shell integration


<a id="orgf8f5c6f"></a>

## mpd

-   mpdscribble: why isn't it starting? Maybe it is waiting for mpd, which on start fails since ~/Music is not mounted
