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

;; scroll one line at a time
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))

;; disable scroll acceleration
(setq mouse-wheel-progressive-speed nil)

;; reload buffers automatically when files change on disk
(global-auto-revert-mode t)

;; integrate with X clipboard
(setq x-select-enable-clipboard t)

(provide 'init-sane-defaults)
