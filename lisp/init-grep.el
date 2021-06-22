;;; init-grep.el --- configure grep  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(defvar mpolden/rg-template "rg -nH --no-heading <C> -e <R> -- "
  "The grep template use when rg (ripgrep) is installed.")

(defun mpolden/grep ()
  "Run grep interactively in `default-directory' or current VC tree."
  (interactive)
  (let ((vc-root-dir (vc-root-dir)))
    (if vc-root-dir
        (vc-git-grep (grep-read-regexp) "" vc-root-dir)
      (lgrep (grep-read-regexp) "" default-directory))))

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
  :config
  (when (executable-find "rg")
    ;; never use null device with ripgrep
    (setq grep-use-null-device nil)
    (grep-apply-setting 'grep-template mpolden/rg-template))
  :bind (;; C-c g runs git grep in current vc tree
         ("C-c g" . mpolden/grep)
         :map grep-mode-map
         ;; make C-o and o behave as in dired
         ("o" . mpolden/grep-visit-buffer-other-window)
         ("C-o" . mpolden/grep-visit-buffer-other-window-noselect)
         ;; n and p changes line as in ag-mode
         ("n" . compilation-next-error)
         ("p" . compilation-previous-error)))

(use-package vc-git
  :commands vc-git-grep
  :init
  (when (executable-find "rg")
    (setq vc-git-grep-template mpolden/rg-template)))

(provide 'init-grep)

;;; init-grep.el ends here
