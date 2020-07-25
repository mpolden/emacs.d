;; add melpa repo
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(when (< emacs-major-version 27)
  (package-initialize))

;; workaround for https://debbugs.gnu.org/cgi/bugreport.cgi?bug=34341
(when (version< emacs-version "26.3")
  (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3"))

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

;; load given package unless inhibited through inhibited-packages
(defun maybe-require (package)
  (unless (and (boundp 'inhibited-packages) (member package inhibited-packages))
    (require package)))

;; install use-package and diminish
(require-packages '(use-package diminish))

;; speed up loading of use-package and dependencies
(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)

(provide 'init-package)
