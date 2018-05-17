(use-package mu4e
  :ensure nil ;; package is installed outside emacs
  :load-path "/usr/local/share/emacs/site-lisp/mu/mu4e"
  :bind (("C-c e" . mu4e))
  :config
  ;; disable threads by default
  (setq mu4e-headers-show-threads nil)

  ;; fastmail folders
  (setq mu4e-sent-folder "/Sent"
        mu4e-drafts-folder "/Drafts"
        mu4e-trash-folder "/Trash")

  ;; offlineimap downloads email
  (setq mu4e-get-mail-command "offlineimap")

  ;; use email address from git
  (when (executable-find "git")
    (setq user-full-name (string-trim (shell-command-to-string
                                       "git config --global --get user.name"))
          user-mail-address (string-trim (shell-command-to-string
                                          "git config --global --get user.email"))))

  ;; shortcuts
  (setq mu4e-maildir-shortcuts '(("/INBOX" . ?i)
                                 ("/Archive" . ?a)
                                 ("/Sent" . ?s)
                                 ("/Trash" . ?t)))

  ;; disable auto-composition-mode in mu4e-headers-mode due to ligatures
  ;; triggering a performance issue
  (add-hook 'mu4e-headers-mode-hook
            (lambda () (setq-local auto-composition-mode nil)))

  ;; delete moves email to trash
  :bind (:map mu4e-headers-mode-map ("d" . "mt")
         :map mu4e-view-mode-map ("d" . "mt")))

(use-package smtpmail
  :ensure nil ;; package is bundled with emacs
  :config
  ;; use smtpmail
  (setq send-mail-function 'smtpmail-send-it)

  ;; smtp server
  (setq smtpmail-smtp-server "smtp.fastmail.com"
        smtpmail-smtp-service 465
        smtpmail-stream-type 'ssl))

(provide 'init-email)
