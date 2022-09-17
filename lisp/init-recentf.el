;;; init-recentf.el --- configure recentf  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(defun mpolden/recentf-exclude-p (filename)
  "Return non-nil if FILENAME is a symlink in the user's home directory."
  (and (not (file-remote-p filename))
       (not (file-in-directory-p filename org-directory))
       (file-in-directory-p filename "~")
       (not (equal filename (file-truename filename)))))

(use-package recentf
  :init
  ;; set number of entries to save
  (setq recentf-max-saved-items 1000)

  :config
  (add-to-list 'recentf-exclude #'mpolden/recentf-exclude-p)
  (recentf-mode 1))

(provide 'init-recentf)

;;; init-recentf.el ends here
