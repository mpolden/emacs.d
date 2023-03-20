;;; init-python.el --- configure python language support  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(defun mpolden/python-mode-buffer-local-variables ()
  "Set buffer-local variables for `python-mode'."
  ;; highlight lines longer than 88 characters
  (setq-local fill-column 88)
  ;; use flat index in imenu
  (setq-local imenu-create-index-function
              'python-imenu-create-flat-index)
  ;; use virtualenv if it exists
  (let ((venv-parent (locate-dominating-file default-directory "venv")))
    (setq-local python-shell-virtualenv-root (expand-file-name "venv" venv-parent))))

(use-package python
  :mode ("\\.py\\'" . python-mode)
  :hook (python-mode . mpolden/python-mode-buffer-local-variables))

(provide 'init-python)

;;; init-python.el ends here
