;; install package
(require-package 'rainbow-delimiters)

;; enable rainbow-delimiters in prog-mode
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(provide 'init-rainbow-delimiters)
