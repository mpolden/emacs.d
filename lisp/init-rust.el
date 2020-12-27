(use-package rust-mode
  :ensure t
  :init
  (when (executable-find "rustfmt")
    (setq rust-format-on-save t))

  :bind (:map rust-mode-map
              ;; C-c f runs rustfmt on the buffer
              ("C-c f" . rust-format-buffer)
              ("C-c l" . rust-clippy)
              ("C-c t" . rust-test)
              ("C-c R" . rust-run)))

(provide 'init-rust)
