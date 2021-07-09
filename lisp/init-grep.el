;;; init-grep.el --- configure grep  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(defvar mpolden/rg-template "rg -nH --no-heading <C> -e <R> -- "
  "The grep template to use when rg (ripgrep) is installed.")

(defvar mpolden/git-grep-template "git --no-pager grep -n <C> -e <R> -- <F>"
  "The grep template to use when git is installed.
This is only used when running grep in a Git repository.")

(defun mpolden/grep ()
  "Recursively grep in `default-directory' or current Git repository.
This tries to use either rg or git grep if available, and
otherwise falls back to regular grep."
  (interactive)
  (let* ((git-root-dir (locate-dominating-file (or buffer-file-name
                                                   default-directory)
                                               ".git"))
         (dir (or git-root-dir default-directory))
         (use-rg (executable-find "rg"))
         (use-git (and git-root-dir (executable-find "git")))
         (grep-template (cond (use-rg mpolden/rg-template)
                              (use-git mpolden/git-grep-template))))
    (grep-apply-setting 'grep-template grep-template)
    (if (or use-rg use-git)
        (lgrep (grep-read-regexp) "" dir)
      (rgrep (grep-read-regexp) "*" dir))))

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
  :commands (grep-read-regexp grep-apply-setting)
  :bind (;; C-c g runs git grep in current vc tree
         ("C-c g" . mpolden/grep)
         :map grep-mode-map
         ;; make C-o and o behave as in dired
         ("o" . mpolden/grep-visit-buffer-other-window)
         ("C-o" . mpolden/grep-visit-buffer-other-window-noselect)
         ;; n and p changes line as in ag-mode
         ("n" . compilation-next-error)
         ("p" . compilation-previous-error)))

(provide 'init-grep)

;;; init-grep.el ends here
