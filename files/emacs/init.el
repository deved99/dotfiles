;; [[file:init.org::*Summary 🗂️][Summary 🗂️:1]]
;; [[[[file:~/.dotfiles/files/emacs/init.org::prepare/garbage-collection][prepare/garbage-collection]]][prepare/garbage-collection]]
(setq gc-cons-threshold 100000000)
;; prepare/garbage-collection ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::*Summary 🗂️][Summary 🗂️]]][]]
'(warning-suppress-types '((comp)))
;; ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::prepare/exec-path][prepare/exec-path]]][prepare/exec-path]]
(add-to-list 'exec-path "~/.local/bin")
(add-to-list 'exec-path "~/.cargo/bin")
;; prepare/exec-path ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::*Summary 🗂️][Summary 🗂️]]][]]
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::*Summary 🗂️][Summary 🗂️]]][]]
(eval-when-compile
  (unless (package-installed-p 'use-package)
      (package-refresh-contents)
      (package-install 'use-package))
  (require 'use-package))
;; ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::*Summary 🗂️][Summary 🗂️]]][]]
(require 'use-package-ensure)
(setq use-package-always-ensure t)
;; ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::prepare/general.el][prepare/general.el]]][prepare/general.el]]
(use-package general
  :config
  (general-evil-setup)
  (general-create-definer df/leader
    :keymaps '(normal)
    :prefix "SPC"
    :global-prefix "C-SPC")
  ;; [[[[file:~/.dotfiles/files/emacs/init.org::prepare/general.el][prepare/general.el]]][]]
  (df/leader "f" '(:ignore t :which-key "files")
             "fb" '(switch-to-buffer :which-key "Switch to buffer")
             "fB" '(ibuffer :which-key "Open window to manage buffers")
             "ff" '(find-file :which-key "Open file")
             "e" 'make-frame-command)
  ;; ends here
)
;; prepare/general.el ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::prepare/startup-time][prepare/startup-time]]][prepare/startup-time]]
(add-hook 'emacs-startup-hook
  (lambda ()
    (message "Emacs ready in %s with %d garbage collections."
      (format "%.2f seconds"
        (float-time
	  (time-subtract after-init-time before-init-time)))
       gcs-done)))
;; prepare/startup-time ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::*Summary 🗂️][Summary 🗂️]]][]]
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(tooltip-mode 0)
;; ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::*Summary 🗂️][Summary 🗂️]]][]]
(fringe-mode 10)
;; ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::visual/keeparound][visual/keeparound]]][visual/keeparound]]
(setq scroll-margin 5
      scroll-conservatively 10000)
;; visual/keeparound ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::*Summary 🗂️][Summary 🗂️]]][]]
(set-fontset-font 
  t 'symbol (font-spec :family "Noto Color Emoji") nil 'prepend)
;; ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::*Summary 🗂️][Summary 🗂️]]][]]
(set-face-attribute 'fixed-pitch nil
  :font (font-spec :family "Fira Code"))
;; ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::visual/theme][visual/theme]]][visual/theme]]
(if (file-exists-p (concat user-emacs-directory "theme.el"))
    (load-file (concat user-emacs-directory "theme.el"))
    (load-theme 'modus-vivendi t))
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
;; [[[[file:~/.dotfiles/files/emacs/init.org::visual/parenthesis][visual/parenthesis]]][visual/parenthesis]]
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode)
  :config
  (set-face-attribute 'rainbow-delimiters-unmatched-face nil
                      :foreground "red"
                      :inherit 'error
                      :box t))
;; visual/parenthesis ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::interface/vertico][interface/vertico]]][interface/vertico]]
(use-package vertico
  :config (vertico-mode))
;; [[[[file:~/.dotfiles/files/emacs/init.org::interface/vertico][interface/vertico]]][]]
(use-package orderless
  :custom (completion-styles '(orderless basic)))
;; ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::interface/vertico][interface/vertico]]][]]
(use-package marginalia
  :config (marginalia-mode))
;; ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::interface/vertico][interface/vertico]]][]]
(use-package consult
  :config (df/leader "i" 'consult-outline))
;; ends here
;; interface/vertico ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::interface/which-key][interface/which-key]]][interface/which-key]]
(use-package which-key
  :custom
  (which-key-delay 2)
  :config (which-key-mode))
