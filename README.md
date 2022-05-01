- [Overview](#org98e829d)
- [Ansible playbook](#org38dac77)
  - [preparations](#org5739b48)
  - [awesome](#org0aee80a)
  - [menu](#org01c0a17)
  - [kitty](#orgcbed480)
  - [emacs](#org072786c)
  - [mpd](#orgf9c3a17)



<a id="org98e829d"></a>

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


<a id="org38dac77"></a>

# Ansible playbook

The playbook is splitted into roles, each role dedicated to a program.

Planned roles:

-   Brave browser
-   shell configuration
-   Pipewire and Pulseaudio masking


<a id="org5739b48"></a>

## preparations

-   Add autojump


<a id="org0aee80a"></a>

## awesome

-   Rewrite configuration to literate programming
-   Reload throws an error?


<a id="org01c0a17"></a>

## menu

-   Add the menuing part: right now it just install a dmenu script.
-   Theme rofi.


<a id="orgcbed480"></a>

## kitty

-   In the end, this will be my backup


<a id="org072786c"></a>

## emacs

-   Move to straight-el
-   Auto-tangle for org-files?
-   vterm with multiple instances and shell integration


<a id="orgf9c3a17"></a>

## mpd

-   mpdscribble: why isn't it starting? Maybe it is waiting for mpd, which on start fails since ~/Music is not mounted