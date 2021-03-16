;;; init-rust.el --- configure rust language support
;;; Commentary:
;;; Code:

(use-package rust-mode
  :ensure t
  :bind (:map rust-mode-map
              ("C-c l" . rust-clippy)
              ("C-c t" . rust-test)
              ("C-c R" . rust-run)))

(provide 'init-rust)

;;; init-rust.el ends here
