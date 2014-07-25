;; install package
(require-package 'go-mode)

(require 'go-mode)

(add-hook 'go-mode-hook
          (lambda ()
            ;; C-c p runs gofmt on the buffer
            (define-key go-mode-map (kbd "C-c p") 'gofmt)
            ;; fix imenu expressions
            (setq-local imenu-generic-expression
                        `(("type" "^type *\\([^ \t\n\r\f]*\\)" 1)
                          ("func" ,go-func-regexp 1)
                          ("func" ,go-func-meth-regexp 2)))
            ;; use flat index for imenu
            (setq-local imenu-generic-expression
                        (mapcar (lambda (arg) (cons nil (cdr arg)))
                                imenu-generic-expression))))

(provide 'init-go-mode)
