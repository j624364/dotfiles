;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Joe"
      user-mail-address "49117678+j624364@users.noreply.github.com")

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
(setq doom-font (font-spec :family "Fira Code" :size 14 :weight 'semi-light)
        doom-variable-pitch-font (font-spec :family "Fira Code" :size 16))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-dracula)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")
(setq org-agenda-files (directory-files-recursively "~/org" "\\.org$"))
(setq org-startup-with-inline-images t)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

(setq display-line-numbers-type 'relative)

;; Set splitright and splitbelow
(setq evil-vsplit-window-right t
      evil-split-window-below t)

;; Add nasm
(add-to-list 'auto-mode-alist '("\\.nasm\\'" . nasm-mode))

;; Map Ctrl j and k
(global-set-key (kbd "C-j") (lambda () (interactive) (evil-next-line 5)))
(global-set-key (kbd "C-k") (lambda () (interactive) (evil-previous-line 5)))

;; Map £ and $
(global-set-key (kbd "C-3") (lambda () (interactive) (evil-beginning-of-line)))
(global-set-key (kbd "C-4") (lambda () (interactive) (evil-end-of-line)))

(global-set-key (kbd "C-b") (lambda () (interactive) (ibuffer)))
(global-set-key (kbd "S-B") (lambda () (interactive) (kill-current-buffer)))

;; Disable mouse scrolling acceleration
(setq mouse-wheel-progressive-speed nil)

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

(setq doom-leader-key "SPC"
      doom-localleader-key "SPC m")

;; Org Mode

(setq org-ellipsis " ▾")

(remove-hook 'doom-first-buffer-hook #'smartparents-global-mode)

(setq-default explicit-shell-file-name "/usr/bin/zsh")
(setq-default shell-file-name "/usr/bin/zsh")

(setq projectile-project-search-path '("~/Repos/"))

;; doom doesnt have org-superstar, which i guess ill have to get at some point
;; (org-superstar-remove-leading-stars t)
;; (org-superstar-headline-bullets-list '("◉" "○" "●" "○" "●" "○" "●"))
