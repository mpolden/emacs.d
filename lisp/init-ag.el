;; install package
(require-package 'ag)

(require 'ag)

;; reuse search results buffer
(setq ag-reuse-buffers t)

;; highlight search term in results
(setq ag-highlight-search t)

;; keybinding
(global-set-key (kbd "C-c a") 'ag-project)

(provide 'init-ag)
