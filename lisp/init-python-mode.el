(require 'python)

(add-hook 'python-mode-hook
          (lambda ()
            ;; disable eletric-indent
            (set (make-local-variable 'electric-indent-mode) nil)
            ;; highlight lines longer than 79 characters (pep8)
            (set (make-local-variable 'whitespace-line-column) 79)))

(provide 'init-python-mode)
