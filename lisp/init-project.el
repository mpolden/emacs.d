;;; init-project.el --- configure project integration  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(use-package project
  :ensure t
  :init
  ;; commands to show when switching projects
  (setq project-switch-commands '((project-find-file "Find file")
                                  (project-dired "Dired")
                                  (project-eshell "Eshell")
                                  (mpolden/vc-git-grep "Grep" ?g)
                                  (magit-project-status "Magit" ?m)))

  :bind (;; C-x f finds file in project
         ("C-x f" . project-find-file)
         ;; C-c p switches project
         ("C-c p" . project-switch-project)
         ;; C-c m compiles project
         ("C-c m" . project-compile)))

(provide 'init-project)

;;; init-project.el ends here
