;;; init-eshell.el --- configure eshell  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(defun mpolden/eshell-other-window ()
  "Create a new Eshell buffer in another window.

If `default-directory' is determined to be a project by
`project-current', the Eshell buffer will be created with
`project-eshell' instead of `eshell'."
  (interactive)
  (let ((buf (if (project-current)
                 (project-eshell)
               (eshell))))
    (switch-to-buffer (other-buffer buf))
    (switch-to-buffer-other-window buf)))

(use-package eshell
  :bind (("C-c e" . mpolden/eshell-other-window)))

(provide 'init-eshell)

;;; init-eshell.el ends here
