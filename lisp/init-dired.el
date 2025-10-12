;;; init-dired.el --- configure dired  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(defcustom mpolden/dired-safe-switches "-Alh"
  "The `dired-listing-switches' supported by modern systems."
  :type 'string)

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

(defun mpolden/dired-group-directories-first ()
  "Return non-nil if `insert-directory-program' supports --group-directories-first."
  (or (eq system-type 'gnu/linux)
      (equal insert-directory-program "gls")
      (equal insert-directory-program "gnuls")))

(defun mpolden/dired-compatible-listing-switches ()
  "Ensure compatible ls options are used for remote buffers."
  (if (and (file-remote-p default-directory)
           (not (string-prefix-p
                 "Linux "
                 (tramp-get-connection-property
                  (tramp-dissect-file-name default-directory) "uname" nil))))
      (setq dired-actual-switches mpolden/dired-safe-switches)
    (setq dired-actual-switches dired-listing-switches)))

(use-package dired
  :init
  ;; show human readable sizes in dired
  (if (mpolden/dired-group-directories-first)
      (setopt dired-listing-switches
              (concat mpolden/dired-safe-switches
                      " --group-directories-first"))
    (setopt dired-listing-switches mpolden/dired-safe-switches))

  ;; register renames in version control
  (setopt dired-vc-rename-file t)

  ;; guess default target directory for moves
  (setopt dired-dwim-target t)

  ;; ensure compatible ls options are used
  :hook
  ((dired-before-readin . mpolden/dired-compatible-listing-switches))

  :bind (:map dired-mode-map
              ("C-c r" . dired-toggle-read-only)
              ("C-c o" . mpolden/dired-open-or-shell-command)
              ("M-<up>" . dired-up-directory)
              ("<backspace>" . dired-up-directory)))

(provide 'init-dired)

;;; init-dired.el ends here
