;; install package
(require-package 'markdown-mode)

(require 'markdown-mode)
(require 'flyspell)

;; use markdown mode for .md and .markdown extensions
(add-to-list 'auto-mode-alist '("\\.\\(md\\|markdown\\)\\'" . markdown-mode))

(add-hook 'markdown-mode-hook
          (lambda ()
            ;; disable electric indent
            (setq-local electric-indent-mode nil)
            ;; enable flyspell
            (flyspell-mode 1)))

(provide 'init-markdown-mode)
