;;; init-vterm.el --- configure vterm  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(use-package vterm
  :ensure t
  :init
  ;; include current directory in buffer name
  (setq vterm-buffer-name-string "vterm %s"))

(provide 'init-vterm)

;;; init-vterm.el ends here
