;; install packages
(require-package 'clojure-mode)
(require-package 'cider)
(require-package 'clj-refactor)
(require-package 'paredit)

(require 'clojure-mode)
(require 'cider)
(require 'clj-refactor)
(require 'paredit)

;; clj-refactor-mode keybinding
(cljr-add-keybindings-with-prefix "C-c C-m")

;; enable clj-refactor-mode
(add-hook 'clojure-mode-hook (lambda () (clj-refactor-mode 1)))

;; prevent cider from prompting to save file
(setq cider-prompt-save-file-on-load nil)

;; enable paredit
(add-hook 'cider-mode-hook 'paredit-mode)
(add-hook 'cider-repl-mode-hook 'paredit-mode)

(provide 'init-clojure-mode)
