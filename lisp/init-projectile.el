(use-package subr-x
  :ensure nil) ;; package is bundled with emacs

(use-package projectile
  :after subr-x
  :diminish projectile-mode

  :init
  ;; use a different prefix
  (setq projectile-keymap-prefix (kbd "C-c C-p"))

  ;; use git grep
  (setq projectile-use-git-grep t)

  ;; switching project opens the top-level directory
  (setq projectile-switch-project-action 'projectile-dired)

  ;; ignore remote projects
  (setq projectile-ignored-project-function 'file-remote-p)

  ;; enable caching
  (setq projectile-enable-caching t)

  ;; avoid reading command when compiling
  (setq compilation-read-command nil)

  ;; use ivy for completion
  (setq projectile-completion-system 'ivy)

  :bind (;; C-x f finds file in project
         ("C-x f" . projectile-find-file)
         ;; C-c g runs git grep in project
         ("C-c g" . projectile-grep)
         ;; C-c m compiles project
         ;; C-u C-c m will force reading command
         ("C-c m" . projectile-compile-project))

  :config
  (projectile-mode 1))

(provide 'init-projectile)
