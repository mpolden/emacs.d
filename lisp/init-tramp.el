;;; init-tramp.el --- configure tramp  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(defun mpolden/sudo-file-name (filename)
  "Add a sudo-like TRAMP method to FILENAME.

If FILENAME already contains a sudo-like method, return FILENAME
unchanged. If FILENAME is accessed over SSH, replace \"/ssh:\"
with \"/sudo:\". Otherwise, assume FILENAME is a local path and
prefix it with \"/sudo::\".

If doas is available on the remote host, the doas method is used
instead of sudo."
  ;; sudo:remote-host works because of the special tramp-default-proxies-alist
  ;; configuration below
  (let* ((splitname (split-string filename ":"))
         (method (car splitname)))
    (if (member method '("/sudo" "/doas"))
        filename
      (let* ((is-ssh (equal method "/ssh"))
             (sudo-method (concat (if (executable-find "doas" t) "/doas" "/sudo")
                                  (if is-ssh "" ":")))
             (components (if is-ssh (cdr splitname) splitname)))
        (mapconcat 'identity (cons sudo-method components) ":")))))

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
  :bind
  (("C-x +" . mpolden/sudo-find-file)
   ("C-x !" . mpolden/sudo-current-file))

  :config
  ;; make sudo:remote-host work as expected
  (add-to-list 'tramp-default-proxies-alist '(nil "\\`root\\'" "/ssh:%h:"))
  (add-to-list 'tramp-default-proxies-alist
               '((regexp-quote (system-name)) nil nil))
  ;; use path configured by remote host
  (add-to-list 'tramp-remote-path 'tramp-own-remote-path))

(provide 'init-tramp)

;;; init-tramp.el ends here
