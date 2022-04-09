(setq gc-cons-threshold 100000000)

(require 'package) (setq package-enable-at-startup nil)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package-ensure)
(setq use-package-always-ensure t)

(add-hook 'emacs-startup-hook
  (lambda ()
    (message "Emacs ready in %s with %d garbage collections."
      (format "%.2f seconds"
        (float-time
	  (time-subtract after-init-time before-init-time)))
       gcs-done)))

(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(tooltip-mode 0)

(fringe-mode 10)

(set-default 'truncate-lines t)

(setq scroll-margin 5
      scroll-conservatively 10000)

(add-to-list 'default-frame-alist
	     '(font . "JetBrains Mono 15"))
(set-fontset-font t 'symbol "Noto Color Emoji" nil 'append)

(use-package base16-theme
  :config
  (setq base16-distinct-fringe-background nil)
  (load-theme 'base16-dracula t))

(use-package highlight-indent-guides
  :hook (prog-mode . highlight-indent-guides-mode)
  :config
  (setq highlight-indent-guides-method 'column))
(use-package rainbow-mode)

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

(setq org-export-backends '(html latex ox-gfm))

(setq org-hide-leading-stars t
      org-startup-folded t)

(use-package ox-gfm)

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

(use-package evil-collection
  :after evil
  :init (evil-collection-init))

(use-package evil-surround
  :after evil
  :config (global-evil-surround-mode 1))

(use-package evil-commentary
  :after evil
  :config (evil-commentary-mode))

(use-package evil-indent-plus
  :after evil
  :init (evil-indent-plus-default-bindings))

(use-package undo-tree
;; :init
;; (setq undo-tree-auto-save-history (concat user-emacs-directory "undo"))
:config (global-undo-tree-mode))

(use-package lsp-mode
:hook prog-mode
:init (setq lsp-headerline-breadcrumb-enable nil)
(setq lsp-diagnostics-mode ":none"))

(use-package lsp-ui
  :config
(setq lsp-ui-doc-enable nil
      lsp-ui-sideline-show-code-actions nil)
(setq lsp-ui-sideline-show-hover t
      lsp-ui-sideline-delay 1))

(use-package company
  :hook (lsp-mode . company-mode)
:config
(setq company-selection-wrap-around t)
(company-tng-configure-default))

(use-package magit)

(setq inhibit-startup-screen t
      initial-buffer-choice "~/current.org")

(electric-pair-mode)

(setq backup-dir (concat user-emacs-directory "backups")
      backup-directory-alist `(("." . ,backup-dir))
      auto-save-file-name-transforms `((".*", backup-dir t)))

(setq-default indent-tabs-mode nil)

(use-package lsp-pyright
:hook (python-mode . (lambda ()
			(require 'lsp-pyright)
			(lsp))))

(use-package rust-mode
  :hook (rust-mode . lsp))

(use-package json-mode)
(use-package yaml-mode)
(use-package dockerfile-mode)
