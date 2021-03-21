;;; init-lisp.el --- configure lisp language support  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(use-package paredit
  :ensure t
  :config
  ;; enable paredit in emacs-lisp-mode
  :hook ((emacs-lisp-mode . paredit-mode)))

;; diminish eldoc from mode line
(use-package eldoc
  :commands eldoc-mode
  :diminish)

(provide 'init-lisp)

;;; init-lisp.el ends here
