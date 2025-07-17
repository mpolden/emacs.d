;;; init-org.el --- configure org  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(defun mpolden/org-goto ()
  "Jump to an Org heading.

Uses `consult-org-heading' if available, and otherwise falls back
to `org-goto'."
  (interactive)
  (if (functionp 'consult-org-heading)
      (call-interactively 'consult-org-heading)
    (org-goto)))

(use-package org
  :mode ("\\.org\\'" . org-mode)
  :bind (("C-c c" . org-capture)
         ("C-c l" . org-store-link)
         ("C-c a" . org-agenda)
         :map org-mode-map
         ("C-c o a" . org-archive-subtree)
         ("C-c o s" . org-save-all-org-buffers)
         ("C-c C-j" . mpolden/org-goto))
  :init
  ;; set default org directory
  (setopt org-directory "~/org")

  ;; open notes file by default
  (let ((notes-file (expand-file-name "notes.org" org-directory)))
    (when (file-exists-p notes-file)
      (setopt initial-buffer-choice notes-file)))

  ;; save archive file when archiving
  (setopt org-archive-subtree-save-file-p t)

  ;; sparse tree construction shows matches in archived trees
  (setopt org-sparse-tree-open-archived-trees t)

  ;; display all org files in agenda
  (setopt org-agenda-files (list org-directory))

  ;; refile targets 1 level in current buffer and all org agenda files
  (setopt org-refile-targets '((nil :maxlevel . 2) (org-agenda-files :maxlevel . 1)))

  ;; visual indenting only
  (setopt org-startup-indented t
          org-adapt-indentation nil)

  ;; record time when moving a task to done state
  (setopt org-log-done 'time)

  ;; capture template including title, date and time
  (setopt org-capture-templates '(("i" "Inbox" entry (file "inbox.org")
                                   "* TODO %?\n%U")
                                  ("t" "Tasks" entry (file+headline "notes.org" "Tasks")
                                   "* TODO %?\n%U")))

  ;; cycle opens archived trees
  (setopt org-cycle-open-archived-trees t)

  ;; fold by default
  (setopt org-startup-folded 'fold)

  ;; define todo states
  (setopt org-todo-keywords '((sequence "TODO(t)" "WAIT(w@)" "|" "ABRT(a@)" "DONE(d)")))

  ;; disallow invisible edits
  (setopt org-catch-invisible-edits 'error)

  ;; complete tags from all agenda files
  (setopt org-complete-tags-always-offer-all-agenda-tags t)

  ;; search headlines via completion
  (setopt org-goto-interface 'outline-path-completion)

  ;; include the full path when searching headlines
  (setopt org-outline-path-complete-in-steps nil)

  ;; insert state change notes and time stamps into a drawer
  (setopt org-log-into-drawer t)

  ;; export as html5
  (setopt org-html-doctype "html5")

  ;; hide todo entries whose deadline is far away according to
  ;; org-deadline-warning-days
  (setopt org-agenda-todo-ignore-deadlines 'far)

  ;; hide todo entries scheduled in the future
  (setopt org-agenda-todo-ignore-scheduled 'future)

  ;; include two weeks in agenda
  (setopt org-agenda-span 'fortnight)

  ;; set export backends
  (setopt org-export-backends '(ascii html md))

  ;; babel languages
  (setopt org-babel-load-languages '((emacs-lisp . t)
                                     (python . t)
                                     (shell . t))
          org-babel-python-command "python3")

  ;; skip confirmation when evaluating code blocks
  (setopt org-confirm-babel-evaluate nil))

;; enable template expansion when typing <s in org-mode
(use-package org-tempo
  :after org)

(use-package org-mac-link
  :ensure t
  :after org
  :if (eq system-type 'darwin)
  :bind (:map org-mode-map
         ("C-c o g" . org-mac-link-get-link)))

(use-package org-modern
  :ensure t
  :after org
  :init
  ;; do not use folding indicators
  (setopt org-modern-star'replace)
  ;; enable mode
  (setopt global-org-modern-mode t))

(provide 'init-org)

;;; init-org.el ends here
