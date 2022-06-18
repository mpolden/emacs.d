;;; init-recentf.el --- configure recentf  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(defun mpolden/recentf-exclude-p (filename)
  "Return non-nil if file FILENAME is in a symlinked `user-emacs-directory'."
  (and (not (file-remote-p filename))
       (file-in-directory-p filename user-emacs-directory)
       (file-symlink-p (directory-file-name user-emacs-directory))
       (not (equal filename (file-truename filename)))))

(use-package recentf
  :init
  ;; set number of entries to save
  (setq recentf-max-saved-items 1000)

  :config
  ;; ignore files in elpa directory as these may be opened by package.el
  (add-to-list 'recentf-exclude (expand-file-name "elpa" user-emacs-directory))
  (add-to-list 'recentf-exclude #'mpolden/recentf-exclude-p)
  (recentf-mode 1))

(provide 'init-recentf)

;;; init-recentf.el ends here
