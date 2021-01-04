(use-package recentf
  :init
  ;; ignore files in elpa directory as these may be opened by package.el
  (add-to-list 'recentf-exclude (expand-file-name "elpa" user-emacs-directory))

  :bind (("C-x C-r" . recentf-open-files))

  :config
  (recentf-mode 1))

(provide 'init-recentf)
