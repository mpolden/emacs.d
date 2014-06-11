;; install package
(require-package 'yaml-mode)

;; load yaml-mode
(require 'yaml-mode)

;; disable electric indent
(add-hook 'yaml-mode-hook
          (lambda () (set (make-local-variable 'electric-indent-mode) nil)))

(provide 'init-yaml-mode)
