;;; init-package.el --- configure package management  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

;; add melpa repo
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; emacs and gnutls has recurring issues with tls 1.3
;; the original bug was supposedly fixed in 26.3, but resurfaced in 27.2 on
;; macos (https://emacsformacosx.com build)
;;
;; https://debbugs.gnu.org/cgi/bugreport.cgi?bug=34341
;; https://www.reddit.com/r/emacs/comments/mk0luk/does_anyone_know_how_to_diagnose_or_fix_emacs_not/
;;
;; disable tls 1.3 if supported by gnutls
(when (and (< emacs-major-version 28)
           (>= libgnutls-version 30603))
  (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3"))

(defun mpolden/require-package (package)
  "Install given PACKAGE if it's not already installed."
  (unless (package-installed-p package)
    (unless (assoc package package-archive-contents)
      (package-refresh-contents))
    (package-install package)))

(defvar mpolden/inhibited-features nil "List of features that should not be loaded.")

(defun mpolden/maybe-require (feature)
  "Load FEATURE if it's not inhibited."
  (unless (memq feature mpolden/inhibited-features)
    (require feature)))

;; install use-package and diminish
(mpolden/require-package 'use-package)
(mpolden/require-package 'diminish)

;; speed up loading of use-package and dependencies
(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)

(provide 'init-package)

;;; init-package.el ends here
