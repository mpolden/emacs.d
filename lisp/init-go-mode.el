;; install package
(require-package 'go-mode)

;; load go-mode
(require 'go-mode-load)

;; soft tabs or death
(add-hook 'go-mode-hook (lambda () (setq indent-tabs-mode nil)))

(provide 'init-go-mode)
