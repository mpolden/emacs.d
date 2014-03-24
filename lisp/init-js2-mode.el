;; install package
(require-package 'js2-mode)

;; load js2-mode
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; prefer 2 space indent
(setq-default js2-basic-offset 2)

(provide 'init-js2-mode)
