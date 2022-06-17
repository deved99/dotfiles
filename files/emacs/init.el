;; [[file:init.org::*Summary 🗂️][Summary 🗂️:1]]
;; [[[[file:~/.dotfiles/files/emacs/init.org::prepare/garbage-collection][prepare/garbage-collection]]][prepare/garbage-collection]]
(setq gc-cons-threshold 100000000)
;; prepare/garbage-collection ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::*Summary 🗂️][Summary 🗂️]]][]]
(setq package-enable-at-startup nil)
;; ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::*Summary 🗂️][Summary 🗂️]]][]]
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
;; [[[[file:~/.dotfiles/files/emacs/init.org::*Summary 🗂️][Summary 🗂️]]][]]
(straight-use-package 'use-package)
;; ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::*Summary 🗂️][Summary 🗂️]]][]]
(setq straight-use-package-by-default t)
;; ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::prepare/general.el][prepare/general.el]]][prepare/general.el]]
(use-package general
  :config
  (general-create-definer df/leader
    :keymaps '(normal)
    :prefix "SPC"
    :global-prefix "C-SPC")
  (df/leader "f" '(:ignore t :which-key "files"))
  (df/leader "fb" '(switch-to-buffer :which-key "Switch to buffer"))
  (df/leader "fB" '(ibuffer-list-buffers :which-key "Open window to manage buffers"))
  (df/leader "ff" '(find-file :which-key "Open file")))
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
(add-to-list 'default-frame-alist
             '(font . "Iosevka 17"))
;; ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::*Summary 🗂️][Summary 🗂️]]][]]
(set-fontset-font 
  t 'symbol (font-spec :family "Noto Color Emoji") nil 'prepend)
;; ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::visual/ligatures][visual/ligatures]]][visual/ligatures]]
(use-package ligature
  :straight (:host github :repo "mickeynp/ligature.el")
  :config
  (ligature-set-ligatures 't
   '("-->" "//" "<!--" ":=" "->>" "<<-" "->" "<-"
     "<=>" "==" "!=" "<=" ">=" "!==" "||" "..." ".."
     "|||" "///" "===" "++" "--" "=>" "|>" "<|" "||>" "<||"
     "|||>" "<|||" ">>" "<<" "::=" ":?" "!!" "?:" "?." "::"
     "+++" "??" ":::" ".?" "?=" "=!=" "<|>"
     ";;" "<<<" ">>>" "<==" "<==>" "==>" "=>>"
     "<~>" "<~~" "<~" "~~>" "~>" "<->" "^="))
  (global-ligature-mode t))
;; visual/ligatures ends here
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
;; [[[[file:~/.dotfiles/files/emacs/init.org::*Summary 🗂️][Summary 🗂️]]][]]
(set-default 'truncate-lines t)
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
;; [[[[file:~/.dotfiles/files/emacs/init.org::*Summary 🗂️][Summary 🗂️]]][]]
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
;; [[[[file:~/.dotfiles/files/emacs/init.org::*Summary 🗂️][Summary 🗂️]]][]]
(use-package evil-collection
  :after evil
  :init (evil-collection-init))
;; ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::*Summary 🗂️][Summary 🗂️]]][]]
(use-package evil-org
  :hook (org-mode . evil-org-mode)
  :init (setq org-special-ctrl-a/e t)
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
(use-package evil-indent-plus
  :after evil
  :init (evil-indent-plus-default-bindings))
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
  (setq undo-dir "/home/davide/.config/emacs/undo"
        undo-tree-history-directory-alist `(("." . ,undo-dir)))
  :config (global-undo-tree-mode))
;; evil/undo ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::*Summary 🗂️][Summary 🗂️]]][]]
(require 'org)
(setq org-ellipsis "▾"
      org-startup-folded t)
(df/leader "o" '(:ignore t :which-key "org-mode")
           "oo" 'counsel-outline
           "ob" 'org-babel-tangle
           "op" 'org-priority
           ; "oc" 'org-toggle-checkbox
           "ot" 'counsel-org-tag)
(set-face-attribute 'org-block nil :extend t)
(set-face-attribute 'org-block-begin-line nil :extend t)
(setq org-todo-keywords
      '("ACTIVE" "TODO" "NEXT" "WAIT" "|" "DONE" "CANC"))
(set-face-attribute 'org-todo nil
  :weight 'normal
  :foreground (plist-get base16-custom-colors :base07)
  :background (plist-get base16-custom-colors :base08))
(set-face-attribute 'org-done nil
  :weight 'normal
  :foreground (plist-get base16-custom-colors :base07)
  :background (plist-get base16-custom-colors :base0B))
(setq org-tag-alist '(("@w") ("@h") ("@t") ("idea")))
(setq org-tags-column 0)
(set-face-attribute 'org-tag nil
  :foreground (plist-get base16-custom-colors :base02))
(require 'org-tempo)
(add-to-list 'org-structure-template-alist '("el" . "src elisp"))
(add-to-list 'org-structure-template-alist '("sh" . "src bash"))
(add-to-list 'org-structure-template-alist '("py" . "src python"))
;; ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::*Summary 🗂️][Summary 🗂️]]][]]
(use-package ox-gfm)
(setq org-export-backends '(html latex ox-gfm))
;; ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::*Summary 🗂️][Summary 🗂️]]][]]
(defun df/org-mode-beautify ()
  (setq visual-fill-column-width 100
        visual-fill-column-center-text t
        truncate-lines nil)
  (mixed-pitch-mode t)
  (org-appear-mode t)
  (org-superstar-mode t)
  (visual-line-mode t)
  (adaptive-wrap-prefix-mode t)
  (visual-fill-column-mode t))
(use-package mixed-pitch
  :config
  (set-face-attribute 'variable-pitch nil :family "Iosevka Aile")
  (add-to-list 'mixed-pitch-fixed-pitch-faces 'org-todo)
  (add-to-list 'mixed-pitch-fixed-pitch-faces 'org-done))
(use-package visual-fill-column)
(use-package adaptive-wrap)
(use-package org-superstar
   :init (setq org-superstar-remove-leading-stars t)
   :hook (org-mode . org-superstar-mode))
(use-package org-appear
  :init (setq org-hide-emphasis-markers t))
(add-hook 'org-mode-hook 'df/org-mode-beautify)
;; ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::programming/eglot][programming/eglot]]][programming/eglot]]
(use-package eglot)
(df/leader "p" '(:ignore t :which-key "LSP")
           "pr" 'eglot-rename
           "pc" 'flymake-show-buffer-diagnostics)
;; programming/eglot ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::programming/company][programming/company]]][programming/company]]
(use-package company
  :hook ((after-init . global-company-mode)
         (prog-mode . (lambda () (setq-local company-idle-delay 0.4))))
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
(use-package php-mode)
(use-package rust-mode)
(use-package lua-mode)
(use-package json-mode)
(use-package yaml-mode)
(use-package dockerfile-mode)
;; ends here
;; [[[[file:~/.dotfiles/files/emacs/init.org::*Summary 🗂️][Summary 🗂️]]][]]
(use-package plantuml-mode
:init
(setq plantuml-executable-path "/usr/bin/plantuml"
      plantuml-default-exec-mode 'executable)
(add-to-list 'auto-mode-alist '("\\.plantuml\\'" . plantuml-mode))
;; Org-mode
(add-to-list 'org-src-lang-modes '("plantuml" . plantuml))
(org-babel-do-load-languages 'org-babel-load-languages '((plantuml . t))))
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
