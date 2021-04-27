;;; init-mail.el --- configure mail client  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(use-package mu4e
  :load-path "/usr/local/share/emacs/site-lisp/mu/mu4e"
  :bind (("C-c m" . mu4e)
         ;; delete moves email to trash instead of deleting
         :map mu4e-headers-mode-map ("d" . "mt")
         :map mu4e-view-mode-map ("d" . "mt"))
  :hook (mu4e-view-mode . turn-on-visual-line-mode)
  :init
  ;; use mu4e as mail user agent
  (setq mail-user-agent 'mu4e-user-agent)

  ;; kill buffer after sending message
  (setq message-kill-buffer-on-exit t)

  ;; use format=flowed when sending message
  (setq mu4e-compose-format-flowed t)

  ;; always show addresses
  (setq mu4e-view-show-addresses t)

  ;; header list date format
  (setq mu4e-headers-date-format "%Y-%m-%d %H:%M")

  ;; adjust date field width to fit the above format
  (setq mu4e-headers-fields '((:human-date . 18)
                              (:flags . 6)
                              (:mailing-list . 10)
                              (:from . 22)
                              (:subject)))

  ;; fastmail folders
  (setq mu4e-sent-folder "/Sent"
        mu4e-drafts-folder "/Drafts"
        mu4e-trash-folder "/Trash"
        mu4e-refile-folder "/Archive")

  ;; mbsync downloads email
  (setq mu4e-get-mail-command "mbsync -a")

  ;; change filename when moving (recommended when using mbsync)
  (setq mu4e-change-filenames-when-moving t)

  ;; shortcuts
  (setq mu4e-maildir-shortcuts '((:key ?i :maildir "/INBOX")
                                 (:key ?a :maildir "/Archive" )
                                 (:key ?s :maildir "/Sent")
                                 (:key ?t :maildir "/Trash")))

  ;; split vertically
  (setq mu4e-split-view 'vertical
        mu4e-headers-visible-columns 100)

  :config
  ;; use email address from git
  (when (executable-find "git")
    (setq user-full-name (string-trim (shell-command-to-string
                                       "git config --global --get user.name"))
          user-mail-address (string-trim (shell-command-to-string
                                          "git config --global --get user.email")))))

(use-package smtpmail
  :init
  ;; use smtpmail
  (setq send-mail-function 'smtpmail-send-it)

  ;; smtp server
  (setq smtpmail-smtp-server "smtp.fastmail.com"
        smtpmail-smtp-service 465
        smtpmail-stream-type 'ssl))

(provide 'init-mail)

;;; init-mail.el ends here
