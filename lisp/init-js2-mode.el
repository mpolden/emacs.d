;; install package
(require-package 'js2-mode)

;; load js2-mode
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; enable electric-indent-mode
(add-hook 'js2-mode-hook
          (lambda ()
            (set (make-local-variable 'electric-indent-chars)
                 (string-to-list "{}()[]:;,*\n"))
            (electric-indent-mode t)))

(provide 'init-js2-mode)
