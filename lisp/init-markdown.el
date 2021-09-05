;;; init-markdown.el --- configure markdown language support  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(defun mpolden/browse-help-at-point ()
  "Browse help URL at point.

The URL is extracted from the help text found at point, if any."
  ;; markdown-mode fontifies links by adding them to the help-echo property
  ;; allows visiting links in documentation shown by eglot/eldoc
  (interactive)
  (let ((url (get-text-property (point) 'help-echo)))
    (if url (browse-url url)
      (error "No URL found"))))

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

;;; init-markdown.el ends here
