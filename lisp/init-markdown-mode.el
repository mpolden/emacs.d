;; install package
(require-package 'markdown-mode)

;; use markdown mode for .md and .markdown extensions
(require 'markdown-mode)
(add-to-list 'auto-mode-alist '("\\.\\(md\\|markdown\\)\\'" . markdown-mode))

(provide 'init-markdown-mode)
