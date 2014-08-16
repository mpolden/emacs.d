;; install package
(require-package 'projectile)

;; use a different prefix
(setq projectile-keymap-prefix (kbd "C-c C-p"))

(require 'projectile)

;; enable projectile mode in all buffers
(projectile-global-mode 1)

;; C-x f finds file in project
(global-set-key (kbd "C-x f") 'projectile-find-file)

(provide 'init-projectile)
