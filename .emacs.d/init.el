;; Commands: C-x for general commands, C-c for user and mode commands
;; Use C-g for exiting commands. C-h are for help commands.

;; Use C-x C-e or C-M-x to evaluate an elisp expression.

;; S-C-- or C-x u undo
;; S-C-M-- redo

;; Use M-x describe-bindings to show all current bindings.
;; Use C-M-i to auto complete.

;; Use C-z to toggle evil mode

(setq inhibit-startup-message t
      visible-bell nil)

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(global-set-key (kbd "C-c c") 'compile)

;; cua-mode for C-c, C-x & C-v for copy, cut and paste
; (cua-mode)

;; Remove some of the base toolbars
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1) ; keep for a bit to learn some keybindings

(setq mouse-wheel-progressive-speed nil)

;(set-fringe-mode 10)

(setq scroll-margin 5)
(setq scroll-conservatively 5)

 ;; Use M-n and M-p to scroll between them
(setq history-length 50)
(savehist-mode 1)

(save-place-mode 1)         ; Save place when going back to a file
(global-auto-revert-mode 1) ; Watch for file changes

(setq global-auto-revert-non-file-buffers t) ; Watch for dired changes

;; Define a custom-vars file so that it doesn't appear at the
;; end of this file
(setq custom-file (locate-user-emacs-file "custom-vars.el"))
(load custom-file 'noerror 'nomessage)

(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
				 ("org" . "https://orgmode.org/elpa/")
				 ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

(use-package dracula-theme)
(load-theme 'dracula t)
;; (use-package doom-themes)


;; General Editor Stuff


(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3))

(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
	 :map ivy-minibuffer-map
	 ("TAB" . ivy-alt-done)
	 ("C-l" . ivy-alt-done)
	 ("C-j" . ivy-next-line)
	 ("C-k" . ivy-previous-line)
	 :map ivy-switch-buffer-map
	 ("C-l" . ivy-alt-done)
	 ("C-d" . ivy-swtich-buffer-kill)
	 ("C-k" . ivy-previous-line)
	 :map ivy-reverse-i-search-map
	 ("C-k" . ivy-previous-line)
	 ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

(use-package ivy-rich
  :init
  (ivy-rich-mode 1))

(use-package counsel
  :bind (("M-x" . counsel-M-x)
	 ("C-x b" . counsel-ibuffer)
	 ("C-x C-f" . counsel-find-file)
	 :map minibuffer-local-map
	 ("C-r" . 'counsel-minibuffer-history))
  :config
  (setq ivy-initial-innputs-alist nil))

(use-package counsel-projectile
  :after projectile
  :config (counsel-projectile-mode))

(use-package helpful
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))

(defun hmd/evil-hook ()
  (dolist (mode '(custom-mode
		  eshell-mode
		  term-mode))
    (add-to-list 'evil-emacs-state-modes mode)))

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump t)
  :hook (evil-mode . hmd/evil-hook)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)

  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal)
  (evil-initialize))
(evil-mode 1) ; should have ran in previous :config but doesnt for some reason

(use-package evil-collection
  :after evil magit
  :config
  (evil-collection-init))

;; evil mode resets these
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode +1)
(column-number-mode)

(add-hook 'gleam-ts-mode-hook #'lsp)
(add-hook 'rust-mode-hook #'lsp)
(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook (
	 (gleam-ts-mode . lsp)
	 (rust-mode . lsp)
	 (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp
  :config
  (setq lsp-auto-configure t))

(use-package lsp-ui :commands lsp-ui-mode)
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)

(use-package projectile
  :config (projectile-mode)
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  (when (file-directory-p "~/Repos"))
  (setq projectile-switch-project-action #'projectile-dired))

(use-package magit
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))


; Syntax Highlighting


(use-package tree-sitter)
(use-package tree-sitter-langs)
(global-tree-sitter-mode)

(use-package gleam-ts-mode
  :after tree-sitter
  :mode (rx ".gleam" eos))

(use-package haskell-mode)

(use-package rust-mode
  :config
  (let ((dot-cargo-bin (expand-file-name "~/.cargo/bin")))
    (setq rust-rustfmt-bin (concat dot-cargo-bin "/rustfmt")
	  rust-cargo-bin (concat dot-cargo-bin "/cargo")
	  rust-format-on-save t)))

(use-package diminish
  :config
  (diminish 'eldoc-mode)
  (diminish 'which-key-mode)
  (diminish 'ivy-mode)
  (diminish 'tree-sitter-mode)
  (diminish 'projectile-mode))
