(use-package flycheck
  :init
  ;; disable noisy checkers
  (setq-default flycheck-disabled-checkers
                '(emacs-lisp emacs-lisp-checkdoc go-golint))

  :config
  (global-flycheck-mode 1))

(provide 'init-flycheck)
