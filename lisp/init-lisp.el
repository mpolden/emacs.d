(use-package paredit
  :ensure t
  :config
  ;; enable paredit in emacs-lisp-mode
  :hook ((emacs-lisp-mode . paredit-mode)))

;; diminish eldoc from mode line
(use-package eldoc
  :diminish)

(provide 'init-lisp)
