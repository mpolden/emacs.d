;;; init-ghostel.el --- configure ghostel  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(defun mpolden/ghostel-other-window (&optional arg)
  "Create a new Ghostel buffer in another window.

If `default-directory' is determined to be a project by
`project-current', the Ghostel buffer will be created with
`ghostel-project' instead of `ghostel'.

ARG is the prefix argument, forwarded to `ghostel-project' or
`ghostel'."
  (interactive "P")
  (let ((buf (if (project-current)
                 (ghostel-project arg)
               (ghostel arg))))
    (switch-to-buffer (other-buffer buf))
    (switch-to-buffer-other-window buf)))

(use-package ghostel
  :ensure t
  :init
  (when (and (boundp 'mpolden/path-from-shell)
             (file-executable-p mpolden/path-from-shell))
    (setq ghostel-shell mpolden/path-from-shell))
  :bind (("C-c s" . mpolden/ghostel-other-window)))

(provide 'init-ghostel)

;;; init-ghostel.el ends here
