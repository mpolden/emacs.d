;;; init-rust.el --- configure rust language support  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(use-package rustic
  :ensure t
  :config
  (setq rustic-lsp-client 'eglot)
  (setq rustic-format-on-save t))

(provide 'init-rust)

;;; init-rust.el ends here
