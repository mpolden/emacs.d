;;; init-ghostel.el --- configure ghostel  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(defun mpolden/ghostel-other-window ()
  "Create a new Ghostel buffer in another window.

If `default-directory' is determined to be a project by
`project-current', the Ghostel buffer will be created with
`ghostel-project' instead of `ghostel'."
  (interactive)
  (let ((buf (if (project-current)
                 (ghostel-project)
               (ghostel))))
    (switch-to-buffer (other-buffer buf))
    (switch-to-buffer-other-window buf)))

(use-package ghostel
  :ensure t
  :bind (("C-c s" . mpolden/ghostel-other-window)))

;;; init-ghostel.el ends here
