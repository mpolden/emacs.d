(use-package org
  :ensure nil ;; package is bundled with emacs
  :bind (("C-c c" . org-capture)
         ("C-c a" . org-agenda)
         ("C-c l" . org-store-link)
         ("C-c f" . org-indent-region)
         ("C-c o a" . org-archive-subtree)
         ("C-c o s" . org-save-all-org-buffers))
  :config
  ;; file and tree where archived tasks should be moved
  (setq org-archive-location "%s_archive::* Archived Tasks")

  ;; save archive file when archiving
  (unless (version< org-version "9.4")
    (setq org-archive-subtree-save-file-p t))

  ;; sparse tree construction shows matches in archived trees
  (setq org-sparse-tree-open-archived-trees t)

  ;; display all org files in agenda
  (setq org-agenda-files (list org-directory))

  ;; refile targets 1 level in current buffer and all org agenda files
  (setq org-refile-targets '((nil :maxlevel . 2) (org-agenda-files :maxlevel . 1)))

  ;; record time when moving a task to done state
  (setq org-log-done 'time)

  ;; default file for capture
  (setq org-default-notes-file (expand-file-name "personal.org" org-directory))

  ;; capture template including title, date and time
  (setq org-capture-templates '(("p" "Personal" entry (file+olp "" "Tasks")
                                 "* TODO %?\n  %U"
                                 :prepend t
                                 :empty-lines-after 1)
                                ("w" "Work" entry (file+olp "work.org" "Tasks")
                                 "* TODO %?\n  %U"
                                 :prepend t
                                 :empty-lines-after 1)))

  ;; automatically mark archived entry as done
  (setq org-archive-mark-done t)

  ;; highlight code blocks
  (setq org-src-fontify-natively t)

  ;; indent code blocks the same way as the language major mode
  (setq org-src-tab-acts-natively t)

  ;; define todo states
  (setq org-todo-keywords '((sequence "TODO(t)" "WAIT(w)" "DONE(d)")))

  ;; disallow invisible edits
  (setq org-catch-invisible-edits 'error)

  ;; complete tags from all agenda files
  (setq org-complete-tags-always-offer-all-agenda-tags t)

  ;; search headlines via completion
  (setq org-goto-interface 'outline-path-completion)

  ;; include the full path when searching headlines
  (setq org-outline-path-complete-in-steps nil)

  ;; hide todo entries whose deadline is far away according to
  ;; org-deadline-warning-days
  (setq org-agenda-todo-ignore-deadlines 'far)

  ;; hide todo entries scheduled in the future
  (setq org-agenda-todo-ignore-scheduled 'future)

  ;; include two weeks in agenda
  (setq org-agenda-span 'fortnight)

  ;; customize agenda
  (setq org-agenda-custom-commands
        '(;; default view
          ("n" "Agenda and all TODOs" ((agenda "") (alltodo "")))
          ;; split by state
          ("m" "Agenda and all TODOs split by state"
           ((agenda "") (todo "TODO") (todo "WAIT"))))))

(provide 'init-org)
