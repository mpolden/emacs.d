;;; init-editing.el --- configure editing bindings and behaviour
;;; Commentary:
;;; Code:

;; use zap-up-to-char instead of zap-to-char
(use-package misc
  :bind ("M-z" . zap-up-to-char))

;; enable subword-mode in prog-mode
(use-package subword
  :diminish subword-mode
  :hook ((prog-mode . subword-mode)))

(use-package crux
  :ensure t
  :bind (("M-j" . crux-top-join-line)
         ("C-c n" . crux-rename-file-and-buffer)
         ("C-c w" . crux-kill-buffer-truename)
         ("C-c D" . crux-duplicate-current-line-or-region)
         ("C-c C-o" . crux-open-with)
         ("C-x C-r" . crux-recentf-find-file)
         ("C-x C-o" . crux-recentf-find-directory)))

;; C-x k kills current buffer
(global-set-key (kbd "C-x k") 'kill-current-buffer)

;; C-- undoes
(global-set-key (kbd "C--") 'undo)

;; kill line also kills newline character
(setq kill-whole-line t)

;; yank discards all text properties
(setq yank-excluded-properties t)

(provide 'init-editing)

;;; init-editing.el ends here
