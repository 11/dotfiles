;(indent-relative-maybe)
;
;; LOAD PACKAGE MANAGERS
;;

(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ;; melpa-stable is useful when a package install fails from default melpa
			 ;; ("melpa-stable" . "http://stable.melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents)) ;; pull latest URLs and builds from package managers when opening emacs




;;
;; BUILT-IN EDITOR SETTINGS
;;

(tool-bar-mode -1) ;; remove toolbar

(set-face-attribute 'default nil :height 190) ;; set font size

(add-hook 'before-save-hook 'delete-trailing-whitespace) ;; delete trailing whitespace on save

(global-display-line-numbers-mode) ;; add line numbers
(global-set-key (kbd "C-x C-c") 'compile) ;; run compile command with C-x C-c
(global-set-key (kbd "TAB") 'tab-to-tab-stop) ;; will prevent line from over tabbing more than previous line

(customize-set-variable 'scroll-bar-mode nil) ;; hide vertical scrollbar
(customize-set-variable 'horizontal-scroll-bar-mode nil) ;; hide hortizonal scrollbar

(setq-default tab-width 2) ;; sets default tab width to 2 spaces
(setq-default electric-indent-inhibit t) ;; make auto-indenting sane
(setq tab-stop-list (number-sequence 2 200 2)) ;; every tab will only add 2 more spaces than the one previous
(setq indent-tabs-mode nil) ;; use spaces insted of tabs
(setq web-mode-markup-indent-offset 2) ;; default tab width is 2 for HTML
(setq web-mode-css-indent-offset 2) ;; default tab width is 2 for css
(setq web-mode-code-indent-offset 2) ;; default tab width is 2 for javascript and php
(setq custom-safe-themes t) ;; consider all downloaded themes as safe-to-run .elp files
(setq inhibit-startup-screen t) ;; skip over welcome screen on startup
(setq ring-bell-function 'ignore) ;; turn off bell sound
;; (setq default-directory "~/Code/") ;; set default dired root directory to ~/Code
(setq mac-command-modifier 'control) ;; use mac cmd key as ctrl key
(setq special-display-function ;; idk, but it does something important with buffers
  (lambda (buffer &optional args)
    (split-window)
    (switch-to-buffer buffer)
    (get-buffer-window buffer 0)))

(dired ".") ;; open emacs in dired mode - `./` will refer to `~/Code` in this context



;;
;; LANGUAGE SPECIFIC SETTINGS
;;

(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))   ;; turn on web-mode (syntax-highlighting) when opening .js file
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))  ;; turn on web-mode (syntax-highlighting) when opening .jsx file
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode)) ;; turn on web-mode (syntax-highlighting) when opening .html file
(add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))  ;; turn on web-mode (syntax-highlighting) when opening .css file

(setenv "PATH" (concat (getenv "PATH") ":" (expand-file-name "~/.cargo/bin"))) ;; adds cargo to emacs terminal PATH
(setq exec-path (append exec-path (list (expand-file-name "~/.cargo/bin")))) ;; refer to cargo from emaacs PATH




;;
;; CUSTOM PACKAGES SETTINGS
;;

(load-theme 'gruvbox-dark-hard) ;; turn on gruvbox theme


(use-package fira-code-mode ;; use fira-code as default theme
  :custom (fira-code-mode-disabled-ligatures '("[]" "x")) ;; ligatures you don't want
  :hook prog-mode) ;; mode to enable fira-code-mode in


(use-package evil ;; vim settings
  :ensure t
  :init
  (setq evil-want-C-u-scroll t)
  (setq evil-want-keybinding nil)
  :config (evil-mode 1)
  (use-package key-chord ;; package that allows me to use jj to esc in evil-mode
    :ensure t
    :config
    (key-chord-mode 1)
    (key-chord-define evil-insert-state-map  "jj" 'evil-normal-state))
  (use-package evil-leader ;; package includes evil-magit
    :ensure t
    :init
    (global-evil-leader-mode))
  (use-package evil-collection ;; evil-collection is the offical package that installs evil-magit
    :custom (evil-collection-setup-minibuffer t)
    :init (evil-collection-init)))


(use-package magit ;; emacs git client
  :ensure t
  :commands (magit-status magit-get-current-branch)
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))


(use-package projectile ;; package for fuzzy search & project management commands
  :ensure t
  :config (projectile-mode)
  :custom ((projectile-compeltion-system 'ivy))
  :bind-keymap
  ("C-c p" . projectile-command-map))


(use-package counsel-projectile ;; adds less strict fuzzy search to projectile
  :ensure t
  :config (counsel-projectile-mode))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(markdown-mode web-mode use-package terraform-mode solarized-theme smart-compile rust-mode naysayer-theme magit key-chord gruvbox-theme flatland-theme fira-code-mode evil-vimish-fold evil-leader evil-collection counsel-projectile color-theme buffer-move all-the-icons)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
