;;; init-grep.el --- configure grep  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(defvar mpolden/rg-template "rg -nH --sort path --no-heading <C> -e <R> -- <F>"
  "The grep template to use when rg (ripgrep) is installed.")

(defvar mpolden/git-grep-template "git --no-pager grep -n <C> -e <R> -- <F>"
  "The grep template to use when git is installed.
This is only used when running grep in a Git repository.")

(defun mpolden/grep ()
  "Recursively grep the current project.

The current project is determined by `project-current'. If no
project is found, fall back to the current Git repository root.
If there is no Git repository, fall back to `default-directory'.

Grep programs are preferred in the following order: rg, git grep
and grep.

A prefix argument runs grep in `default-directory' instead of the
current project."
  (interactive)
  (let* ((git-repository (locate-dominating-file default-directory ".git"))
         (dir (or (when current-prefix-arg default-directory)
                  (project-root (project-current))
                  git-repository
                  default-directory))
         (use-rg (executable-find "rg" t))
         (use-git (and git-repository (executable-find "git" t)))
         (template (cond (use-rg mpolden/rg-template)
                         (use-git mpolden/git-grep-template))))
    (grep-apply-setting 'grep-template template)
    ;; never use null device as all programs support -H
    (grep-apply-setting 'grep-use-null-device nil)
    (if (or use-rg use-git)
        ;; never pass --directories
        (let ((grep-use-directories-skip nil))
          (lgrep (grep-read-regexp) "" dir))
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
  :bind (;; C-c g runs interactive grep
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
