;;; init-rust.el --- configure rust language support  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(use-package rust-mode
  :ensure t
  :mode ("\\.rs\\'" . rust-mode)
  :bind (:map rust-mode-map
              ("C-c u c" . rust-clippy)
              ("C-c u t" . rust-test)
              ("C-c u r" . rust-run)))

(provide 'init-rust)

;;; init-rust.el ends here
