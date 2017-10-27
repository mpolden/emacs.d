(defun org-archive-subtree-and-set-startup-visibility ()
  (interactive)
  (org-archive-subtree)
  (org-set-startup-visibility))

(use-package org
  :ensure nil ;; package is bundled with emacs
  :bind (("C-c a" . org-agenda)
         ("C-c y" . org-archive-subtree-and-set-startup-visibility))
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
  (setq org-log-done 'time)

  ;; default file for capture
  (setq org-default-notes-file (expand-file-name "personal.org" org-directory))

  ;; capture template including title, date and time
  (setq org-capture-templates '(("t" "Task" entry (file+headline "" "Tasks")
                                 "* TODO %?\n  %T\n")))

  ;; automatically mark archived entry as done
  (setq org-archive-mark-done t)

  ;; C-c captures tasks
  (global-set-key (kbd "C-c c") 'org-capture))

(provide 'init-org)
