;;; init-dired.el --- configure dired  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(defun mpolden/dired-open-or-shell-command ()
  "Open marked files with the default external program.

If PATH does not contain a suitable command for opening external
programs, or a prefix argument is given, this function instead
prompts for a shell command."
  (interactive)
  (let ((open (and (not current-prefix-arg)
                   (or (executable-find "open")
                       (executable-find "xdg-open")))))
    (if open
        (dired-do-shell-command open nil (dired-get-marked-files t))
      (call-interactively 'dired-do-shell-command))))

(use-package dired
  :init
  ;; show human readable sizes in dired
  (setq dired-listing-switches "-alh")

  ;; register renames in version control
  (setq dired-vc-rename-file t)

  ;; guess default target directory for moves
  (setq dired-dwim-target t)

  :bind (:map dired-mode-map
              ("C-c r" . dired-toggle-read-only)
              ("C-c o" . mpolden/dired-open-or-shell-command)
              ("M-<up>" . dired-up-directory)
              ("<backspace>" . dired-up-directory)))

(provide 'init-dired)

;;; init-dired.el ends here
