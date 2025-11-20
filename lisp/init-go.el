;;; init-go.el --- configure go language support  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(defun mpolden/go-mode-buffer-local-variables ()
  "Set buffer-local variables for `go-mode'."
  (setq-local fill-column 120
              compile-command "go test "))

(use-package go-mode
  :ensure t
  :hook (go-mode . mpolden/go-mode-buffer-local-variables)
  :config
   ;; match trace paths printed by github.com/stretchr/testify
  (add-to-list 'compilation-error-regexp-alist 'go-testify)
  (add-to-list 'compilation-error-regexp-alist-alist
               '(go-testify . ("^\\s-+\\(?:Error Trace:\\s-+\\)?\\([^()\t\n]+\\):\\([0-9]+\\)$" 1 2))
               t))

(provide 'init-go)

;;; init-go.el ends here
