;;; init-lisp.el --- configure lisp language support  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(use-package paredit
  :ensure t
  ;; enable paredit in emacs-lisp-mode
  :hook ((emacs-lisp-mode . paredit-mode)))

(provide 'init-lisp)

;;; init-lisp.el ends here
