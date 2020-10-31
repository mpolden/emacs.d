(use-package rust-mode
  :ensure t
  :init
  (setq rust-format-on-save t)

  :bind (:map rust-mode-map
              ;; C-c p runs rustfmt on the buffer
              ("C-c p" . rust-format-buffer)))

(provide 'init-rust)
