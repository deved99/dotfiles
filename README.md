- [Overview](#orgd738075)
- [Ansible playbook](#org9beb268)
  - [preparations](#org0ffbad6)
  - [awesome](#org4c89016)
  - [menu](#org208c687)
  - [kitty](#orgc219d7d)
  - [emacs](#org47d073d)
  - [mpd](#orgdbe833a)



<a id="orgd738075"></a>

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


<a id="org9beb268"></a>

# Ansible playbook

The playbook is splitted into roles, each role dedicated to a program.

Planned roles:

-   Brave browser
-   shell configuration
-   Pipewire and Pulseaudio masking


<a id="org0ffbad6"></a>

## preparations

-   Add autojump


<a id="org4c89016"></a>

## awesome

-   Reload throws an error?


<a id="org208c687"></a>

## menu

-   Add the menuing part: right now it just install a dmenu script.
-   Theme rofi.


<a id="orgc219d7d"></a>

## kitty

In the end, this will be my backup


<a id="org47d073d"></a>

## emacs

-   Auto-tangle for org-files?
-   vterm with multiple instances and shell integration


<a id="orgdbe833a"></a>

## mpd

-   mpdscribble: why isn't it starting? Maybe it is waiting for mpd, which on start fails since ~/Music is not mounted?