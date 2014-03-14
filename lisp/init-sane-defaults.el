;; use soft tabs and 4 space indent
(setq-default
  tab-width 4
  tab-stop-list (number-sequence 4 120 4)
  indent-tabs-mode nil)

;; bind return to newline-and-indent
(global-set-key (kbd "RET") 'newline-and-indent)

;; make prompts accept y or n
(defalias 'yes-or-no-p 'y-or-n-p)

;; no confirmation for non-existent files or buffers
(setq confirm-nonexistent-file-or-buffer nil)

;; disable audible bell
(setq ring-bell-function #'ignore)

(provide 'init-sane-defaults)
