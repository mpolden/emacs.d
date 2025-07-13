;;; init-tramp.el --- configure tramp  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(defun mpolden/sudo-file-name (filename)
  "Add a sudo-like TRAMP method to FILENAME.

If FILENAME already contains a sudo-like method, return FILENAME
unchanged. If FILENAME is accessed over SSH, replace
\"/ssh:host\" with \"/ssh:host|sudo:\". Otherwise, assume
FILENAME is a local path and prefix it with \"/sudo::\".

If doas is available, that method is used instead of sudo."
  (let* ((parts (split-string filename ":"))
         (method (string-trim (car parts) "/"))
         (host (car (cdr parts)))
         (hop-method (when host (car (cdr (split-string host "|")))))
         (sudo-methods '("sudo" "doas")))
    (if (or (member method sudo-methods)
            (member hop-method sudo-methods))
        filename
      (let* ((sudo-method (if (executable-find "doas" t) "doas" "sudo"))
             (sudo-hop (when (equal method "ssh")
                         (concat host "|" sudo-method ":"))))
        (if sudo-hop
            (mapconcat 'identity (append (list (concat "/" method) sudo-hop)
                                         (nthcdr 2 parts))
                       ":")
          (concat "/" sudo-method "::" filename))))))

(defun mpolden/sudo-find-file (&optional arg)
  "Find file and open it with sudo.
With a prefix ARG prompt edit currently visited file using sudo."
  (interactive "P")
  (if arg
      (find-alternate-file (mpolden/sudo-file-name buffer-file-name))
    (find-file (mpolden/sudo-file-name (read-file-name "Find file with sudo: ")))))

(defun mpolden/sudo-current-file ()
  "Open current file with sudo."
  (interactive)
  (mpolden/sudo-find-file t))

(use-package tramp
  :init
  ;; use control master options from ~/.ssh/config
  (setq tramp-use-connection-share nil)
  ;; use inline copying up to 1 MB
  (setq tramp-copy-size-limit (* 1024 1024))
  :bind
  (("C-x +" . mpolden/sudo-find-file)
   ("C-x !" . mpolden/sudo-current-file))
  :config
  ;; use path configured by remote host
  (add-to-list 'tramp-remote-path 'tramp-own-remote-path))

(provide 'init-tramp)

;;; init-tramp.el ends here
