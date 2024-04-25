;; ;; minibuffer
;; ;; (use-package vertico
;; ;;   :custom (vertico-count 10   ; Maximal number of candidates to show.
;; ;;                          vertico-count-format nil
;; ;;                          enable-recursive-minibuffers t
;; ;; 			             vertico-cycle t)
;; ;;   :init (vertico-mode))
;; ;; (use-package marginalia
;; ;;   :custom
;; ;;   (marginalia-annotators
;; ;;    '(marginalia-annotators-heavy marginalia-annotators-light nil))
;; ;;   (setq marginalia--ellipsis "…"    ; Nicer ellipsis
;; ;;         marginalia-align 'right     ; right alignment
;; ;;         marginalia-align-offset -1) ; one space on the right
;; ;;   :init
;; ;;   (marginalia-mode)
;; ;;   :diminish marginalia-mode)
;; ;; (use-package consult
;; ;;   :bind (("C-s" . consult-line)
                ;; orig. switch-to-buffer
;; ;;          ("C-x 4 b" . consult-buffer-other-window) ;; orig. switch-to-buffer-other-window
;; ;;          ("C-x 5 b" . consult-buffer-other-frame)  ;; orig. switch-to-buffer-other-frame
;; ;;          ("M-g e" . consult-compile-error)
;; ;;          ("M-s f" . consult-flycheck)
;; ;;          ("M-s G" . consult-git-grep)
;; ;;          ("M-s r" . consult-ripgrep))
;; ;;   :hook (completion-list-mode . consult-preview-at-point-mode)
;; ;;   :init
;; ;;   (setq register-preview-delay 0
;; ;;         register-preview-function #'consult-register-format)
;; ;;   (advice-add #'register-preview :override #'consult-register-window)
;; ;;   (advice-add #'completing-read-multiple :override #'consult-completing-read-multiple)
;; ;;   :config
;; ;;   (global-set-key [remap apropos]                       #'consult-apropos)
;; ;;   (global-set-key [remap bookmark-jump]                 #'consult-bookmark)
;; ;;   (global-set-key [remap goto-line]                     #'consult-goto-line)
;; ;;   (global-set-key [remap imenu]                         #'consult-imenu)
;; ;;   (global-set-key [remap locate]                        #'consult-locate)
;; ;;   (global-set-key [remap load-theme]                    #'consult-theme)
;; ;;   (global-set-key [remap man]                           #'consult-man)
;; ;;   (global-set-key [remap recentf-open-files]            #'consult-recent-file)
;; ;;   (global-set-key [remap switch-to-buffer]              #'consult-buffer)
;; ;;   (global-set-key [remap switch-to-buffer-other-window] #'consult-buffer-other-window)
;; ;;   (global-set-key [remap switch-to-buffer-other-frame]  #'consult-buffer-other-frame)
;; ;;   (global-set-key [remap yank-pop]                      #'consult-yank-pop)
;; ;;   (consult-customize
;; ;;    consult-theme
;; ;;    :preview-key '(:debounce 0.2 any)
;; ;;    consult-ripgrep consult-git-grep consult-grep)
;; ;;   :diminish consult-mode)
;; ;; (use-package orderless
;; ;;   :custom (completion-styles '(orderless)))

;; ;; ;; spellcheck

;; (use-package vertico
;;   :init (vertico-mode)
;;   :custom (setq vertico-cycle t))

;; (use-package corfu
;;   :init (corfu-global-mode)
;;   :custom (setq corfu-cycle t))

;; (use-package orderless)



;; ;;  Everywhere!!!
;; (use-package emacs-everywhere)

;; ;; Finally started using emacs bindings :)
;; ;; ;; evil, it's vim inside of emacs
;; ;; (use-package evil
;; ;;   :init
;; ;;   (setq evil-want-integration t
;; ;;         evil-want-keybinding nil
;; ;;         evil-respect-visual-line-mode t
;; ;;         evil-undo-system 'undo-tree)
;; ;;   (global-set-key (kbd "<escape>") 'keyboard-escape-quit)
;; ;;   :config
;; ;;   ;; (add-hook 'evil-mode-hook 'evil-hook)
;; ;;   (evil-mode 1))

;; ;; (use-package evil-nerd-commenter
;; ;;   :after evil
;; ;;   :bind ("M-/" . evilnc-comment-or-uncomment-lines))

;; ;; (use-package evil-collection
;; ;;   :after evil
;; ;;   :diminish evil-collection-unimpaired-mode
;; ;;   :config (evil-collection-init))

;; ;; movement?


;; ;; getting help
;; (use-package which-key
;;   :diminish which-key-mode
;;   :config
;;   (which-key-mode)
;;   (setq which-key-idle-delay 0.2))
;; (use-package helpful
;;   :commands helpful-mode
;;   :diminish helpful-mode
;;   :config
;;   (define-key helpful-mode-map [remap revert-buffer] #'helpful-update)
;;   (global-set-key [remap describe-command] #'helpful-command)
;;   (global-set-key [remap describe-function] #'helpful-callable)
;;   (global-set-key [remap describe-key] #'helpful-key)
;;   (global-set-key [remap describe-symbol] #'helpful-symbol)
;;   (global-set-key [remap describe-variable] #'helpful-variable)
;;   (global-set-key (kbd "C-h F") #'helpful-function))


;; ;; Terminals
;; ;; vterm
;; (use-package vterm
;;   :config (setq term-prompt-regexp "^[^#$%>\n]*[#$%>] *"
;;                 vterm-shell "zsh"
;;                 vterm-max-scrollback 10000
;;                 vterm-kill-buffer-on-exit t
;;                 vterm-always-compile-module t))
;; (use-package vterm-toggle
;;   :bind ("C-M-<return>" . vterm-toggle))

;; ;; eshell
;; (setq eshell-prompt-function
;;       (lambda ()
;;         (format "%s \n%s "
;;                 ;; (file-attribute-modes (file-attributes default-directory))
;;                 (abbreviate-file-name (eshell/pwd))
;;                 (if (= (user-uid) 0) "Λ" "λ")))

;;       eshell-prompt-regexp
;;       (rx bol
;;           (* (not (any "Λ" "λ" "\n")))
;;           (any "\n" "Λ" "λ") " "))

;; (defun eshell/configure ()
;;   (add-hook 'eshell-pre-command-hook 'eshell-save-some-history)
;;   (add-to-list 'eshell-output-filter-functions 'eshell-truncate-buffer)
;;   (evil-normalize-keymaps)

;;   (setq eshell-highlight-prompt nil
;;         comint-scroll-to-bottom-on-input t
;;         comint-completion-addsuffix t
;;         comint-input-ignoredups t
;;         eshell-hist-ignoredups t
;;         eshell-history-size         10000
;;         eshell-buffer-maximum-lines 10000
;;         eshell-scroll-to-bottom-on-input t))

;; (use-package eshell
;;   :hook (eshell-first-time-mode . eshell/configure))
;; (global-set-key (kbd "C-c e") #'eshell)

;; (with-eval-after-load 'esh-opt
;;   (setq eshell-destroy-buffer-when-process-dies t)
;;   (setq eshell-visual-commands '("htop" "zsh" "vim")))

;; (use-package eshell-git-prompt)
;; (use-package exec-path-from-shell)

;; (defalias 'open 'find-file-other-window)
;; (defalias 'clean 'eshell/clear-scrollback)

;; (defun sudo-open (filename)
;;   "Open a file as root in Eshell."
;;   (let ((qual-filename (if (string-match "^/" filename)
;;                            filename
;;                          (concat (expand-file-name (eshell/pwd)) "/" filename))))
;;     (switch-to-buffer
;;      (find-file-noselect
;;       (concat "/sudo::" qual-filename)))))

;; (defun eshell-other-window ()
;;   "Create or visit an eshell buffer."
;;   (interactive)
;;   (if (not (get-buffer "*eshell*"))
;;       (progn
;;         (split-window-sensibly (selected-window))
;;         (other-window 1)
;;         (eshell))
;;     (switch-to-buffer-other-window "*eshell*")))
;; (global-set-key (kbd "<s-C-return>") 'eshell-other-window)

;; (use-package eshell-syntax-highlighting
;;   :after eshell-mode
;;   :ensure t ;; Install if not already installed.
;;   :config
;;   ;; Enable in all Eshell buffers.
;;   (eshell-syntax-highlighting-global-mode +1))

;; (global-set-key (kbd "C-c s") 'async-shell-command)



;; ;;indentation
;; (setq-default tab-width 4)
;; (setq-default indent-tabs-mode nil) ;; spaces instead of tabs
;; (setq-default standard-indent 4)
;; (setq c-basic-offset tab-width)
;; (setq-default electric-indent-inhibit t)
;; (setq backward-delete-char-untabify-method 'nil)

;; (use-package highlight-indent-guides
;;   :diminish highlight-indent-guides-mode
;;   :hook ((prog-mode . (lambda ()
;;                         (highlight-indent-guides-mode)
;;                         (highlight-indent-guides-auto-set-faces))))
;;   :config
;;   (setq highlight-indent-guides-method 'character
;;         highlight-indent-guides-responsive 'stack
;;         highlight-indent-guides-delay 0))

;; ;; rainbow
;; (use-package rainbow-mode
;;   :diminish
;;   :init
;;   (add-hook 'prog-mode-hook 'rainbow-mode))
;; (use-package rainbow-delimiters
;;   :diminish
;;   :init
;;   (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))
;; (use-package beacon
;;   :diminish
;;   :init
;;   (beacon-mode 1))
;; (use-package highlight-numbers
;;   :hook (prog-mode . highlight-numbers-mode))

;; ;; modeline
;; (setq display-time-format "%H:%M"
;;       display-time-default-load-average nil)
;; (display-time-mode 1)
;; ;; (line-number-mode -1)
;; (column-number-mode -1)
;; (size-indication-mode -1)
;; (display-battery-mode -1)
;; (use-package mood-line
;;   :init (mood-line-mode))

;; ;; colortheme
;; (use-package doom-themes
;;   :init (load-theme 'doom-tomorrow-night t))
;; (defun toggle-theme()
;;   (interactive)
;;   (if (eq (car custom-enabled-themes) 'doom-tomorrow-night)
;;       (consult-theme 'doom-tomorrow-day)
;;     (consult-theme 'doom-tomorrow-night)))
;; (global-set-key [f5] 'toggle-theme)

;; (use-package dimmer
;;   :hook (after-init . dimmer-mode)
;;   :config
;;   (setq dimmer-fraction 0.5
;;         dimmer-adjustment-mode :foreground
;;         dimmer-use-colorspace :rgb
;;         dimmer-watch-frame-focus-events nil)
;;   (dimmer-configure-which-key)
;;   (dimmer-configure-magit)
;;   (dimmer-configure-posframe))

;; ;;org-mode
;; (use-package org
;;   :ensure t
;;   :init (setq org-export-backends '(ascii beamer html hugo icalendar md gfm reveal latex odt org)
;;               org-startup-indented t)
;;   :hook (org-mode . (prettify-symbols-mode
;;                      org-toggle-prettty-entities
;;                      turn-off-auto-fill))
;;   :mode ("\\.org" . org-mode)
;;   ;; :commands (org-mode org-capture org-agenda )
;;   :config
;;   ;; (setq org-hide-emphasis-markers t)
;;   )
;; (add-hook 'org-mode-hook 'org-indent-mode)

;;


;; (require 'org-tempo)
;; (add-to-list 'org-structure-template-alist '("sh" . "src sh"))
;; (add-to-list 'org-structure-template-alist '("scm" . "src scheme"))
;; (add-to-list 'org-structure-template-alist '("py" . "src python"))
;; (add-to-list 'org-structure-template-alist '("tex" . "src latex"))
;; (add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))

;; (setq org-confirm-babel-evaluate nil)
;; (org-babel-do-load-languages
;;  'org-babel-load-languages
;;  '((emacs-lisp .t)
;;    (python . t)
;;    (scheme . t)
;;    (latex . t)
;;    (shell . t)))

;; (require 'org-habit)
;; (add-to-list 'org-modules 'org-habit)
;; (setq org-habit-graph-column 60)

;; ;; (use-package

;; ;; (load "~/.config/emacs/etc/latex/latex-settings.el")

;; ;; ;; Writting
;; ;; ;; focus
;; ;; (use-package writeroom-mode
;; ;;   :bind ("C-c o" . writeroom-mode))


;; ;; (use-package company
;; ;;   :commands(company-complete-common
;; ;;             company-complete-common-or-cycle
;; ;;             company-manual-begin
;; ;;             company-grab-line)
;; ;;   :init (setq company-minimum-prefix-length 2
;; ;;               company-tooltip-limit 14
;; ;;               company-tooltip-align-annotations t
;; ;;               company-require-match 'never
;; ;;               company-global-modes
;; ;;               '(not erc-mode
;; ;;                     circe-mode
;; ;;                     message-mode
;; ;;                     help-mode
;; ;;                     gud-mode
;; ;;                     vterm-mode)
;; ;;               company-frontends
;; ;;               '(company-pseudo-tooltip-frontend  ; always show candidates in overlay tooltip
;; ;;                 company-echo-metadata-frontend)  ; show selected candidate docs in echo area

;; ;;               ;; Buffer-local backends will be computed when loading a major mode, so
;; ;;               ;; only specify a global default here.
;; ;;               company-backends '(company-capf)

;; ;;               ;; These auto-complete the current selection when
;; ;;               ;; `company-auto-commit-chars' is typed. This is too magical. We
;; ;;               ;; already have the much more explicit RET and TAB.
;; ;;               company-auto-commit nil

;; ;;               ;; Only search the current buffer for `company-dabbrev' (a backend that
;; ;;               ;; suggests text your open buffers). This prevents Company from causing
;; ;;               ;; lag once you have a lot of buffers open.
;; ;;               company-dabbrev-other-buffers nil
;; ;;               ;; Make `company-dabbrev' fully case-sensitive, to improve UX with
;; ;;               ;; domain-specific words with particular casing.
;; ;;               company-dabbrev-ignore-case nil
;; ;;               company-dabbrev-downcase nil)
;; ;;   :custom  (setq company-idle-delay 0.1
;; ;;                  company-selection-wrap-around t
;; ;;                  company-require-match 'never
;; ;;                  company-dabbrev-downcase nil
;; ;;                  company-dabbrev-ignore-case t
;; ;;                  company-dabbrev-other-buffers nil
;; ;;                  company-tooltip-limit 5
;; ;;                  company-tooltip-minimum-width 40)
;; ;;   (set-company-backend!
;; ;;    '(text-mode
;; ;;      markdown-mode
;; ;;      gfm-mode)
;; ;;    '(:seperate
;; ;;      company-files)))
;; ;; (use-package company-box
;; ;;   :hook (company-mode . company-box-mode)
;; ;;   :config (setq company-box-show-single-candidate t
;; ;;                 company-box-backends-colors nil
;; ;;                 company-box-max-candidates 50
;; ;;                 company-box-icons-alist 'company-box-icons-all-the-icons))


;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(max-lisp-eval-depth 100000))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(org-document-title ((t (:inherit default :weight bold :foreground "unspecified-fg" :height 2.0 :underline nil))))
;;  '(org-level-1 ((t (:inherit default :weight bold :foreground "unspecified-fg" :height 1.75))))
;;  '(org-level-2 ((t (:inherit default :weight bold :foreground "unspecified-fg" :height 1.5))))
;;  '(org-level-3 ((t (:inherit default :weight bold :foreground "unspecified-fg" :height 1.25))))
;;  '(org-level-4 ((t (:inherit default :weight bold :foreground "unspecified-fg" :height 1.1))))
;;  '(org-level-5 ((t (:inherit default :weight bold :foreground "unspecified-fg"))))
;;  '(org-level-6 ((t (:inherit default :weight bold :foreground "unspecified-fg"))))
;;  '(org-level-7 ((t (:inherit default :weight bold :foreground "unspecified-fg"))))
;;  '(org-level-8 ((t (:inherit default :weight bold :foreground "unspecified-fg")))))



;; -*- lexical-binding: t; -*-
;; garbage collection
(setq gc-cons-threshold most-positive-fixnum
      read-process-output-max (* 1024 1024)) ;; 1mb

;; enconding and stuff
(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

;; macos
(when (eq system-type 'darwin)
  (setq insert-directory-program "/opt/homebrew/bin/gls")
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier 'super)
  (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
  (add-to-list 'default-frame-alist '(ns-appearance . dark))
  (when (member "SF Mono" (font-family-list))
    (add-to-list 'initial-frame-alist '(font . "SF Mono-14"))
    (add-to-list 'default-frame-alist '(font . "SF Mono-14")))
  (set-fontset-font t 'symbol (font-spec :family "Apple Symbols") nil 'prepend)
  (set-fontset-font t 'symbol (font-spec :family "Apple Color Emoji") nil 'prepend))

;; organize backups
(setq backup-directory-alist `(("." . ,(expand-file-name "tmp/backups/" user-emacs-directory)))
      make-backup-files nil
      auto-save-default nil
      create-lockfiles nil)

;; visual stuff
(setq-default inhibit-startup-screen t
              visible-bell nil
              history-length 30
              use-dialog-box nil
              frame-resize-pixelwise t
              global-hl-line-mode t
              frame-title-format '("" "%b")
              truncate-partial-width-windows nil
              truncate-lines nil)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode -1)
(menu-bar-mode t)
(save-place-mode 1)
(global-hl-line-mode 1)
;; (add-hook 'prog-mode-hook 'display-line-numbers-mode)
;; (global-set-key (kbd "<f9>") 'display-line-numbers-mode)
(put 'narrow-to-region 'disabled nil)

;; font
(set-face-attribute 'default nil
                    :family "Liga SFMono Nerd Font"
                    :height 145
                    :width 'normal)

;; remember files I visit
(recentf-mode 1)
;; (setq initial-buffer-choice (lambda () (recentf-open-more-files)))
(setq history-length 25)
(savehist-mode 1)

;; do stuff when I save files
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(global-auto-revert-mode 1)

;; scroll
(setq auto-window-vscroll nil)
(customize-set-variable 'fast-but-imprecise-scrolling t)
(customize-set-variable 'scroll-conservatively 101)
(customize-set-variable 'scroll-margin 0)
(customize-set-variable 'scroll-preserve-screen-position t)

;; I don't like writing yes/no
(defalias 'yes-or-no-p 'y-or-n-p)

;; automatically close delimiters
(electric-pair-mode 1)

;;; straight
;; Initialize package sources
(require 'package)

(setq package-user-dir (expand-file-name "elpa" user-emacs-directory)
      package-archives
      '(("gnu"   . "https://elpa.gnu.org/packages/")
        ("melpa-stable" . "https://stable.melpa.org/packages/")
        ("melpa" . "https://melpa.org/packages/")
        ("org" . "https://orgmode.org/elpa/")
        ;; ("cselpa" . "https://elpa.thecybershadow.net/packages/")
        ;; ("melpa-cn" . "http://mirrors.cloud.tencent.com/elpa/melpa/")
        ;; ("gnu-cn"   . "http://mirrors.cloud.tencent.com/elpa/gnu/")
        ))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (featurep 'straight)
  ;; Bootstrap straight.el
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
    (load bootstrap-file nil 'nomessage)))

;; Use straight.el for use-package expressions
(straight-use-package 'use-package)

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(unless package-archive-contents
  (package-refresh-contents))

(setq warning-suppress-types '((use-package) (comp)))
(setq comp-deferred-compilation t)

(use-package vertico
  :init (vertico-mode)
  :custom (setq vertico-cycle t))

(use-package corfu
  :init (global-corfu-mode
         corfu-popupinfo-mode)
  :custom (setq corfu-cycle t
                corfu-auto t))
(use-package dabbrev
  ;; Swap M-/ and C-M-/
  :bind (("M-/" . dabbrev-completion)
         ("C-M-/" . dabbrev-expand))
  ;; Other useful Dabbrev configurations.
  :custom
  (dabbrev-ignored-buffer-regexps '("\\.\\(?:pdf\\|jpe?g\\|png\\)\\'")))

(use-package orderless
  :custom (completion-styles '(orderless)))

(use-package consult
  :bind(("C-s" . consult-line)
        ("C-M-l" . consult-imenu)
        ("C-x b" . consult-buffer)
        ("C-r" . consult-history)))

(use-package marginalia
  :init (marginalia-mode)
  :custom (setq marginalia-annotators '(marginalia-annotators-heavy
                                        marginalia-annotators-light
                                        nil)))

(use-package embark
  :after (embark-consult)
  :bind ("C-S-a" . embark-act)
  :custom (setq embark-action-indicator
                (lambda (map)
                  (which-key--show-keymap "Embark" map nil nil 'no-paging)
                  #'which-key--hide-popup-ignore-command)
                embark-become-indicator embark-action-indicator))


;; dired
(setq dired-listing-switches "-agho --group-directories-first"
      dired-omit-files "^\\.[^.].*"
      dired-listing-switches "-al --group-directories-first"
      dired-dwim-target t  ; suggest a target for moving/copying intelligently
      dired-hide-details-hide-symlink-targets nil
      ;; don't prompt to revert, just do (insert )t
      dired-auto-revert-buffer #'dired-buffer-stale-p
      ;; Always copy/delete recursively
      dired-recursive-copies  'always
      dired-recursive-deletes 'top
      ;; Ask whether destination dirs should get created when copying/removing files.
      dired-create-destination-dirs 'ask)
(customize-set-variable 'global-auto-revert-non-file-buffers t)
(use-package all-the-icons-dired
  :hook (dired-mode . all-the-icons-dired-mode))
(use-package dired-hide-dotfiles
  :hook (dired-mode . dired-hide-dotfiles-mode)
  :config
  (evil-collection-define-key 'normal 'dired-mode-map
                              "H" 'dired-hide-dotfiles-mode))

;; getting help
(use-package which-key
  :diminish which-key-mode
  :config
  (which-key-mode)
  (setq which-key-idle-delay 0.2))
(use-package helpful
  :commands helpful-mode
  :diminish helpful-mode
  :config
  (define-key helpful-mode-map [remap revert-buffer] #'helpful-update)
  (global-set-key [remap describe-command] #'helpful-command)
  (global-set-key [remap describe-function] #'helpful-callable)
  (global-set-key [remap describe-key] #'helpful-key)
  (global-set-key [remap describe-symbol] #'helpful-symbol)
  (global-set-key [remap describe-variable] #'helpful-variable)
  (global-set-key (kbd "C-h F") #'helpful-function))

;; async
(use-package async
  :ensure t
  :init
  (dired-async-mode 1)
  :config
  (async-bytecomp-package-mode 1))

;; git
(use-package magit
  :bind ("C-M-;" . magit-status)
  :commands (magit-status magit-get-current-branch))

(use-package flyspell
  :bind (:map flyspell-mode-map
              ("C->" . flyspell-buffer))
  :init (progn (dolist (hook '(org-mode-hook text-mode-hook message-mode-hook))
                 (add-hook hook 'turn-on-flyspell))
               (add-hook 'prog-mode-hook 'flyspell-prog-mode))
  :config
  (when (executable-find "hunspell")
    (setq-default ispell-program-name "hunspell")
    (setq ispell-really-hunspell t))
  (cond ((executable-find "enchant-2")  (setq-default ispell-program-name "enchant-2"))
        ((executable-find "hunspell")   (progn (setq-default ispell-program-name "hunspell") (setq ispell-really-hunspell t)))
        ((executable-find "aspell")     (setq-default ispell-program-name "aspell")))
  (setq ispell-default-dictionary "pt_BR"))


;; ace-jump-mode
(use-package ace-jump-mode
  :bind ("C-;" . ace-jump-mode))

(use-package undo-tree
  :diminish undo-tree-mode
  :init (global-undo-tree-mode))

;; snippets
(use-package yasnippet
  :config
  (yas-global-mode 1)
  (use-package yasnippet-snippets
    :ensure t)
  (use-package auto-yasnippet
    :ensure t)
  (yas-reload-all))

;; indentation
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil) ;; spaces instead of tabs
(setq-default standard-indent 4)
(setq c-basic-offset tab-width)
(setq-default electric-indent-inhibit t)
(setq backward-delete-char-untabify-method 'nil)

(use-package highlight-indent-guides
  :diminish highlight-indent-guides-mode
  :hook ((prog-mode . (lambda ()
                        (highlight-indent-guides-mode)
                        (highlight-indent-guides-auto-set-faces))))
  :config
  (setq highlight-indent-guides-method 'character
        highlight-indent-guides-responsive 'stack
        highlight-indent-guides-delay 0))

;; rainbow
(use-package rainbow-mode
  :diminish
  :init
  (add-hook 'prog-mode-hook 'rainbow-mode))
(use-package rainbow-delimiters
  :diminish
  :init
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))
(use-package beacon
  :diminish
  :init
  (beacon-mode 1))
(use-package highlight-numbers
  :hook (prog-mode . highlight-numbers-mode))

;; modeline
(setq display-time-format "%H:%M"
      display-time-default-load-average nil)
(display-time-mode 1)
;; (line-number-mode -1)
(column-number-mode -1)
(size-indication-mode -1)
(display-battery-mode -1)
(use-package mood-line
  :init (mood-line-mode))

;; colortheme
(use-package doom-themes
  :init (load-theme 'doom-tomorrow-night t))
(defun toggle-theme()
  (interactive)
  (if (eq (car custom-enabled-themes) 'doom-tomorrow-night)
      (consult-theme 'doom-tomorrow-day)
    (consult-theme 'doom-tomorrow-night)))
(global-set-key [f5] 'toggle-theme)

(use-package dimmer
  :hook (after-init . dimmer-mode)
  :config
  (setq dimmer-fraction 0.5
        dimmer-adjustment-mode :foreground
        dimmer-use-colorspace :rgb
        dimmer-watch-frame-focus-events nil)
  (dimmer-configure-which-key)
  (dimmer-configure-magit)
  (dimmer-configure-posframe))

;; Org mode
(setq-default fill-column 80)

(use-package org
  :init ((org-indent-mode 1)
         (variable-pitch-mode 1)
         (auto-fill-mode 0)
         (visual-line-mode 1)
         (diminish org-indent-mode))
  :custom(setq org-ellipsis "▾"
               org-hide-emphasis-markers t
               org-src-fontify-natively t
               org-fontify-quote-and-verse-blocks t
               org-src-tab-acts-natively t
               org-edit-src-content-indentation 2
               org-hide-block-startup nil
               org-src-preserve-indentation nil
               org-startup-folded 'content
               org-cycle-separator-lines 2
               org-capture-bookmark nil
               org-agenda-files '("~/.org/")
               org-directory  "~/Documents/org/"
               org-lowest-priority ?E
               org-agenda-directory "~/.org/"
               org-capture-templates `(("i" "inbox" entry (file ,(concat org-agenda-directory "inbox.org"))
                                        "* TODO %?")
                                       ("e" "email" entry (file+headline ,(concat org-agenda-directory "emails.org") "Emails")
                                        "* TODO [#A] Reply: %a :@home:@school:" :immediate-finish t)
                                       ("l" "link" entry (file ,(concat org-agenda-directory "inbox.org"))
                                        "* TODO %(org-cliplink-capture)" :immediate-finish t)
                                       ("c" "org-protocol-capture" entry (file ,(concat org-agenda-directory "inbox.org"))
                                        "* TODO [[%:link][%:description]]\n\n %i" :immediate-finish t))
               org-todo-keywords '((sequence "TODO(t)" "|" "DONE(d)")
                                   (sequence "REPORT(r)" "BUG(b)" "KNOWNCAUSE(k)" "|" "FIXED(f)")
                                   (sequence "|" "CANCELED(c)"))
               org-modules    '(org-crypt
                                org-habit
                                org-bookmark
                                org-eshell
                                org-irc)
               org-refile-targets '((nil :maxlevel . 1)
                                    (org-agenda-files :maxlevel . 1))
               org-outline-path-complete-in-steps nil
               org-refile-use-outline-path t
               org-habit-graph-column 60)
  :bind (("C-c C-c" . org-capture)
         ("C-c a" . org-agenda-list)))

(use-package org-journal
  :bind
  ("C-c j n" . org-journal-new-entry)
  :custom
  (setq org-journal-dir "~/Documents/org/journal/"
        org-journal-date-prefix "#+title: "
        org-journal-file-format "%Y-%m-%d.org"
        org-journal-date-format "%A, %d %B %Y"
        org-journal-enable-agenda-integration t))

;; roam for zettelkasten
(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory "~/Documents/org/roam")
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n d n" . org-roam-dailies-capture-today))
  :config (org-roam-setup))
(setq org-roam-v2-ack t)
(setq org-roam-dailies-directory "journal/")

;; Make org prettier
(defun org/prettify-set ()
  (interactive)
  (setq prettify-symbols-alist
        '(("#+begin_src" . "→")
          ("#+BEGIN_SRC" . "→")
          ("#+end_src" . "←")
          ("#+END_SRC" . "←")
          ("#+begin_example" . "")
          ("#+BEGIN_EXAMPLE" . "")
          ("#+end_example" . "")
          ("#+END_EXAMPLE" . "")
          ("#+results:" . "")
          ("#+RESULTS:" . ""))))
(add-hook 'org-mode-hook 'org/prettify-set)

(let* ((base-font-color     (face-foreground 'default nil 'default))
       (headline           `(:inherit default :weight bold :foreground ,base-font-color)))
  (custom-theme-set-faces 'user
                          `(org-level-8 ((t (,@headline ))))
                          `(org-level-7 ((t (,@headline ))))
                          `(org-level-6 ((t (,@headline ))))
                          `(org-level-5 ((t (,@headline ))))
                          `(org-level-4 ((t (,@headline , :height 1.1))))
                          `(org-level-3 ((t (,@headline , :height 1.25))))
                          `(org-level-2 ((t (,@headline , :height 1.5))))
                          `(org-level-1 ((t (,@headline , :height 1.75))))
                          `(org-document-title ((t (,@headline , :height 2.0 :underline nil))))))

(use-package org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(use-package org-modern)
;; (modify-all-frames-parameters
;;  '((right-divider-width . 40)
;;    (internal-border-width . 40)))
(dolist (face '(window-divider
                window-divider-first-pixel
                window-divider-last-pixel))
  (face-spec-reset-face face)
  (set-face-foreground face (face-attribute 'default :background)))
(set-face-background 'fringe (face-attribute 'default :background))

(setq
 ;; Edit settings
 org-auto-align-tags t
 org-tags-column 0
 org-catch-invisible-edits 'show-and-error
 org-insert-heading-respect-content t

 ;; Agenda styling
 org-agenda-tags-column 0
 org-agenda-block-separator ?─
 org-agenda-time-grid
 '((daily today require-timed)
   (800 1000 1200 1400 1600 1800 2000)
   " ┄┄┄┄┄ " "┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄")
 org-agenda-current-time-string
 "⭠ now ─────────────────────────────────────────────────")
(global-org-modern-mode)

;;org exports
(use-package org-ql)
(use-package ox-reveal)
;; (setq-default org-latex-pdf-process '("tectonic -Z shell-escape --outdir=%o %f"))

;; pdf
(use-package pdf-tools
  :mode "\\.pdf\\'"
  :config
  (pdf-tools-install)
  (define-pdf-cache-function pagelabels)
  (setq pdf-view-use-scaling t
        pdf-view-use-imagemagick nil
        pdf-view-display-size 'fit-page)
  (define-key pdf-view-mode-map (kbd "C-s") 'isearch-forward)
  :hook (pdf-tools-enabled . pdf-view-themed-minor-mode))
(use-package pdf-view-restore
  :after pdf-tools
  :ensure t
  :config
  :hook (pdf-view-mode . pdf-view-restore-mode))


;; programming
(use-package lsp-mode
  :hook ((typescript-mode c-mode c++-mode rust-mode) . lsp-mode)
  :bind ("TAB" . completion-at-point)
  :custom (setq lsp-headerline-breadcrum-enable-nil))
(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode)
  :init ((setq lsp-ui-sideline-enable t
              lsp-ui-sideline-show-hover t
              lsp-ui-doc-position 'bottom)
         (lsp-ui-doc-show)))
(use-package dap-mode
  :custom
  (setq lsp-enable-dap-auto-configure nil)
  (dap-ui-mode 1)
  (dap-tooltip-mode 1)
  (dap-node-setup))

;; C programming language
(use-package ccls)

;; Rust
(use-package rust-mode
  :mode "\\.rs\\'"
  :custom (setq rust-format-on-save t))
(use-package rustic)

;; Web
(use-package typescript-mode
  :mode "\\.ts\\'"
  :custom (setq typescript-indent-level 2))

(use-package js2-mode
  :mode "\\.jsx?\\'")
(add-to-list 'magic-mode-alist '("#!/usr/bin/env node" . js2-mode))
(setq js2-mode-show-strict-warnings nil)

(use-package apheleia
  :init (apheleia-global-mode +1))
