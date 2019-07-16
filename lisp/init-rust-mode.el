(use-package rust-mode
  :init
  (setq rust-format-on-save t)

  :bind (:map rust-mode-map
              ;; C-c p runs rustfmt on the buffer
              ("C-c p" . rust-format-buffer)))

;; configure flycheck to support cargo project layout
(use-package flycheck-rust
  :commands flycheck-rust-setup
  :after (flycheck rust-mode)
  :hook ((flycheck-mode . flycheck-rust-setup)))

(provide 'init-rust-mode)
