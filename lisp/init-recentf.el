;;; init-recentf.el --- configure recentf  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(use-package recentf
  :init
  ;; set number of entries to save
  (setopt recentf-max-saved-items 1000)
  ;; enable mode
  (setopt recentf-mode t))

(provide 'init-recentf)

;;; init-recentf.el ends here
