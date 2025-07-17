;;; init-project.el --- configure project integration  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(defun mpolden/project-try-go (dir)
  "Find root directory of a nested modules-based Go project from DIR."
  ;; this speeds up working with a go project nested inside a large repository
  (let* ((module-root (locate-dominating-file dir "go.mod"))
         (is-vc-root (file-directory-p (expand-file-name ".git" module-root))))
    (when (and module-root (not is-vc-root))
      (cons 'transient module-root))))

(use-package project
  :init
  ;; commands to show when switching projects
  (setopt project-switch-commands '((project-find-file "Find file" ?f)
                                    (project-dired "Dired" ?d)
                                    (mpolden/grep "Grep" ?g)
                                    (magit-project-status "Magit" ?m)
                                    (mpolden/eshell-other-window "Eshell" ?e)))
  ;; configure how projects are detected
  (setopt project-find-functions '(mpolden/project-try-go project-try-vc))
  :bind (;; C-x f finds file in project
         ("C-x f" . project-find-file)
         ;; C-c p switches project
         ("C-c p" . project-switch-project)))

(provide 'init-project)

;;; init-project.el ends here
