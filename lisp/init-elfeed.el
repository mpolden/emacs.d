;;; init-elfeed.el --- configure rss reader  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(defun mpolden/elfeed-search-show-entry (&optional noselect)
  "Visit currently selected item in another window.
If NOSELECT is non-nil, do not select the window."
  (interactive)
  (let ((current-window (selected-window)))
    (call-interactively 'elfeed-search-show-entry)
    (when noselect
      (select-window current-window))))

(defun mpolden/elfeed-search-show-entry-noselect ()
  "Visit currently selected item in another window, but don't select it."
  (interactive)
  (mpolden/elfeed-search-show-entry t))

(use-package elfeed
  :ensure t
  :init
  ;; set default filter
  (setq elfeed-search-filter "@2-days-ago +unread")
  ;; show entries in another window
  (setq elfeed-show-entry-switch #'switch-to-buffer-other-window)
  :hook (elfeed-show-mode . turn-on-visual-line-mode)
  :bind (("C-c e" . elfeed)
         :map elfeed-search-mode-map
         ("o" . mpolden/elfeed-search-show-entry)
         ("C-o" . mpolden/elfeed-search-show-entry-noselect)
         ("SPC" . mpolden/elfeed-search-show-entry-noselect)))

(provide 'init-elfeed)

;;; init-elfeed.el ends here
