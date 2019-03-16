(use-package flycheck
  :init
  ;; disable noisy checkers
  (setq-default flycheck-disabled-checkers
                '(emacs-lisp emacs-lisp-checkdoc go-golint))

  ;; prefer python 3
  (let ((python "python3"))
    (when (executable-find python)
      (setq flycheck-python-flake8-executable python
            flycheck-python-pycompile-executable python
            flycheck-python-pylint-executable python)))

  :config
  (global-flycheck-mode 1))

(provide 'init-flycheck)
