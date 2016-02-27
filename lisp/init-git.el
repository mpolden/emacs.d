;; use appropiate git-mode for .gitconfig and .gitignore extensions
(use-package gitignore-mode
  :mode ("gitignore\\'" . gitignore-mode))

(use-package gitconfig-mode
  :mode ("gitconfig\\'" . gitconfig-mode))

;; magit config
(use-package magit
  :init
  ;; disable gravatars
  (setq magit-revision-show-gravatars nil)

  :bind (("C-x m" . magit-status)
         ("C-c b" . git-blame)
         ("C-c w" . git-branch-with-prefix)
         :map magit-status-mode-map
         ;; make C-o and o behave as in dired
         ("o" . magit-diff-visit-file)
         ("C-o" . magit-diff-visit-file-noselect))

  :config
  (defun git-blame ()
    "Active or disable git blame."
    (interactive)
    (if magit-blame-mode
        (magit-blame-quit)
      (call-interactively 'magit-blame)))

  (defun magit-diff-visit-file-noselect ()
    "Visit current item, but don't select it."
    (interactive)
    (let ((current-window (selected-window)))
      (call-interactively 'magit-diff-visit-file)
      (select-window current-window)))

  (defun git-branch-with-prefix ()
    "Create and checkout <username>/BRANCH from master."
    (interactive)
    (let* ((prefix (concat user-login-name "/"))
           (suffix (magit-read-string-ns (format "Branch name (prefix: %s)" prefix)))
           (branch (concat prefix suffix)))
      (magit-run-git "checkout" "-b" branch "master")))

  (add-hook 'git-commit-mode-hook 'flyspell-mode))

(provide 'init-git)
