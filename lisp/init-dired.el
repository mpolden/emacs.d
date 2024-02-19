;;; init-dired.el --- configure dired  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(use-package dired
  :init
  ;; show human readable sizes in dired
  (setq dired-listing-switches "-alh")

  :bind (:map dired-mode-map
              ("C-c r" . dired-toggle-read-only)
              ("M-<up>" . dired-up-directory)
              ("<backspace>" . dired-up-directory)))

(provide 'init-dired)

;;; init-dired.el ends here
