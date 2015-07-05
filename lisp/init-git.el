;; install packages
(require-packages
 '(magit gitconfig-mode gitignore-mode))

(require 'magit)
(require 'gitconfig-mode)
(require 'gitignore-mode)
(require 'grep)
(require 'vc-git)

;; use appropiate git-mode for .gitconfig and .gitignore extensions
(add-to-list 'auto-mode-alist '("gitignore\\'" . gitignore-mode))
(add-to-list 'auto-mode-alist '("gitconfig\\'" . gitconfig-mode))

;; magit keybinding
(global-set-key (kbd "C-x m") 'magit-status)

;; magit blame keybinding
(global-set-key (kbd "C-c b")
                (lambda ()
                  (interactive)
                  (if magit-blame-mode
                      (magit-blame-quit)
                    (call-interactively 'magit-blame))))

(defun magit-diff-visit-file-noselect ()
  "Visit current item, but don't select it."
  (interactive)
  (let ((current-window (selected-window)))
    (call-interactively 'magit-diff-visit-file)
    (select-window current-window)))

(add-hook 'magit-status-mode-hook
          (lambda ()
            ;; make C-o and o behave as in dired
            (define-key magit-status-mode-map (kbd "C-o")
              'magit-diff-visit-file-noselect)
            (define-key magit-status-mode-map (kbd "o")
              'magit-diff-visit-file)))

(defun git-grep-root ()
  "Run git-grep in the repository root."
  (interactive)
  (let ((git-root-path (magit-toplevel)))
    (when git-root-path
      (vc-git-grep (grep-read-regexp) "*" git-root-path))))

;; run git grep in the repository root
(global-set-key (kbd "C-c g") 'git-grep-root)

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
            (setq truncate-lines nil)
            ;; make C-o and o behave as in dired
            (define-key grep-mode-map (kbd "C-o")
              'grep-visit-buffer-other-window-noselect)
            (define-key grep-mode-map (kbd "o")
              'grep-visit-buffer-other-window)
            ;; n and p changes line as in ag-mode
            (define-key grep-mode-map (kbd "n")
              'compilation-next-error)
            (define-key grep-mode-map (kbd "p")
              'compilation-previous-error)))

(add-hook 'git-commit-mode-hook 'flyspell-mode)

(provide 'init-git)
