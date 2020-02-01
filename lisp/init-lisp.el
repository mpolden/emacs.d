(use-package paredit
  :config
  ;; enable paredit in emacs-lisp-mode
  :hook ((emacs-lisp-mode . paredit-mode)))

;; diminish eldoc from mode line
(use-package eldoc
  :ensure nil ;; package is bundled with emacs
  :diminish)

(provide 'init-lisp)
