(require 'tramp)

(add-to-list 'tramp-default-proxies-alist '(".*" "root" "/ssh:%h:"))

(defun sudo-file-name (filename)
  "Add a sudo prefix to FILENAME.

If filename is accessed over SSH, prefix it with '/sudo:'.
Otherwise, prefix it with '/sudo::' which is an alias for /sudo:root@localhost."
  (let* ((splitname (split-string filename ":"))
         (is-ssh (string-equal (car splitname) "/ssh"))
         (sudo-tramp-prefix (if is-ssh "/sudo" "/sudo:"))
         (components (if is-ssh (cdr splitname) splitname)))
    (mapconcat (lambda (e) e) (cons sudo-tramp-prefix components) ":")))

(defun sudo-find-file (&optional arg)
  "Find file and open it with sudo.
With a prefix ARG prompt edit currently visited file using sudo."
  (interactive "P")
  (if (or arg (not buffer-file-name))
      (find-alternate-file (sudo-file-name buffer-file-name))
    (find-file (sudo-file-name (ido-read-file-name "Find file with sudo: ")))))

(global-set-key (kbd "C-x +") 'sudo-find-file)
(global-set-key (kbd "C-x !") (lambda () (interactive) (sudo-find-file t)))

(provide 'init-tramp)
