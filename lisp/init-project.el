(defun project-git-grep ()
  (interactive)
  (vc-git-grep-root (project-root (project-current t))))

(use-package project
  :ensure t
  :init
  ;; avoid reading command when compiling
  (setq compilation-read-command nil)

  ;; commands to show when switching projects
  (setq project-switch-commands '((?f "Find file" project-find-file)
                                  (?d "Dired" project-dired)
                                  (?g "Grep" project-git-grep)
                                  (?m "Magit" magit-status)))

  :bind (;; C-x f finds file in project
         ("C-x f" . project-find-file)
         ;; C-c p switches project
         ("C-c p" . project-switch-project)
         ;; C-c m compiles project
         ;; C-u C-c m will force reading command
         ("C-c m" . project-compile)))

(provide 'init-project)
