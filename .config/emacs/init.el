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
              frame-title-format '("" "%b")
              truncate-partial-width-windows nil
              truncate-lines nil)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(save-place-mode 1)
(global-hl-line-mode 1)
(blink-cursor-mode 0)
(global-visual-line-mode t)
(global-display-line-numbers-mode 1)
(show-paren-mode 1)
;; (add-hook 'prog-mode-hook 'display-line-numbers-mode)
;; (global-set-key (kbd "<f9>") 'display-line-numbers-mode)
(put 'narrow-to-region 'disabled nil)

(global-set-key (kbd "M-C-5") #'query-replace-regexp)

;; font
(set-face-attribute 'default nil
                    :family "IosevkaNerdFont"
                    :height 145
                    :width 'normal)

;; remember files I visit
(recentf-mode 1)
(setq initial-buffer-choice (lambda () (recentf-open-more-files)))
(setq history-length 30)

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
(setq ispell-program-name "hunspell"
      ispell-dictionary "pt_BR"))

;; ace-jump-mode
(use-package ace-jump-mode
  :bind ("C-;" . ace-jump-mode))

(use-package undo-tree
  :diminish undo-tree-mode
  :init (global-undo-tree-mode))
(setq undo-tree-history-directory-alist '(("." . "~/.config/emacs/undo")))

(use-package no-littering
  :config (setq no-littering-etc-directory
                (expand-file-name "config/" user-emacs-directory))
  (setq no-littering-var-directory
        (expand-file-name "data/" user-emacs-directory)))


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
  :init (load-theme 'doom-tokyo-night t))
(defun toggle-theme()
  (interactive)
  (if (eq (car custom-enabled-themes) 'doom-tokyo-night)
      (consult-theme 'doom-tokyo-night)
    (consult-theme 'doom-oksolar-light)))
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
  :init (
         ;;(variable-pitch-mode 1)
         (auto-fill-mode 0)
         (visual-line-mode 1)
         (diminish org-indent-mode))
  :custom(setq org-ellipsis "▾"
               org-startup-indented t
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
               org-agenda-files '("~/org/agenda.org")
               org-directory  "~/Documents/org/"
               org-lowest-priority ?E
               org-agenda-directory "~/org/"
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
         ("C-c n t" . org-roam-tag-add)
         ("C-c n d n" . org-roam-dailies-capture-today))
  :config (org-roam-setup))
(setq org-roam-v2-ack t)
(setq org-roam-dailies-directory "journal/")
(setq org-roam-capture-templates
      '(("n" "normal" plain
         "%?"
         :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
                            "#+title: ${title}\n#+filetags: ")
         :unnarrowed t)
        ("q" "química" plain
         "%?"
         :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
                            "#+title: ${title}\n#+filetags: :química:\n#+startup: latexpreview")
         :unnarrowed t)
        ("m" "matemática" plain
         "%?"
         :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
                            "#+title: ${title}\n#+filetags: :matemática:\n#+startup: latexpreview")
         :unnarrowed t)))

;;graph
(use-package org-roam-ui
    :after org-roam
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))


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

;;org babel
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)))

;; auto-tangle
(defun tangle-all-org-on-save-h ()
  "Tangle org files on save."
  (if (string= (file-name-extension (buffer-file-name)) "org")
      (org-babel-tangle)))
(add-hook 'after-save-hook #'tangle-all-org-on-save-h)

;;org drag and drop
;;;; from web
(use-package org-download
  :config
  (setq-default org-download-image-dir "~/Pictures/org")
  (add-hook 'dired-mode-hook 'org-download-enable)
  :bind
  ("C-c i" . org-download-clipboard))

;;org exports
(use-package org-ql)
(use-package ox-reveal)
;; (setq-default org-latex-pdf-process '("tectonic -Z shell-escape --outdir=%o %f"))
(require 'ox-latex)
(add-to-list 'org-latex-packages-alist '("" "minted"))
(setq org-latex-listings 'minted)

(setq org-latex-pdf-process
      '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))
;;(setq latex-run-command "xelatex")
;;(setq-default org-latex-pdf-process
;;    (list "latexmk -pdflatex='%latex -shell-escape -interaction nonstopmode' -pdf -output-directory=%o %f"))
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

(use-package smartparens
  :config (require 'smartparens-config))

(use-package tree-sitter :demand t)
(use-package tree-sitter-langs :demand t
  :init
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))

;; ;; lsp
;; (defun lsp-mode-setup ()
;;   (setq lsp-headerline-breadcrumb-segments '(path-up-to-project file symbols))
;;   (lsp-headerline-breadcrumb-mode))

;; (use-package lsp-mode
;;   :commands (lsp lsp-deferred)
;;   :hook (lsp-mode . lsp-mode-setup)
;;   :init
;;   (setq lsp-keymap-prefix "C-c l")  ;; Or 'C-l', 's-l'
;;   :config
;;   (lsp-enable-which-key-integration t))

;; (use-package lsp-ui
;;   :hook (lsp-mode . lsp-ui-mode)
;;   :custom
;;   (lsp-ui-doc-position 'bottom))

;; (use-package consult-lsp)


;; (use-package company
;;   :after lsp-mode
;;   :hook (lsp-mode . company-mode)
;;   :bind (:map company-active-map
;;          ("<tab>" . company-complete-selection))
;;         (:map lsp-mode-map
;;          ("<tab>" . company-indent-or-complete-common))
;;   :custom
;;   (company-minimum-prefix-length 1)
;;   (company-idle-delay 0.0))

;; (use-package company-box
;;   :hook (company-mode . company-box-mode))


;; (use-package python-mode
;;   :mode "\\.py\\'"
;;   :hook (python-mode . lsp-deferred))
