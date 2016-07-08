;; use appropiate git-mode for .gitconfig and .gitignore extensions
(use-package gitignore-mode
  :mode ("gitignore\\'" . gitignore-mode))

(use-package gitconfig-mode
  :mode ("gitconfig\\'" . gitconfig-mode))

;; use flyspell when writing commit messages
(use-package git-commit
  :config
  (add-hook 'git-commit-mode-hook
            (lambda ()
              (when (featurep 'flyspell) (flyspell-mode 1)))))

;; magit config
(use-package magit
  :init
  ;; disable gravatars
  (setq magit-revision-show-gravatars nil)

  :bind (("C-x m" . magit-status)
         ("C-c b" . magit-blame)
         :map magit-status-mode-map
         ;; make C-o and o behave as in dired
         ("o" . magit-diff-visit-file-other-window)
         ("C-o" . magit-diff-visit-file-other-window-noselect))

  :config
  (defun magit-diff-visit-file-other-window (&optional noselect)
    "Visit current file in another window."
    (interactive)
    (let ((current-window (selected-window))
          ;; magit-diff-visit-file visits in other-window with prefix arg
          (current-prefix-arg t))
      (call-interactively 'magit-diff-visit-file)
      (when noselect
        (select-window current-window))))

  (defun magit-diff-visit-file-other-window-noselect ()
    "Visit current file in another window, but don't select it."
    (interactive)
    (magit-diff-visit-file-other-window t)))

;; follow symlinks to files under version control
(setq vc-follow-symlinks t)

(provide 'init-git)
