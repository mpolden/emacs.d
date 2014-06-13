;; write backup files to separate directory
(let ((dirname (expand-file-name
               (concat user-emacs-directory "backups"))))
  (when (not (file-directory-p dirname))
    (make-directory dirname t))
  (setq backup-directory-alist
        `((".*" . ,dirname)))
  (setq auto-save-file-name-transforms
        `((".*" ,dirname t))))

;; version control backups
(setq delete-old-versions t
      version-control t)

(provide 'init-backup)
