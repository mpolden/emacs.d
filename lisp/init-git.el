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
         ("C-c g" . git-grep-root))

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

  (defun git-grep-root ()
    "Run git-grep in the repository root."
    (interactive)
    (let ((git-root-path (magit-toplevel)))
      (when git-root-path
        (vc-git-grep (grep-read-regexp) "*" git-root-path))))

  (add-hook 'magit-status-mode-hook
          (lambda ()
            ;; make C-o and o behave as in dired
            (define-key magit-status-mode-map (kbd "C-o")
              'magit-diff-visit-file-noselect)
            (define-key magit-status-mode-map (kbd "o")
              'magit-diff-visit-file)))

  (add-hook 'git-commit-mode-hook 'flyspell-mode))

(use-package grep
  :ensure nil ;; package is bundled with emacs

  :bind (:map grep-mode-map
         ;; make C-o and o behave as in dired
         ("o" . grep-visit-buffer-other-window)
         ("C-o" . grep-visit-buffer-other-window-noselect)
         ;; n and p changes line as in ag-mode
         ("n" . compilation-next-error)
         ("p" . compilation-previous-error))

  :config
  (defun grep-visit-buffer-other-window (&optional event noselect)
    "Visit grep result in another window."
    (interactive)
    (let ((current-window (selected-window)))
      (compile-goto-error event)
      (when noselect
        (select-window current-window))))

  (defun grep-visit-buffer-other-window-noselect (&optional event)
    "Visit grep result in another window, but don't select it."
    (interactive)
    (grep-visit-buffer-other-window event t))

  (add-hook 'grep-mode-hook
            (lambda ()
              ;; wrap lines
              (setq-local truncate-lines nil))))

(provide 'init-git)