;; interface/which-key ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::evil/main][evil/main]]][evil/main]]
(use-package evil
  :after undo-tree
  :init
  ;; [[[[file:~/.dotfiles/files/emacs/init.org::evil/main][evil/main]]][]]
  (require 'undo-tree)
  (setq evil-undo-system 'undo-tree)
  (setq evil-undo-function 'undo-tree-undo)
  (setq evil-redo-function 'undo-tree-redo)
  ;; ends here
  ;; [[[[file:~/.dotfiles/files/emacs/init.org::evil/main][evil/main]]][]]
  (setq evil-want-keybinding nil
        evil-want-integration t)
  ;; ends here
  ;; [[[[file:~/.dotfiles/files/emacs/init.org::evil/main][evil/main]]][]]
  (setq evil-echo-state nil)
  ;; ends here
  ;; [[[[file:~/.dotfiles/files/emacs/init.org::evil/main][evil/main]]][]]
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
  ;; ends here
  :config (evil-mode 1))
;; evil/main ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::*Summary 🗂️][Summary 🗂️]]][]]
(use-package evil-collection
  :after evil
  :init (evil-collection-init))
;; ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::*Summary 🗂️][Summary 🗂️]]][]]
(use-package evil-org
  :hook (org-mode . evil-org-mode)
  :custom
  (org-special-ctrl-a/e t)
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))
;; ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::*Summary 🗂️][Summary 🗂️]]][]]
(use-package evil-surround
  :after evil
  :config (global-evil-surround-mode 1))
;; ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::*Summary 🗂️][Summary 🗂️]]][]]
(use-package evil-commentary
  :after evil
  :config (evil-commentary-mode))
;; ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::*Summary 🗂️][Summary 🗂️]]][]]
(use-package evil-numbers
  :after evil
  :config
  (evil-define-key '(normal visual) 'global (kbd "SPC +") 'evil-numbers/inc-at-pt)
  (evil-define-key '(normal visual) 'global (kbd "SPC -") 'evil-numbers/dec-at-pt))
;; ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::evil/undo][evil/undo]]][evil/undo]]
(use-package undo-tree
  :init
  ;; [[[[file:~/.dotfiles/files/emacs/init.org::evil/undo][evil/undo]]][]]
  (setq undo-dir "/home/davide/.config/emacs/undo/"
        undo-tree-history-directory-alist `(("." . ,undo-dir)))
  ;; ends here
  ;; [[[[file:~/.dotfiles/files/emacs/init.org::evil/undo][evil/undo]]][]]
  (df/leader "u" 'undo-tree-visualize)
  ;; ends here
  :config (global-undo-tree-mode))
;; evil/undo ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::note-taking][note-taking]]][note-taking]]
(use-package org
  :custom
  ;; [[[[file:~/.dotfiles/files/emacs/init.org::note-taking][note-taking]]][]]
  (org-ellipsis " ▾")
  (org-startup-folded t)
  (org-highlight-latex-and-related '(native))
  ;; ends here
  ;; [[[[file:~/.dotfiles/files/emacs/init.org::note-taking][note-taking]]][]]
  (org-todo-keywords '("ACTIVE" "NEXT" "TODO" "|" "WAIT" "DONE" "CANC"))
  (org-tag-alist '(("@w") ("@h") ("@t") ("idea")))
  (org-tags-column 0)
  ;; ends here
  :init
  ;; [[[[file:~/.dotfiles/files/emacs/init.org::note-taking][note-taking]]][]]
  (df/leader "o" '(:ignore t :which-key "org-mode")
             "oo" 'org-open-at-point
             "ob" 'org-babel-tangle
             "oe" 'org-export-dispatch
             ; "oc" 'org-toggle-checkbox
             "op" 'org-priority
             "od" '(:ignore t :which-key "date")
             "odc" 'org-time-stamp
             "ods" 'org-schedule
             "odd" 'org-deadline)
  ;; ends here
  ;; :straight (:type built-in)
  :pin manual)
;; [[[[file:~/.dotfiles/files/emacs/init.org::note-taking][note-taking]]][]]
(use-package org-tempo
  :ensure org
  ;; :straight (:type built-in)
  :config
  (add-to-list 'org-structure-template-alist '("caddy" . "src caddy"))
  (add-to-list 'org-structure-template-alist '("el" . "src elisp"))
  (add-to-list 'org-structure-template-alist '("md" . "src markdown"))
  (add-to-list 'org-structure-template-alist '("py" . "src python"))
  (add-to-list 'org-structure-template-alist '("rs" . "src rust"))
  (add-to-list 'org-structure-template-alist '("sh" . "src bash"))
  (add-to-list 'org-structure-template-alist '("sql" . "src sql"))
  (add-to-list 'org-structure-template-alist '("yml" . "src yaml")))
;; ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::note-taking][note-taking]]][]]
(use-package ox-gfm
  :config 
  (setq org-export-backends '(html latex ox-gfm)))
;; ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::note-taking][note-taking]]][]]
(use-package visual-fill-column
  :custom
  (visual-fill-column-width 140)
  (visual-fill-column-center-text t)
  (truncate-lines nil))
(use-package adaptive-wrap)
;; ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::note-taking][note-taking]]][]]
(use-package org-superstar
   :init (setq org-superstar-remove-leading-stars t))
;; ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::note-taking][note-taking]]][]]
(use-package org-appear
  :custom ((org-hide-emphasis-markers t)
           (org-appear-autolinks t)))
;; ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::note-taking][note-taking]]][]]
(use-package org-fragtog
  :custom
  (org-startup-with-latex-preview t)
  (org-latex-preview-ltxpng-directory (concat user-emacs-directory "ltximg/")))
;; ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::note-taking][note-taking]]][]]
(defun df/org-mode-beautify ()
  ;; set some faces
  ;; [[[[file:~/.dotfiles/files/emacs/init.org::note-taking][note-taking]]][]]
  (set-face-attribute 'org-block-begin-line nil 
    :background nil
    :inherit 'font-lock-comment-face)
  ;; ends here
  ;; [[[[file:~/.dotfiles/files/emacs/init.org::note-taking][note-taking]]][]]
  (add-to-list 'org-src-block-faces '("latex" (:inherit default :extend t)))
  ;; ends here
  ;; change symbol appearence
  (org-appear-mode t)
  (org-superstar-mode t)
  (org-fragtog-mode t)
  ;; Limit buffer width, center eventually.
  (visual-line-mode t)
  (adaptive-wrap-prefix-mode t)
  (visual-fill-column-mode t))
(add-hook 'org-mode-hook 'df/org-mode-beautify)
;; ends here
;; note-taking ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::note-taking/roam][note-taking/roam]]][note-taking/roam]]
(use-package org-roam
  :hook (org-roam-capture-new-node . (lambda () (org-roam-tag-add '("draft"))))
  :config
  (org-roam-db-autosync-mode)
  (df/leader "w" '(:ignore t :which-key "wiki")
             "ww" 'org-roam-node-find
             "wt" 'org-roam-tag-add)
  :custom
  (org-roam-node-display-template (concat "${title:*}" (propertize "${tags:20}" 'face 'org-tag)))
  (org-roam-directory "~/Notes/wiki")
  (org-roam-completion-everywhere t))

;; note-taking/roam ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::*Summary 🗂️][Summary 🗂️]]][]]
(use-package lsp-mode
 :config (df/leader "l" lsp-command-map)
 :custom
 (lsp-headerline-breadcrumb-enable nil)
 (lsp-file-watch-threshold nil))
;; ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::*Summary 🗂️][Summary 🗂️]]][]]
(use-package lsp-pyright
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp-deferred))))
;; ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::*Summary 🗂️][Summary 🗂️]]][]]
(use-package python-black
  :hook (python-mode . python-black-on-save-mode-enable-dwim))
;; ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::*Summary 🗂️][Summary 🗂️]]][]]
(use-package rustic
  :config
  (setq rustic-format-on-save t
        rustic-rustfmt-args "--edition 2021"))
;; ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::programming/company][programming/company]]][programming/company]]
(use-package company
  :hook (after-init . global-company-mode)
  :general
  (general-imap "C-n" 'company-select-next
                "C-p" 'company-select-previous)
  :config
  (setq company-selection-wrap-around t
        company-minimum-prefix-length 1
        company-idle-delay nil)
  (company-tng-configure-default))
(use-package company-box
  :hook (company-mode . company-box-mode))
;; programming/company ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::programming/magit][programming/magit]]][programming/magit]]
(use-package magit
  :config (df/leader "g" 'magit))
;; programming/magit ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::*Summary 🗂️][Summary 🗂️]]][]]
(setq inhibit-startup-screen t
      initial-buffer-choice "~/current.org")
;; ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::*Summary 🗂️][Summary 🗂️]]][]]
(electric-pair-mode)
(add-hook 'org-mode-hook (lambda ()
         (setq-local electric-pair-inhibit-predicate
                 `(lambda (c)
                (if (char-equal c ?<) t (,electric-pair-inhibit-predicate c))))))
;; ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::*Summary 🗂️][Summary 🗂️]]][]]
(setq backup-dir (concat user-emacs-directory "backups")
      backup-directory-alist `(("." . ,backup-dir))
      auto-save-file-name-transforms `((".*" ,backup-dir t)))
;; ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::*Summary 🗂️][Summary 🗂️]]][]]
(setq-default indent-tabs-mode nil)
;; ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::*Summary 🗂️][Summary 🗂️]]][]]
(use-package rainbow-mode)
;; ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::*Summary 🗂️][Summary 🗂️]]][]]
(use-package haskell-mode)
(use-package php-mode)
(use-package nix-mode)
(use-package jinja2-mode)
(use-package lua-mode)
(use-package json-mode)
(use-package yaml-mode)
(use-package dockerfile-mode)
;; ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::*Summary 🗂️][Summary 🗂️]]][]]
(use-package markdown-mode
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown"))
(use-package edit-indirect)
;; ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::*Summary 🗂️][Summary 🗂️]]][]]
(setq vc-follow-symlinks t)
;; ends here
;; Summary 🗂️:1 ends here
