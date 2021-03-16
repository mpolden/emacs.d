;;; init-python.el --- configure python language support
;;; Commentary:
;;; Code:

(defun mpolden/python-mode-buffer-local-variables ()
  "Set buffer-local variables for `python-mode'."
  ;; highlight lines longer than 88 characters
  (setq-local fill-column 88)
  ;; use flat index in imenu
  (setq-local imenu-create-index-function
              'python-imenu-create-flat-index))

(use-package python
  :commands python-mode
  :hook (python-mode . mpolden/python-mode-buffer-local-variables)
  :config
  ;; prefer flake8 as flymake backend
  (when (executable-find "flake8")
    (setq python-flymake-command '("flake8" "-")))

  ;; prefer python3 interpreter
  (when (executable-find "python3")
    (setq python-shell-interpreter "python3")))

(provide 'init-python)

;;; init-python.el ends here
