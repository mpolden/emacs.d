;; install package
(require-package 'move-text)

(require 'move-text)

;; bind keys
(global-set-key (kbd "<M-up>") 'move-text-up)
(global-set-key (kbd "<M-down>") 'move-text-down)

(provide 'init-move-text)
