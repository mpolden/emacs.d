;; install packages
(require-package 'magit)
(require-package 'git-commit-mode)
(require-package 'git-rebase-mode)
(require-package 'gitconfig-mode)
(require-package 'gitignore-mode)

(require 'magit)
(require 'git-commit-mode)
(require 'git-rebase-mode)
(require 'gitconfig-mode)
(require 'gitignore-mode)

;; use appropiate git-mode for .gitconfig and .gitignore extensions
(add-to-list 'auto-mode-alist '("\\.gitignore\\'" . gitignore-mode))
(add-to-list 'auto-mode-alist '("\\.gitconfig\\'" . gitconfig-mode))

;; magit keybinding
(global-set-key (kbd "C-x m") 'magit-status)

(defun magit-visit-item-noselect (&optional other-window)
  "Visit current item, but don't select it."
  (interactive "P")
  (let ((current-window (selected-window)))
    (magit-visit-item other-window)
    (select-window current-window)))

(add-hook 'magit-status-mode-hook
          (lambda ()
            ;; make C-o and o behave as in dired
            (define-key magit-status-mode-map (kbd "C-o")
              'magit-visit-item-noselect)
            (define-key magit-status-mode-map (kbd "o")
              'magit-visit-item)))

(provide 'init-git)
