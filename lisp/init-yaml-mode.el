;; install package
(require-package 'yaml-mode)

;; load yaml-mode
(require 'yaml-mode)

;; disable electric indent
(add-hook 'yaml-mode-hook
          (lambda () (setq-local electric-indent-mode nil)))

;; ansible group_vars and host_vars
(add-to-list 'auto-mode-alist '("/\\(group\\|host\\)_vars/" . yaml-mode))

(provide 'init-yaml-mode)
