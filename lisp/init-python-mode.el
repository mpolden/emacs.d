(require 'python)

(add-hook 'python-mode-hook
          (lambda ()
            ;; disable electric indent
            (setq-local electric-indent-mode nil)
            ;; highlight lines longer than 79 characters (pep8)
            (setq-local fill-column 79)
            ;; use flat index in imenu
            (setq-local imenu-create-index-function
                        'python-imenu-create-flat-index)))

(provide 'init-python-mode)
