;;; init-package.el --- configure package management  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

;; add melpa repo
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

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
