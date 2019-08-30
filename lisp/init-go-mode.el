(use-package go-mode
  :init
  :config
  (add-hook 'go-mode-hook
            (lambda ()
              ;; adjust fill-column
              (setq-local fill-column 120))))

(provide 'init-go-mode)
