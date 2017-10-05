(use-package org
  :ensure nil ;; package is bundled with emacs
  :bind ("C-c a" . org-agenda)
  :config
  (setq org-archive-location "::* Archived Tasks"
        org-agenda-files (list org-directory)
        org-refile-targets '((nil :maxlevel . 5) (org-agenda-files :maxlevel . 5))
        org-mobile-directory "~/.mobileorg"
        org-log-done 'time))

(provide 'init-org)
