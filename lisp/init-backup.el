;; write backup files to separate directory
(let ((dirname (expand-file-name
               (concat user-emacs-directory "backups"))))
  (if (not (file-directory-p dirname))
      (make-directory dirname t))
  (setq backup-directory-alist
        `(("." . , dirname))))

;; version control backups
(setq delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

(provide 'init-backup)
