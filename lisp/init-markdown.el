(use-package markdown-mode
  :commands gfm-mode
  :mode
  ;; use gfm mode for .md and .markdown extensions
  (("\\.\\(md\\|markdown\\)\\'" . gfm-mode)
   ;; use gfm mode for pull request and issue buffers
   ("PULLREQ_EDITMSG" . gfm-mode)
   ("ISSUE_EDITMSG" . gfm-mode))

  :config
  (add-hook 'markdown-mode-hook
          (lambda ()
            ;; disable electric indent
            (setq-local electric-indent-mode nil))))

(provide 'init-markdown)
