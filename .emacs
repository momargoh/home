;; INSTALL PACKAGES
;; --------------------------------------
;; Yapfify
;; Requirements: sudo apt install yapf
(add-to-list 'load-path "~/packages/yapfify/")
(require 'yapfify)
(add-hook 'python-mode-hook 'yapf-mode)
(add-hook 'cython-hook 'yapf-mode)
(add-to-list 'load-path "~/.local/bin/")
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(better-defaults
    elpy
    flycheck
    material-theme
    ))

(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      myPackages)
;; BASIC CUSTOMIZATION
;; --------------------------------------

;; Interactively Do Things (highly recommended, but not strictly required)

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'ido)
(ido-mode t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cua-mode t nil (cua-base))
 '(package-selected-packages
   (quote
    (rjsx-mode js2-mode neotree d-mode cython-mode yapfify material-theme flycheck elpy better-defaults))))
(setq inhibit-startup-message t) ;; hide the startup message
(load-theme 'material t) ;; load material theme
(global-linum-mode t) ;; enable line numbers globally
(tool-bar-mode 1) ;; show tool-bar
(menu-bar-mode 1) ;; show menu-bar
(scroll-bar-mode 1) ;; show scroll-bar
(neotree)

;; ELPY CONFIGURATION
;; --------------------------------------
;; Requirements: pip3 install rope jedi flake8 autopep8 yapf
(package-initialize)
(elpy-enable)
;; change to Python3
(setq elpy-rpc-python-command "python3")
(setq python-shell-interpreter "python3")

;; use flycheck not flymake with elpy
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Javascript
(add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode))
