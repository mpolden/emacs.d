(use-package go-mode
  :init
  ;; use goimports if available
  (when (executable-find "goimports")
    (setq gofmt-command "goimports"))

  :bind (:map go-mode-map
         ;; C-c p runs gofmt on the buffer
         ("C-c p" . gofmt))

  :config
  ;; run gofmt before saving file
  (add-hook 'before-save-hook 'gofmt-before-save)
  (add-hook 'go-mode-hook
            (lambda ()
              ;; adjust fill-column
              (setq-local fill-column 120))))

(provide 'init-go-mode)
