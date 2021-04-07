;;; init-recentf.el --- configure recentf  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(use-package recentf
  :init
  ;; set number of entries to save
  (setq recentf-max-saved-items 1000)

  :config
  ;; ignore files in elpa directory as these may be opened by package.el
  (add-to-list 'recentf-exclude (expand-file-name "elpa" user-emacs-directory))
  (recentf-mode 1))

(provide 'init-recentf)

;;; init-recentf.el ends here
