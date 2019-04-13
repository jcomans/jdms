;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; General configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Appearance
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Disable the anoying splash screen

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq inhibit-splash-screen t)

;; Set a black background
(add-to-list 'default-frame-alist '(background-color . "black"))
(add-to-list 'default-frame-alist '(foreground-color . "wheat"))

;; Monospace 8 seems to be nice for linux machines
(set-default-font "Monospace-8")

;; Disable the tool bar
(tool-bar-mode -1)
;; Disable the menu bar
(menu-bar-mode -1)

;; Don't highlight the marked region
(transient-mark-mode -1)

;; Show line and column number in status bar
(setq line-number-mode t)
(setq column-number-mode t)
;; Show the time and date in status bar
(setq display-time-day-and-date t)
(setq display-time-24hr-format  t)
(display-time)

;; Always show line numbers except in doc-view-mode
(define-global-minor-mode my-global-linum-mode linum-mode
  (lambda ()
    (when (not (memq major-mode
		     (list 'doc-view-mode)))
      (linum-mode))))

(my-global-linum-mode t)

;; Show matching parentheses
(show-paren-mode 1)

;; Never use tabs
(setq-default indent-tabs-mode nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Behavior
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Disable backup files
(setq make-backup-files nil
      auto-save-default nil
      auto-save-list-file-prefix nil)
;; If we enable backups, put them in a separate dir without
;; version numbers
(setq version-control nil)
(setq backup-directory-alist (quote ((".*" . "~/.emacs_backups/"))))

;; Always keep buffers in sync with files on disk
(global-auto-revert-mode 1)

;; Make sure dired doesn't open a new buffer each time
(put 'dired-find-alternate-file 'disabled nil)

;; Enable IDO
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode t)

;; Enable 'advanced' commands
(put 'upcase-region 'disabled nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Packages
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))

(require 'lsp-mode)
(add-hook 'prog-mode-hook #'lsp)

(require 'company-lsp)
(push 'company-lsp company-backends)



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (cmake-mode magit yasnippet company-lsp lsp-ui company flycheck lsp-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
