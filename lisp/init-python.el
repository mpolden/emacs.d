(defun python-mode-buffer-local-variables ()
  ;; highlight lines longer than 88 characters
  (setq-local fill-column 88)
  ;; use flat index in imenu
  (setq-local imenu-create-index-function
              'python-imenu-create-flat-index))

(use-package python
  :ensure nil ;; package is bundled with emacs
  :commands python-mode
  :hook (python-mode . python-mode-buffer-local-variables)
  :config
  ;; use flake8 as flymake backend
  (setq python-flymake-command '("flake8" "-")))

(provide 'init-python)
