;; install package
(require-package 'markdown-mode)

;; use markdown mode for .md extensions
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(provide 'init-markdown-mode)
