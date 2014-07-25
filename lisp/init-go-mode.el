;; install package
(require-package 'go-mode)

(require 'go-mode)

(add-hook 'go-mode-hook
          (lambda ()
            ;; C-c p runs gofmt on the buffer
            (define-key go-mode-map (kbd "C-c p") 'gofmt)
            ;; fix imenu expressions and use flat index
            (setq-local imenu-generic-expression
                        `((nil "^type *\\([^ \t\n\r\f]*\\)" 1)
                          (nil ,go-func-regexp 1)
                          (nil ,go-func-meth-regexp 2)))))

(provide 'init-go-mode)
