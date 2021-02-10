(use-package recentf
  :init
  ;; avoid cleaning up tramp buffers
  (setq recentf-auto-cleanup 'never)

  :config
  ;; ignore files in elpa directory as these may be opened by package.el
  (add-to-list 'recentf-exclude (expand-file-name "elpa" user-emacs-directory))
  (recentf-mode 1))

(provide 'init-recentf)
