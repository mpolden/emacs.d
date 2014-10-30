;; install packages
(require-packages '(clojure-mode paredit))

(require 'clojure-mode)
(require 'paredit)

;; enable paredit
(add-hook 'emacs-lisp-mode-hook 'paredit-mode)
(add-hook 'clojure-mode-hook 'paredit-mode)

(provide 'init-lisp)
