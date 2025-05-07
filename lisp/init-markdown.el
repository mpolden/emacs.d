;;; init-markdown.el --- configure markdown language support  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode
  ;; use gfm mode for .md, .mdx and .markdown extensions
  (("\\.\\(mdx?\\|markdown\\)\\'" . gfm-mode)
   ;; use gfm mode for pull request and issue buffers
   ("PULLREQ_EDITMSG" . gfm-mode)
   ("ISSUE_EDITMSG" . gfm-mode)))

(provide 'init-markdown)

;;; init-markdown.el ends here
