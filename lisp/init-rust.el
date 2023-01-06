;;; init-rust.el --- configure rust language support  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(use-package rustic
  :ensure t
  :config
  (setq rustic-lsp-client 'eglot))

(provide 'init-rust)

;;; init-rust.el ends here
