(require 'python)

;; disable electric indent
(add-hook 'python-mode-hook
          (lambda () (set (make-local-variable 'electric-indent-mode) nil)))

(provide 'init-python-mode)
