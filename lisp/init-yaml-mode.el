;; install package
(require-package 'yaml-mode)

;; load yaml-mode
(require 'yaml-mode)

;; don't override C-j
(eval-after-load "yaml-mode"
  '(define-key yaml-mode-map (kbd "C-j") nil))

;; disable electric indent
(add-hook 'yaml-mode-hook
          (lambda () (setq-local electric-indent-mode nil)))

;; ansible group_vars and host_vars
(add-to-list 'auto-mode-alist '("/\\(group\\|host\\)_vars/" . yaml-mode))

;; salt state files
(add-to-list 'auto-mode-alist '("\\.sls\\'" . yaml-mode))

(provide 'init-yaml-mode)
