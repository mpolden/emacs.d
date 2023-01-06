;;; init-rust.el --- configure rust language support  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(use-package rustic
  :ensure t
  :init
  ;; let init-eglot handle lsp integration
  (setq rustic-lsp-setup-p nil)
  (setq rustic-lsp-client 'eglot))

(provide 'init-rust)

;;; init-rust.el ends here
