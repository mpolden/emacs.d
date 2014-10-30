;; add melpa repo
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(defun require-package (package &optional min-version no-refresh)
  "Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will not be
re-downloaded in order to locate PACKAGE."
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (package-install package)
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))

(defun require-packages (packages)
  "Install a list of PACKAGES."
  (mapcar (lambda (package) (require-package package)) packages))

;; add ~/.emacs.d/site-lisp to load path, if it exists
;; used for backported code and overriding existing packages
(let ((site-lisp (expand-file-name "site-lisp" user-emacs-directory)))
  (when (file-directory-p site-lisp)
    (add-to-list 'load-path site-lisp)))

(provide 'init-package)
