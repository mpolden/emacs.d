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

;; used by ghostel to dispatch OSC 9 / OSC 777 notifications
(use-package alert
  :ensure t
  :init
  (when (eq system-type 'darwin)
    (setq alert-default-style 'osx-notifier)))

(use-package ghostel
  :ensure t
  :init
  (when (and (boundp 'mpolden/path-from-shell)
             (file-executable-p mpolden/path-from-shell))
    (setopt ghostel-shell mpolden/path-from-shell))
  ;; do not pass through C-g
  (setopt ghostel-keymap-exceptions '("C-c" "C-x" "C-u" "C-h" "M-x" "M-:" "C-\\" "C-g"))
  :bind (("C-c e e" . mpolden/ghostel-other-window)
         ("C-c e l" . ghostel-list-buffers)
         ("C-c e c" . ghostel-compile)))

(provide 'init-ghostel)

;;; init-ghostel.el ends here
