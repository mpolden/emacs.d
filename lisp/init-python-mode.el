(use-package python
  :ensure nil ;; package is bundled with emacs

  :config
  (add-hook 'python-mode-hook
          (lambda ()
            ;; disable electric indent
            (setq-local electric-indent-mode nil)
            ;; highlight lines longer than 88 characters
            (setq-local fill-column 88)
            ;; use flat index in imenu
            (setq-local imenu-create-index-function
                        'python-imenu-create-flat-index))))

(provide 'init-python-mode)
