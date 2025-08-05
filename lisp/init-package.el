;;; init-package.el --- configure package management  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(defcustom mpolden/inhibited-features nil
  "List of features that should not be loaded."
  :type '(repeat symbol))

(defun mpolden/maybe-require (feature)
  "Load FEATURE if it's not inhibited."
  (unless (memq feature mpolden/inhibited-features)
    (require feature)))

;; add melpa repo
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; support hiding minor modes from modeline
(use-package diminish
  :ensure t)

(provide 'init-package)

;;; init-package.el ends here
