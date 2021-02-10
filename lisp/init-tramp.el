(defun sudo-prefix-p (prefix)
  "Return t if PREFIX is a sudo prefix."
  (or (string-equal prefix "/sudo") (string-equal prefix "/sudo:")))

(defun ssh-prefix-p (prefix)
  "Return t if PREFIX is a ssh prefix."
  (string-equal prefix "/ssh"))

(defun sudo-file-name (filename)
  "Return FILENAME with a sudo prefix.

If FILENAME already has a sudo prefix, do nothing. If FILENAME is
accessed over SSH, prefix it with \"/sudo:\". Otherwise, assume
FILENAME is a local path and prefix it with \"/sudo::\"."
  (let* ((splitname (split-string filename ":"))
         (prefix (car splitname))
         (ssh-p (ssh-prefix-p prefix))
         (sudo-p (sudo-prefix-p prefix)))
    (if sudo-p
        filename
      (let ((sudo-prefix (if ssh-p "/sudo" "/sudo:"))
            (components (if ssh-p (cdr splitname) splitname)))
        (mapconcat 'identity (cons sudo-prefix components) ":")))))

(defun sudo-find-file (&optional arg)
  "Find file and open it with sudo.
With a prefix ARG prompt edit currently visited file using sudo."
  (interactive "P")
  (if arg
      (find-alternate-file (sudo-file-name buffer-file-name))
    (find-file (sudo-file-name (read-file-name "Find file with sudo: ")))))

(defun sudo-current-file ()
  (interactive)
  (sudo-find-file t))

(use-package tramp
  :bind
  (("C-x +" . sudo-find-file)
   ("C-x !" . sudo-current-file))

  :config
  ;; make sudo:remote-host work as expected
  (add-to-list 'tramp-default-proxies-alist '(nil "\\`root\\'" "/ssh:%h:"))
  (add-to-list 'tramp-default-proxies-alist
               '((regexp-quote (system-name)) nil nil)))

(provide 'init-tramp)
