(defun dired-open-or-shell-command ()
  (interactive)
  (if (eq system-type 'darwin)
      ;; call open directly on darwin
      (dired-do-shell-command "open" nil (dired-get-marked-files t))
    ;; otherwise prompt for shell command
    (call-interactively 'dired-do-shell-command)))

(use-package dired
  :init
  ;; show human readable sizes in dired and sort dotfiles first
  (setq dired-listing-switches "-alhv")

  ;; show human readable free space
  (setq directory-free-space-args "-h")

  :bind (("M-<up>" . dired-up-directory)
         ("C-c C-o" . dired-open-or-shell-command))

  :config
  ;; group directories first in dired if supported
  (when (eq 0 (call-process insert-directory-program
                            nil nil nil "--group-directories-first"))
    (setq dired-listing-switches (concat dired-listing-switches
                                         " --group-directories-first"))))

(provide 'init-dired)
