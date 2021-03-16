(defun mpolden/sudo-prefix-p (prefix)
  "Return non-nil if PREFIX is a sudo prefix."
  (member prefix '("/sudo" "/sudo:")))

(defun mpolden/ssh-prefix-p (prefix)
  "Return non-nil if PREFIX is a ssh prefix."
  (string-equal prefix "/ssh"))

(defun mpolden/sudo-file-name (filename)
  "Return FILENAME with a sudo prefix.

If FILENAME already has a sudo prefix, do nothing. If FILENAME is
accessed over SSH, prefix it with \"/sudo:\". Otherwise, assume
FILENAME is a local path and prefix it with \"/sudo::\"."
  (let* ((splitname (split-string filename ":"))
         (prefix (car splitname)))
    (if (mpolden/sudo-prefix-p prefix)
        filename
      (let* ((ssh (mpolden/ssh-prefix-p prefix))
             (sudo-prefix (if ssh "/sudo" "/sudo:"))
             (components (if ssh (cdr splitname) splitname)))
        (mapconcat 'identity (cons sudo-prefix components) ":")))))

(defun mpolden/sudo-find-file (&optional arg)
  "Find file and open it with sudo.
With a prefix ARG prompt edit currently visited file using sudo."
  (interactive "P")
  (if arg
      (find-alternate-file (mpolden/sudo-file-name buffer-file-name))
    (find-file (mpolden/sudo-file-name (read-file-name "Find file with sudo: ")))))

(defun mpolden/sudo-current-file ()
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
               '((regexp-quote (system-name)) nil nil)))

(provide 'init-tramp)
