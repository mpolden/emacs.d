;; install package
(require-package 'markdown-mode)

;; use markdown mode for .md and .markdown extensions
(require 'markdown-mode)
(add-to-list 'auto-mode-alist '("\\.\\(md\\|markdown\\)\\'" . markdown-mode))

(add-hook 'markdown-mode-hook
          (lambda ()
            ;; disable electric indent
            (set (make-local-variable 'electric-indent-mode) nil)
            ;; enable flyspell
            (flyspell-mode 1)))

(provide 'init-markdown-mode)
