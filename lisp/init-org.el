(use-package org
  :ensure nil ;; package is bundled with emacs
  :bind ("C-c a" . org-agenda)
  :config
  ;; name of subtree where archived tasks should be moved
  (setq org-archive-location "::* Archived Tasks")

  ;; display all org files in agenda
  (setq org-agenda-files (list org-directory))

  ;; refile targets 1 level in current buffer and all org agenda files
  (setq org-refile-targets '((nil :maxlevel . 1) (org-agenda-files :maxlevel . 1)))

  ;; path used by org-mobile-push and org-mobile-pull
  ;; should be the path that mobileorg uploads to, e.g. a mounted webdav share
  (setq org-mobile-directory "~/.mobileorg")

  ;; record time when moving a task to done state
  (setq org-log-done 'time))

(provide 'init-org)
