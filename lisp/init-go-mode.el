;; install package
(require-package 'go-mode)

(require 'go-mode)

(add-hook 'go-mode-hook
          (lambda ()
            ;; C-c p runs gofmt on the buffer
            (define-key go-mode-map (kbd "C-c p") 'gofmt)
            ;; use flat index for imenu
            (setq-local imenu-generic-expression
                        (mapcar (lambda (arg) (cons nil (cdr arg)))
                                imenu-generic-expression))))

(provide 'init-go-mode)
