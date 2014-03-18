;; install package
(require-package 'go-mode)

;; load go-mode
(require 'go-mode-load)

;; soft tabs or death
(add-hook 'go-mode-hook
          (lambda ()
            (setq
             tab-width 4
             tab-stop-list (number-sequence 4 120 4)
             indent-tabs-mode nil)))

(provide 'init-go-mode)
