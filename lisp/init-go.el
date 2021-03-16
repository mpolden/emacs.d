(defun mpolden/go-mode-buffer-local-variables ()
  ;; adjust fill-column
  (setq-local fill-column 120))

(use-package go-mode
  :ensure t
  :hook (go-mode . mpolden/go-mode-buffer-local-variables))

(provide 'init-go)
