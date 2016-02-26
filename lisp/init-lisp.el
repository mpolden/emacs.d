(use-package paredit
  :config
  ;; enable paredit in emacs-lisp-mode
  (add-hook 'emacs-lisp-mode-hook 'paredit-mode))

(provide 'init-lisp)
