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
;; [[[[file:~/.dotfiles/files/emacs/init.org::visual/keeparound][visual/keeparound]]][visual/keeparound]]
(setq scroll-margin 5
      scroll-conservatively 10000)
;; visual/keeparound ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::visual/fonts][visual/fonts]]][visual/fonts]]
(add-to-list 'default-frame-alist
             '(font . "JetBrains Mono 15")
             '(font . "Noto Color Emoji"))
;; visual/fonts ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::visual/theme][visual/theme]]][visual/theme]]
(use-package base16-theme
  :config
  (setq base16-distinct-fringe-background nil)
  (load (concat user-emacs-directory "base16-custom-theme.el"))
  (load-theme 'base16-custom t))
;; visual/theme ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::visual/modeline][visual/modeline]]][visual/modeline]]
(use-package all-the-icons)
(use-package doom-modeline
  :custom
  (doom-modeline-vcs-max-length 20)
  (doom-modeline-buffer-file-name-style 'buffer-name)
  (doom-modeline-buffer-encoding nil)
  :hook (after-init . doom-modeline-mode))
;; visual/modeline ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::*Summary][Summary]]][]]
(set-default 'truncate-lines t)
;; ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::*Summary][Summary]]][]]
(use-package visual-fill-column
    :hook ((org-mode . visual-fill-column-mode)
           (org-mode . (lambda () (setq truncate-lines nil)))
           (org-mode . visual-line-mode))
    :init (setq fill-column 100))
(use-package adaptive-wrap
    :hook (org-mode . adaptive-wrap-prefix-mode))
;; ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::visual/parenthesis][visual/parenthesis]]][visual/parenthesis]]
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode)
  :config
  (set-face-attribute 'rainbow-delimiters-unmatched-face nil
                      :foreground "red"
                      :inherit 'error
                      :box t))
;; visual/parenthesis ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::*Summary][Summary]]][]]
(use-package ivy
 :diminish
 :config (ivy-mode))
(use-package counsel
 :diminish
 :config (counsel-mode))
(use-package ivy-rich
 :diminish
 :config (ivy-rich-mode 1))
;; ends here
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
  (defun evil-next-line--check-visual-line-mode (orig-fun &rest args)
    (if visual-line-mode
        (apply 'evil-next-visual-line args)
      (apply orig-fun args)))
  
  (advice-add 'evil-next-line :around 'evil-next-line--check-visual-line-mode)
  
  (defun evil-previous-line--check-visual-line-mode (orig-fun &rest args)
    (if visual-line-mode
        (apply 'evil-previous-visual-line args)
      (apply orig-fun args)))
  
  (advice-add 'evil-previous-line
    :around 'evil-previous-line--check-visual-line-mode)
  :config (evil-mode 1))
;; evil/main ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::*Summary][Summary]]][]]
(use-package evil-collection
  :after evil
  :init (evil-collection-init))
;; ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::*Summary][Summary]]][]]
(use-package evil-org
  :hook (org-mode . evil-org-mode)
  :init (setq org-special-ctrl-a/e t)
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
  (setq undo-dir "/home/davide/.config/emacs/undo"
        undo-tree-history-directory-alist `(("." . ,undo-dir)))
  :config (global-undo-tree-mode))
;; evil/undo ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::*Summary][Summary]]][]]
(use-package org
  :init
  (setq org-hide-leading-stars t
        org-startup-folded t)
  :config
  (set-face-attribute 'org-block nil :extend t)
  (set-face-attribute 'org-block-begin-line nil :extend t))
;; ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::*Summary][Summary]]][]]
(use-package ox-gfm)
(setq org-export-backends '(html latex ox-gfm))
;; ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::*Summary][Summary]]][]]
(use-package org-appear
  :hook (org-mode . org-appear-mode)
  :init (setq org-hide-emphasis-markers t))
;; ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::*Summary][Summary]]][]]
(use-package org-fragtog
  :straight (:host github :repo "io12/org-fragtog")
  :hook (org-mode . org-fragtog-mode))
;; ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::*Summary][Summary]]][]]
(use-package org-superstar
   :init (setq org-superstar-remove-leading-stars t)
   :hook (org-mode . org-superstar-mode))
;; ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::*Summary][Summary]]][]]
(setq inhibit-startup-screen t
      initial-buffer-choice "~/current.org")
;; ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::*Summary][Summary]]][]]
(electric-pair-mode)
;; ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::*Summary][Summary]]][]]
(setq backup-dir (concat user-emacs-directory "backups")
      backup-directory-alist `(("." . ,backup-dir))
      auto-save-file-name-transforms `((".*" ,backup-dir t)))
;; ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::*Summary][Summary]]][]]
(setq-default indent-tabs-mode nil)
;; ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::*Summary][Summary]]][]]
(use-package rainbow-mode)
;; ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::*Summary][Summary]]][]]
(use-package php-mode)
(use-package rust-mode)
(use-package lua-mode)
(use-package json-mode)
(use-package yaml-mode)
(use-package dockerfile-mode)
;; ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::*Summary][Summary]]][]]
(use-package plantuml-mode
:init
(setq plantuml-executable-path "/usr/bin/plantuml"
      plantuml-default-exec-mode 'executable)
(add-to-list 'auto-mode-alist '("\\.plantuml\\'" . plantuml-mode))
;; Org-mode
(add-to-list 'org-src-lang-modes '("plantuml" . plantuml))
(org-babel-do-load-languages 'org-babel-load-languages '((plantuml . t))))
;; ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::*Summary][Summary]]][]]
(use-package markdown-mode
:mode ("README\\.md\\'" . gfm-mode)
:init (setq markdown-command "multimarkdown"))
(use-package edit-indirect)
;; ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::*Summary][Summary]]][]]
(setq vc-follow-symlinks t)
;; ends here
;; Summary:1 ends here
