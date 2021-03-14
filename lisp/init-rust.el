(use-package rust-mode
  :ensure t
  :bind (:map rust-mode-map
              ("C-c l" . rust-clippy)
              ("C-c t" . rust-test)
              ("C-c R" . rust-run)))

(provide 'init-rust)
