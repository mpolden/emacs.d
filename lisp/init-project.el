(use-package project
  :ensure t
  :init
  ;; avoid reading command when compiling
  (setq compilation-read-command nil)

  :bind (;; C-x f finds file in project
         ("C-x f" . project-find-file)
         ;; C-c p switches project
         ("C-c p" . project-switch-project)
         ;; C-c m compiles project
         ;; C-u C-c m will force reading command
         ("C-c m" . project-compile)))

(provide 'init-project)
