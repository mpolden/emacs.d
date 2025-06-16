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

(cl-defun mpolden/auth-source-gh-search (&key backend type host user &allow-other-keys)
  "Find an authentication token for HOST and USER using GitHub CLI.

BACKEND contains the backend parameters declared by the function
`auth-source-backend'. TYPE is the name of the authentication
source."
  ;; inspired by https://github.com/magit/forge/discussions/544
  (cl-assert (or (null type)
                 (eq type (oref backend type)))
             t "Type %s does not match backend %s" type backend)
  (when-let*
      ((host (string-trim-right (string-replace "api.github.com" "github.com" (or host ""))
                                "/.*")) ;; remove path, if any
       (user (string-remove-suffix "^forge" (or user "")))
       (secret (with-temp-buffer
                 (let* ((status (when (executable-find "gh")
                                  (call-process "gh" nil t nil "auth" "token" "--hostname" host)))
                        (output (string-trim-right (buffer-string)))
                        (success (and (equal 0 status)
                                      (not (string-empty-p output)))))
                   (auth-source-do-debug
                    "mpolden/auth-source-gh-search: gh exited with status %d and output '%s'"
                    status output)
                   (when success
                     output)))))
    (when secret
      (list (list :host host
                  :user user
                  :secret secret)))))

(defun mpolden/auth-source-gh-backend-parse (entry)
  "Create a GitHub CLI authentication source for ENTRY."
  (when (eq entry 'gh-cli)
    (auth-source-backend-parse-parameters
     entry
     (auth-source-backend
      :source ""
      :type 'gh-cli
      :search-function #'mpolden/auth-source-gh-search))))

(use-package auth-source
  :config
  (add-hook 'auth-source-backend-parser-functions #'mpolden/auth-source-gh-backend-parse)
  ;; use gh-cli as an authentication source (used by forge)
  (add-to-list 'auth-sources 'gh-cli))

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
         ("C-o" . mpolden/magit-visit-file-other-window-noselect)
         :map magit-diff-mode-map
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
