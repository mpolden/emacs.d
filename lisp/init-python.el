;;; init-python.el --- configure python language support  -*- lexical-binding:t -*-
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
  :mode ("\\.py\\'" . python-mode)
  :hook (python-mode . mpolden/python-mode-buffer-local-variables)
  :config
  ;; set prefered interpreter
  (setq python-shell-interpreter (or (executable-find "ipython")
                                     (executable-find "python3")
                                     (executable-find "python"))))

(provide 'init-python)

;;; init-python.el ends here
