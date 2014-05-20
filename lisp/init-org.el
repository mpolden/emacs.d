;; install package
(require-package 'org)

;; load org
(require 'org)

;; set org directory and default notes file
(let ((dirname "~/Dropbox/org"))
  (when (file-directory-p dirname)
    (setq org-directory dirname
          org-default-notes-file (concat org-directory "/notes.org"))))

(global-set-key (kbd "C-c c") 'org-capture)

(provide 'init-org)
