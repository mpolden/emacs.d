;; install packages
(require-packages
 '(magit git-commit-mode git-rebase-mode gitconfig-mode gitignore-mode))

(require 'magit)
(require 'git-commit-mode)
(require 'git-rebase-mode)
(require 'gitconfig-mode)
(require 'gitignore-mode)
(require 'vc-git)

;; use appropiate git-mode for .gitconfig and .gitignore extensions
(add-to-list 'auto-mode-alist '("\\.gitignore\\'" . gitignore-mode))
(add-to-list 'auto-mode-alist '("\\.gitconfig\\'" . gitconfig-mode))

;; magit keybinding
(global-set-key (kbd "C-x m") 'magit-status)

;; magit blame keybinding
(global-set-key (kbd "C-c b") 'magit-blame-mode)

;; hide magit instructions
(setq magit-last-seen-setup-instructions "1.4.0")

(defun magit-visit-item-noselect (&optional other-window)
  "Visit current item, but don't select it."
  (interactive "P")
  (let ((current-window (selected-window)))
    (magit-visit-item other-window)
    (select-window current-window)))

(defun magit-stage-line-at-point ()
  "Stage the current line or region."
  (interactive)
  (if (use-region-p)
      (magit-stage-item)
    (let ((current-line (line-number-at-pos)))
      (save-excursion
        (beginning-of-line)
        (set-mark (line-end-position))
        (magit-stage-item))
      (goto-char (point-min))
      (forward-line (1- current-line)))))

(add-hook 'magit-status-mode-hook
          (lambda ()
            ;; make C-o and o behave as in dired
            (define-key magit-status-mode-map (kbd "C-o")
              'magit-visit-item-noselect)
            (define-key magit-status-mode-map (kbd "o")
              'magit-visit-item)
            ;; stage single line with C-c 1
            (define-key magit-status-mode-map (kbd "C-c 1")
              'magit-stage-line-at-point)))

(defun git-root ()
  "Find the git repository root of the visiting file."
  (interactive)
  (let ((git-root-path (magit-get-top-dir)))
    (when git-root-path
      (let ((git-root-file-name (directory-file-name git-root-path)))
        (message "git repository: %s (%s)"
                 (file-name-nondirectory git-root-file-name)
                 git-root-file-name)))))

;; show current git repo
(global-set-key (kbd "C-c d") 'git-root)

(defun git-grep-root ()
  "Run git-grep in the repository root."
  (interactive)
  (let ((git-root-path (magit-get-top-dir)))
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
