(use-package paredit
  :config
  ;; enable paredit in emacs-lisp-mode
  :hook ((emacs-lisp-mode . paredit-mode)))

(provide 'init-lisp)
