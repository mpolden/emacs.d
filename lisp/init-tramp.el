(require 'tramp)

;; make sudo:remote-host work as expected
(add-to-list 'tramp-default-proxies-alist '(nil "\\`root\\'" "/ssh:%h:"))
(add-to-list 'tramp-default-proxies-alist
             '((regexp-quote (system-name)) nil nil))

(defun sudo-file-name (filename)
  "Add a sudo prefix to FILENAME.

If filename is accessed over SSH, prefix it with '/sudo:'.
Otherwise, prefix it with '/sudo::' which is an alias for /sudo:root@localhost."
  (let* ((splitname (split-string filename ":"))
         (ssh-p (string-equal (car splitname) "/ssh"))
         (sudo-prefix (if ssh-p "/sudo" "/sudo:"))
         (components (if ssh-p (cdr splitname) splitname)))
    (mapconcat 'identity (cons sudo-prefix components) ":")))

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
