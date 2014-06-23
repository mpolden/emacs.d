;; install packages
(require-package 'clojure-mode)
(require-package 'cider)
(require-package 'paredit)

(require 'clojure-mode)
(require 'cider)
(require 'paredit)

;; prevent cider from prompting to save file
(setq cider-prompt-save-file-on-load nil)

;; enable paredit
(add-hook 'cider-mode-hook 'paredit-mode)
(add-hook 'cider-repl-mode-hook 'paredit-mode)
(add-hook 'emacs-lisp-mode-hook 'paredit-mode)

(provide 'init-lisp)
