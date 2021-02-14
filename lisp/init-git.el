(use-package git-commit
  :ensure t
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
  :ensure t
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
  :ensure t
  :after magit
  :init
  ;; limit number of topics listed in status buffer
  (setq forge-topic-list-limit '(10 . 0))
  :bind (;; killing in pullreq or issue section copies the url at point
         :map forge-pullreq-section-map
         ([remap magit-delete-thing] . forge-copy-url-at-point-as-kill)
         :map forge-issue-section-map
         ([remap magit-delete-thing] . forge-copy-url-at-point-as-kill)))

(use-package vc-hooks
  :init
  ;; follow symlinks to files under version control
  (setq vc-follow-symlinks t)

  ;; limit vc backends as this may speed up some operations, e.g. tramp
  (setq vc-handled-backends '(Git)))

(defun vc-git-grep-root (&optional dir)
  (interactive)
  (let ((search-regexp (grep-read-regexp))
        (dir (or dir (vc-git-root default-directory))))
    (vc-git-grep search-regexp "" dir)))

(use-package vc-git
  :after grep
  :bind (;; C-c g runs git grep in repository
         "C-c g" . vc-git-grep-root))

(use-package smerge-mode
  :init
  (setq smerge-command-prefix (kbd "C-c x")))

(provide 'init-git)
