;; install package
(require-package 'dockerfile-mode)

(require 'dockerfile-mode)

;; use dockerfile-mode for dockerfiles
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))

(provide 'init-dockerfile)
