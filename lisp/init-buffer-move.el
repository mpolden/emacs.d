;; install package
(require-package 'buffer-move)

;; use S-arrows to switch buffers
(windmove-default-keybindings)

;; use C-S-arrows to move buffers
(global-set-key (kbd "<C-S-up>") 'buf-move-up)
(global-set-key (kbd "<C-S-down>") 'buf-move-down)
(global-set-key (kbd "<C-S-left>") 'buf-move-left)
(global-set-key (kbd "<C-S-right>") 'buf-move-right)

(provide 'init-buffer-move)
