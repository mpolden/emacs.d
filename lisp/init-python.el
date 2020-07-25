(defun python-mode-buffer-local-variables ()
  ;; highlight lines longer than 88 characters
  (setq-local fill-column 88)
  ;; use flat index in imenu
  (setq-local imenu-create-index-function
              'python-imenu-create-flat-index))

(use-package python
  :commands python-mode
  :hook (python-mode . python-mode-buffer-local-variables)
  :config
  ;; use flake8 as flymake backend
  (setq python-flymake-command '("flake8" "-"))

  ;; prefer python3 interpreter
  (when (executable-find "python3")
    (setq python-shell-interpreter "python3")))

(provide 'init-python)
