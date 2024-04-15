;;; init-git.el --- configure git and forge integration  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(defun mpolden/magit-visit-file-other-window (&optional noselect)
  "Visit current file in another window.
If NOSELECT is non-nil, do not select the window."
  (interactive)
  (let ((current-window (selected-window)))
    (call-interactively 'magit-diff-visit-file-other-window)
    (when noselect
      (select-window current-window))))

(defun mpolden/magit-visit-file-other-window-noselect ()
  "Visit current file in another window, but don't select it."
  (interactive)
  (mpolden/magit-visit-file-other-window t))

(use-package magit
  :ensure t
  :init
  ;; hide recent commits in magit-status
  (setq magit-log-section-commit-count 0)

  :bind (("C-x m" . magit-status)
         ("C-c b" . magit-blame)
         :map magit-status-mode-map
         ;; make C-o and o behave as in dired
         ("o" . mpolden/magit-visit-file-other-window)
         ("C-o" . mpolden/magit-visit-file-other-window-noselect))

  :config
  ;; absorb automatically fixes up existing commits
  ;; https://github.com/tummychow/git-absorb
  (transient-replace-suffix 'magit-commit 'magit-commit-autofixup
    '("x" "Absorb changes" magit-commit-absorb)))

(use-package forge
  :ensure t
  :init
  ;; limit number of topics listed in status buffer
  (setq forge-topic-list-limit '(10 . 0))
  ;; work around github timeouts when fetching pull requests
  (setq ghub-graphql-items-per-request 50)
  :bind (;; killing in pullreq or issue section copies the url at point
         :map forge-pullreq-section-map
         ([remap magit-delete-thing] . forge-copy-url-at-point-as-kill)
         :map forge-issue-section-map
         ([remap magit-delete-thing] . forge-copy-url-at-point-as-kill))
  :config
  ;; use default foreground color for open pull requests
  (set-face-attribute 'forge-pullreq-open nil :foreground nil))

(use-package smerge-mode
  ;; vc-git-find-file-hook calls this command
  :commands smerge-start-session
  :init
  (setq smerge-command-prefix (kbd "C-c x")))

;; follow symlinks to files under version control
(setq vc-follow-symlinks t)

;; limit vc backends as this may speed up some operations, e.g. tramp
(setq vc-handled-backends '(Git))

(provide 'init-git)

;;; init-git.el ends here
