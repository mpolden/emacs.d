(use-package projectile
  :diminish projectile-mode

  :init
  ;; use a different prefix
  (setq projectile-keymap-prefix (kbd "C-c C-p"))

  ;; switching project opens the top-level directory
  (setq projectile-switch-project-action 'projectile-dired)

  ;; ignore remote projects
  (setq projectile-ignored-project-function 'file-remote-p)

  :bind
  ;; C-x f finds file in project
  ("C-x f" . projectile-find-file)

  :config
  ;; enable projectile mode in all buffers
  (projectile-global-mode 1))

(provide 'init-projectile)
