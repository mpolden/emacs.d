;; install package
(require-package 'org)

;; load org
(require 'org)

;; set default location for org files
(let ((dirname "~/Dropbox/org"))
  (if (file-directory-p dirname)
      (setq org-directory dirname)))

(provide 'init-org)
