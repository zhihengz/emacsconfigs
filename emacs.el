;; $HOME/.emacs
;;
;; bare minimum configuration for emacs, individual configurations should be distributed
;; in .emacs.d/profiles/{public, private}
;;
;; common lisp for emacs
 (require 'cl)

;; package management
(load "package")
(package-initialize)
;; change gnu to use https
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")))
;; add anything else
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
;; default packages to bootstrap everything else
(defvar local/packages '(load-dir
			 use-package)
  "Default packages")

(defun local/packages-installed-p ()
  (loop for pkg in local/packages
        when (not (package-installed-p pkg)) do (return nil)
        finally (return t)))

(unless (local/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg local/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;; use-package wraps package installation and configuration
(require 'use-package)
;; prefer user-package to home-grown function below
;; this only suits when use-package is not working
(defun local/ensure-package-loaded (pkg)
  "ensure a package is installed"
  (when (not (package-installed-p pkg))
    (message "installing %s ..." pkg)
    (package-refresh-contents)
    (package-install pkg)))

;; load profiles
;; any non-sensitive profiles should go to .emacs.d/profiles/public
;; while private and/or sensitive profiles should go to .emacs.d/profiles/private
(setq load-dirs '("~/.emacs.d/profiles/public"
		 "~/.emacs.d/profiles/private"))
;; decentralize configurations with load-dir
(require 'load-dir)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default)))
 '(package-selected-packages
   (quote
    (origami puppet-mode yasnippet clojure-mode rust-mode go-mode dirtree yasnippet-snippets scala-mode yaml-mode mustache-mode solarized-theme load-dir elpy autopair)))
 '(python-guess-indent nil)
 '(python-indent-offset 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )