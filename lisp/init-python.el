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
  (setq python-shell-interpreter (cond ((executable-find "ipython3") "ipython3")
                                       ((executable-find "python3") "python3")
                                       t "python"))
  ;; ipython needs --simple-prompt for emacs compatibility
  ;; https://emacs.stackexchange.com/a/24572
  (when (equal python-shell-interpreter "ipython3")
    (setq python-shell-interpreter-args "-i --simple-prompt")))

(provide 'init-python)

;;; init-python.el ends here
