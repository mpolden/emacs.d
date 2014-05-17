;; install package
(require-package 'org)

;; load org
(require 'org)

;; set default location for org files
(let ((dirname "~/Dropbox/org"))
  (when (file-directory-p dirname)
    (setq org-directory dirname)))

(provide 'init-org)
