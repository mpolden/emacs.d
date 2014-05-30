;; install package
(require-package 'expand-region)

(require 'expand-region)

;; keybinding
(global-set-key (kbd "C-=") 'er/expand-region)

(provide 'init-expand-region)
