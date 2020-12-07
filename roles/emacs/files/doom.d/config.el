;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
;;; Code:
(setq user-full-name "Filipe Guerreiro"
      user-mail-address "filipe.m.guerreiro@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-solarized-light)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type nil)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;;(setq user-full-name "Filipe Guerreiro"
;;             user-mail-address "filipe.m.guerreiro@gmail.com")
;;(cond (IS-MAC
;;            (setq mac-command-modifier      'meta
;;                  mac-option-modifier       'alt
;;                  mac-right-option-modifier 'super)))
;;(setq confirm-kill-emacs nil)
;;(setq auto-save-default t
;;      make-backup-files t)
;;(setq doom-font (font-spec :family "JetBrains Mono" :size 12)
;;      doom-variable-pitch-font (font-spec :family "ETBembo" :size 12))
;;(setq +doom-dashboard-banner-file
;;      (expand-file-name "splash-images/black-hole2.png" doom-private-dir))
;;(after! doom-modeline
;;    (setq display-time-default-load-average nil)      ; don't show load average
;;    (display-time-mode 1)                             ; Enable time in the mode-line
;;    (display-battery-mode 1))                         ; On laptops it's nice to know how much power you have
;;(setq evil-split-window-below t
;;      evil-vsplit-window-right t)


;;(setq org-directory "~/org/")
;;(setq +pretty-code-enabled-modes '(org-mode))
;;(after! org (setq org-hide-emphasis-markers t))
;;(after! org (setq org-insert-heading-respect-content nil))
;;(after! org
;;      (setq org-log-done t)
;;      (setq org-log-into-drawer t))
;;(add-hook! org-mode :append
;;           #'visual-line-mode
;;           #'variable-pitch-mode
;;           (lambda () (add-hook 'after-save-hook 'org-babel-tangle :append :local)))


;;(after! company
;;  (setq company-idle-delay 0.3
;;        company-minimum-prefix-length 1
;;  company-dabbrev-code-everywhere t
;;  company-dabbrev-code-other-buffers 'all))
;; company-quickhelp-delay 0.4)
;;(after! prescient
;;  (setq-default history-length 1000)
;;  (setq-default prescient-history-length 1000))

;; (add-hook 'after-init-hook 'company-statistics-mode))

;; (set-company-backend! 'org-mode
;;   '(company-capf company-files company-dabbrev-code))
;;(after! company
;;  (use-package company-tabnine :ensure t)
;;  (setq company-backends '(company-tabnine company-capf company-yasnippet)))

;; (after! company
;;   (add-to-list 'company-backends 'company-tabnine))

(setq doom-font (font-spec :family "JetBrains Mono" :size 13)
      doom-big-font (font-spec :family "JetBrains Mono" :size 16))
(custom-set-faces!
  '(doom-modeline-buffer-modified :foreground "orange"))
(global-set-key [f8] 'treemacs)



;;Other Projectile packages outside
(projectile-add-known-project "~/writings")              ;My LaTeX Writings
(projectile-add-known-project "~/.notes")                ;My Org and Markdown Not
(projectile-add-known-project "~/.doom.d")               ;Doom config files

;;Setq stuff defined by Doom and such
(setq projectile-project-search-path '("~/projects/" "~/work/"))
(setq projectile-sort-order 'recentf)

