(use-package markdown-mode
  :ensure t
  :commands gfm-mode
  :mode
  ;; use gfm mode for .md and .markdown extensions
  (("\\.\\(md\\|markdown\\)\\'" . gfm-mode)
   ;; use gfm mode for pull request and issue buffers
   ("PULLREQ_EDITMSG" . gfm-mode)
   ("ISSUE_EDITMSG" . gfm-mode)))

(provide 'init-markdown)
