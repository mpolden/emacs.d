;;; init-go.el --- configure go language support  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(defun mpolden/go-mode-buffer-local-variables ()
  "Set buffer-local variables for `go-mode'."
  (setq-local fill-column 120
              compile-command "go test"))

(use-package go-mode
  :ensure t
  :mode ("\\.go\\'" . go-mode)
  :hook (go-mode . mpolden/go-mode-buffer-local-variables))

(provide 'init-go)

;;; init-go.el ends here
