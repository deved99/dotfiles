- [Overview](#org8a018f3)
- [Ansible playbook](#org6ad86fa)



<a id="org8a018f3"></a>

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

The Ansible playbook configures the machine and is further described in its section. I usually run it using `configure` from this repo.


<a id="org6ad86fa"></a>

# Ansible playbook

The playbook is splitted into roles, each role dedicated to a program.

Included roles:

-   **prepare**: installs some these packages:
    -   `rename`: a perl script to rename files.
    -   `whois`: checks information about a given IP or domain.
    -   `jq`: query and pretty print a json file.
-   **awesome**: this is installs and configures `awesome`. Configuration files are in `files/awesome`. Ansible also templates `colors.lua`, which sets the used colors.
-   **menu**: installs my menu system. Clones, builds, install and configures it. More details [here](https://github.com/deved99/menu).
-   **kitty**: the terminal I currently use. In the future I might use Emacs for the terminal and keep this as a backup.
-   **emacs**: the text editor, which is mainly used for:
    
    -   note taking and general writing, with Org mode.
    -   code editing
    
    In the future I might use it also for:
    
    -   mails
    -   remote editing
    -   RSS reader
    -   git interface
    -   zettelkasten
-   **mpd**: install a `mpd`, used for listening music, and `mpdscribble` used to track what I listen.

Planned roles:

-   Brave browser
-   Pipewire and Pulseaudio masking