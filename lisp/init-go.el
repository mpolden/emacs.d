(defun go-mode-buffer-local-variables ()
  ;; adjust fill-column
  (setq-local fill-column 120))

(use-package go-mode
  :ensure t
  :hook (go-mode . go-mode-buffer-local-variables))

(provide 'init-go)
