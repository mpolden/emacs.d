(use-package markdown-mode
  :mode
  ;; use markdown mode for .md and .markdown extensions
  ("\\.\\(md\\|markdown\\)\\'" . markdown-mode)

  :config
  (add-hook 'markdown-mode-hook
          (lambda ()
            ;; disable electric indent
            (setq-local electric-indent-mode nil)
            ;; enable flyspell
            (flyspell-mode 1))))

(use-package flyspell)

(provide 'init-markdown-mode)
