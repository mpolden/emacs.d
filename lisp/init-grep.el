;;; init-grep.el --- configure grep  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(defun mpolden/grep-visit-buffer-other-window (&optional result noselect)
  "Visit grep RESULT in another window.
If NOSELECT is non-nil, do not select the window."
  (interactive)
  (let ((current-window (selected-window)))
    (compile-goto-error result)
    (when noselect
      (select-window current-window))))

(defun mpolden/grep-visit-buffer-other-window-noselect (&optional result)
  "Visit grep RESULT another window, but don't select it."
  (interactive)
  (mpolden/grep-visit-buffer-other-window result t))

(use-package grep
  :commands grep-read-regexp
  :bind (:map grep-mode-map
              ;; make C-o and o behave as in dired
              ("o" . mpolden/grep-visit-buffer-other-window)
              ("C-o" . mpolden/grep-visit-buffer-other-window-noselect)
              ;; n and p changes line as in ag-mode
              ("n" . compilation-next-error)
              ("p" . compilation-previous-error)))

(provide 'init-grep)

;;; init-grep.el ends here
