;;; init-project.el --- configure project integration  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(defun mpolden/project-git-grep ()
  "Run git grep interactively in the current project."
  (interactive)
  (let ((search-regexp (grep-read-regexp))
        (dir (project-root (project-current t))))
    (vc-git-grep search-regexp "" dir)))

(use-package project
  :ensure t
  :init
  ;; commands to show when switching projects
  (setq project-switch-commands '((project-find-file "Find file")
                                  (project-dired "Dired")
                                  (project-eshell "Eshell")
                                  (mpolden/project-git-grep "Grep" ?g)
                                  (magit-project-status "Magit" ?m)))

  :bind (;; C-x f finds file in project
         ("C-x f" . project-find-file)
         ;; C-c p switches project
         ("C-c p" . project-switch-project)
         ;; C-c g runs git grep in project
         ("C-c g" . mpolden/project-git-grep)
         ;; C-c m compiles project
         ("C-c m" . project-compile)))

(provide 'init-project)

;;; init-project.el ends here
