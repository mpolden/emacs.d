(use-package rust-mode
  :init
  (setq rust-format-on-save t)

  :bind (:map rust-mode-map
              ;; C-c p runs rustfmt on the buffer
              ("C-c p" . rust-format-buffer)))

;; configure flycheck to support cargo project layout
(use-package flycheck-rust
  :after (flycheck rust-mode)
  :config
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

(provide 'init-rust-mode)
