;; install package
(require-package 'go-mode)

(require 'go-mode)

(add-hook 'go-mode-hook
          (lambda ()
            ;; C-c p runs gofmt on the buffer
            (define-key go-mode-map (kbd "C-c p") 'gofmt)))

(provide 'init-go-mode)
