;;; init-editing.el --- configure editing bindings and behaviour  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(defun mpolden/kill-buffer-project-path ()
  "Kill path of file visited in current buffer, relative to project root.

If file visited in the current buffer is not part of a project, or
prefix argument is given, the complete file path is killed instead."
  (interactive)
  (if buffer-file-name
      (let* ((project (project-current))
             (name (if (and (not current-prefix-arg)
                            project)
                       (file-relative-name buffer-file-name
                                           (project-root project))
                     buffer-file-name)))
        (kill-new name)
        (message "Added %s to kill ring." name))
    (message "Buffer is not visiting a file.")))

;; enable subword-mode in prog-mode
(use-package subword
  :diminish subword-mode
  :hook ((prog-mode . subword-mode)))

;; M-z runs zap-up-to-char instead of zap-to-char
(global-set-key (kbd "M-z") 'zap-up-to-char)

;; C-c + opens a simple calculator
(global-set-key (kbd "C-c +") 'quick-calc)

;; M-j joins the next line to this
(global-set-key (kbd "M-j") (lambda () (interactive) (join-line -1)))

;; C-c d duplicates the current line or region
(global-set-key (kbd "C-c d") 'duplicate-dwim)

;; C-c n renames visited file
(global-set-key (kbd "C-c n") 'rename-visited-file)

;; C-x k kills current buffer
(global-set-key (kbd "C-x k") 'kill-current-buffer)

;; C-- undoes
(global-set-key (kbd "C--") 'undo)

;; use dwim variants when changing case
(global-set-key (kbd "M-u") 'upcase-dwim)
(global-set-key (kbd "M-l") 'downcase-dwim)
(global-set-key (kbd "M-c") 'capitalize-dwim)

;; C-c w kills buffer project path
(global-set-key (kbd "C-c w") 'mpolden/kill-buffer-project-path)

;; kill line also kills newline character
(setq kill-whole-line t)

;; yank discards all text properties
(setq yank-excluded-properties t)

(provide 'init-editing)

;;; init-editing.el ends here
