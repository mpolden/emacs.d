;;; init-editing.el --- configure editing bindings and behaviour  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

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

;; kill line also kills newline character
(setq kill-whole-line t)

;; yank discards all text properties
(setq yank-excluded-properties t)

(provide 'init-editing)

;;; init-editing.el ends here
