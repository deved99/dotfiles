;; [[file:init.org::*Summary][Summary:1]]
;; [[[[file:~/.dotfiles/files/emacs/init.org::prepare/garbage-collection][prepare/garbage-collection]]][prepare/garbage-collection]]
(setq gc-cons-threshold 100000000)
;; prepare/garbage-collection ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::*Summary][Summary]]][]]
(setq package-enable-at-startup nil)
;; ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::*Summary][Summary]]][]]
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
;; ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::*Summary][Summary]]][]]
(straight-use-package 'use-package)
;; ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::*Summary][Summary]]][]]
(setq straight-use-package-by-default t)
;; ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::prepare/startup-time][prepare/startup-time]]][prepare/startup-time]]
(add-hook 'emacs-startup-hook
  (lambda ()
    (message "Emacs ready in %s with %d garbage collections."
      (format "%.2f seconds"
        (float-time
	  (time-subtract after-init-time before-init-time)))
       gcs-done)))
;; prepare/startup-time ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::*Summary][Summary]]][]]
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(tooltip-mode 0)
;; ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::*Summary][Summary]]][]]
(fringe-mode 10)
;; ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::*Summary][Summary]]][]]
(set-default 'truncate-lines t)
;; ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::visual/keeparound][visual/keeparound]]][visual/keeparound]]
(setq scroll-margin 5
      scroll-conservatively 10000)
;; visual/keeparound ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::visual/fonts][visual/fonts]]][visual/fonts]]
(add-to-list 'default-frame-alist
	     '(font . "JetBrains Mono 15"))
(set-fontset-font t 'symbol "Noto Color Emoji" nil 'append)
;; visual/fonts ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::visual/theme][visual/theme]]][visual/theme]]
(use-package base16-theme
  :config
  (setq base16-distinct-fringe-background nil)
  (load-theme 'base16-google-dark t))
;; visual/theme ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::visual/modeline][visual/modeline]]][visual/modeline]]
(defun get_current_state ()
  (cond
   ((eq evil-state 'normal) "NORMAL")
   ((eq evil-state 'insert) "INSERT")
   ((eq evil-state 'visual) "VISUAL")
   ((eq evil-state 'operator) "OPERATOR")
   ((eq evil-state 'replace) "REPLACE")
   ((eq evil-state 'emacs) "EMACS")
   (t "NOT_FOUND")))
(defun is_modified ()
  (cond
   ((buffer-modified-p) "+")
   ((buffer-read-only) "O")
   (t " ")))
(setq-default mode-line-format
	      (list
	       " "
	       '(:eval (get_current_state))
	       " | %b"
	       '(:eval (is_modified))
	       " (%m)"))
;; visual/modeline ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::evil/main][evil/main]]][evil/main]]
(use-package evil
  :after undo-tree
  :init
  (require 'undo-tree)
  (setq evil-undo-system 'undo-tree)
  (setq evil-undo-function 'undo-tree-undo)
  (setq evil-redo-function 'undo-tree-redo)
  (setq evil-want-keybinding nil
        evil-want-integration t)
  (setq evil-echo-state nil)
  :config (evil-mode 1))
;; evil/main ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::*Summary][Summary]]][]]
(use-package evil-collection
  :after evil
  :init (evil-collection-init))
;; ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::*Summary][Summary]]][]]
(use-package evil-org
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))
;; ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::*Summary][Summary]]][]]
(use-package evil-surround
  :after evil
  :config (global-evil-surround-mode 1))
;; ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::*Summary][Summary]]][]]
(use-package evil-commentary
  :after evil
  :config (evil-commentary-mode))
;; ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::*Summary][Summary]]][]]
(use-package evil-indent-plus
  :after evil
  :init (evil-indent-plus-default-bindings))
;; ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::*Summary][Summary]]][]]
(use-package evil-numbers
  :after evil
  :config
  (evil-define-key '(normal visual) 'global (kbd "SPC +") 'evil-numbers/inc-at-pt)
  (evil-define-key '(normal visual) 'global (kbd "SPC -") 'evil-numbers/dec-at-pt))
;; ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::evil/undo][evil/undo]]][evil/undo]]
(use-package undo-tree
  :init
  ;; (setq undo-tree-auto-save-history (concat user-emacs-directory "undo"))
  :config (global-undo-tree-mode))
;; evil/undo ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::*Summary][Summary]]][]]
(use-package org
  :after evil-org
  :config (add-hook 'org-mode-hook 'evil-org-mode))
;; ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::*Summary][Summary]]][]]
(use-package ox-gfm)
(setq org-export-backends '(html latex ox-gfm))
;; ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::*Summary][Summary]]][]]
(setq org-hide-leading-stars t
      org-startup-folded t)
;; ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::misc/startup-file][misc/startup-file]]][misc/startup-file]]
(setq inhibit-startup-screen t
      initial-buffer-choice "~/current.org")
;; misc/startup-file ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::misc/autoclose-parenthesis][misc/autoclose-parenthesis]]][misc/autoclose-parenthesis]]
(electric-pair-mode)
;; misc/autoclose-parenthesis ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::misc/backup-files][misc/backup-files]]][misc/backup-files]]
(setq backup-dir (concat user-emacs-directory "backups")
      backup-directory-alist `(("." . ,backup-dir))
      auto-save-file-name-transforms `((".*", backup-dir t)))
;; misc/backup-files ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::misc/expandtab][misc/expandtab]]][misc/expandtab]]
(setq-default indent-tabs-mode nil)
;; misc/expandtab ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::misc/rainbow-mode][misc/rainbow-mode]]][misc/rainbow-mode]]
(use-package rainbow-mode)
;; misc/rainbow-mode ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::misc/filetypes][misc/filetypes]]][misc/filetypes]]
(use-package rust-mode)
(use-package lua-mode)
(use-package json-mode)
(use-package yaml-mode)
(use-package dockerfile-mode)
;; misc/filetypes ends here
;; Summary:1 ends here
