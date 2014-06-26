(require 'python)

(add-hook 'python-mode-hook
          (lambda ()
            ;; disable eletric-indent
            (set (make-local-variable 'electric-indent-mode) nil)
            ;; highlight lines longer than 79 characters (pep8)
            (set (make-local-variable 'whitespace-line-column) 79)
            ;; use flat index in imenu
            (set (make-local-variable 'imenu-create-index-function)
                 'python-imenu-create-flat-index)))

(provide 'init-python-mode)
