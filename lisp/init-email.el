(use-package mu4e
  :ensure nil ;; package is installed outside emacs
  :load-path "/usr/local/share/emacs/site-lisp/mu/mu4e"
  :bind (("C-c m" . mu4e))
  :init
  ;; use mu4e as mail user agent
  (setq mail-user-agent 'mu4e-user-agent)

  ;; kill buffer after sending message
  (setq message-kill-buffer-on-exit t)

  ;; always show addresses
  (setq mu4e-view-show-addresses t)

  ;; disable threads by default
  (setq mu4e-headers-show-threads nil)

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

  ;; offlineimap downloads email
  (setq mu4e-get-mail-command "offlineimap")

  ;; shortcuts
  (setq mu4e-maildir-shortcuts '(("/INBOX" . ?i)
                                 ("/Archive" . ?a)
                                 ("/Sent" . ?s)
                                 ("/Trash" . ?t)))

  :config
  ;; use email address from git
  (when (executable-find "git")
    (setq user-full-name (string-trim (shell-command-to-string
                                       "git config --global --get user.name"))
          user-mail-address (string-trim (shell-command-to-string
                                          "git config --global --get user.email"))))

  ;; disable auto-composition-mode in mu4e-headers-mode due to ligatures
  ;; triggering a performance issue
  (add-hook 'mu4e-headers-mode-hook
            (lambda () (setq-local auto-composition-mode nil)))

  ;; delete moves email to trash
  :bind (:map mu4e-headers-mode-map ("d" . "mt")
         :map mu4e-view-mode-map ("d" . "mt")))

(use-package smtpmail
  :ensure nil ;; package is bundled with emacs
  :init
  ;; use smtpmail
  (setq send-mail-function 'smtpmail-send-it)

  ;; smtp server
  (setq smtpmail-smtp-server "smtp.fastmail.com"
        smtpmail-smtp-service 465
        smtpmail-stream-type 'ssl))

(provide 'init-email)
