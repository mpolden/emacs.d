;; install packages
(require-package 'js2-mode)
(require-package 'json-mode)

;; load js2-mode
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; load json-mode
(require 'json-mode)
(add-to-list 'auto-mode-alist '("\\.json\\'" . json-mode))

(provide 'init-js2-mode)
