(use-package git-commit
  :after markdown-mode

  :init
  ;; use gfm-mode as major mode
  (setq git-commit-major-mode 'gfm-mode))

(defun magit-visit-file-other-window (&optional noselect)
  "Visit current file in another window."
  (interactive)
  (let ((current-window (selected-window)))
    (call-interactively 'magit-diff-visit-file-other-window)
    (when noselect
      (select-window current-window))))

(defun magit-visit-file-other-window-noselect ()
  "Visit current file in another window, but don't select it."
  (interactive)
  (magit-visit-file-other-window t))

(use-package magit
  :init
  ;; disable gravatars
  (setq magit-revision-show-gravatars nil)

  ;; hide recent commits in magit-status
  (setq magit-log-section-commit-count 0)

  ;; set the default directory for git repositories
  (let ((project-dir "~/p"))
    (when (and (not (boundp 'magit-repository-directories)) (file-directory-p project-dir))
      (setq magit-repository-directories (list (cons project-dir 1)))))

  :bind (("C-x m" . magit-status)
         ("C-c b" . magit-blame)
         :map magit-status-mode-map
         ;; make C-o and o behave as in dired
         ("o" . magit-visit-file-other-window)
         ("C-o" . magit-visit-file-other-window-noselect)))

(use-package forge
  :after magit
  :init
  ;; limit number of topics listed in status buffer
  (setq forge-topic-list-limit '(10 . 0)))

;; follow symlinks to files under version control
(setq vc-follow-symlinks t)

(use-package smerge-mode
  :ensure nil ;; package is bundled with emacs
  :init
  (setq smerge-command-prefix (kbd "C-c x")))

(provide 'init-git)
