;; install packages
(require-package 'magit)
(require-package 'git-commit-mode)
(require-package 'git-rebase-mode)
(require-package 'gitconfig-mode)
(require-package 'gitignore-mode)

(require 'magit)
(require 'git-commit-mode)
(require 'git-rebase-mode)
(require 'gitconfig-mode)
(require 'gitignore-mode)

;; magit keybinding
(global-set-key (kbd "C-x m") 'magit-status)

(provide 'init-git-mode)
