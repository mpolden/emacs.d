(defun rust-mode-buffer-local-variables ()
  ;; eglot passes tab-width as tab size when formatting code, when using rustfmt
  ;; this should be 4
  (setq-local tab-width 4))

(use-package rust-mode
  :ensure t
  :hook (rust-mode . rust-mode-buffer-local-variables)
  :bind (:map rust-mode-map
              ("C-c l" . rust-clippy)
              ("C-c t" . rust-test)
              ("C-c R" . rust-run)))

(provide 'init-rust)
