;; install packages
(require-package 'clojure-mode)
(require-package 'cider)
(require-package 'clj-refactor)

(require 'clojure-mode)
(require 'cider)
(require 'clj-refactor)

;; clj-refactor-mode keybinding
(cljr-add-keybindings-with-prefix "C-c C-m")

;; enable clj-refactor-mode
(add-hook 'clojure-mode-hook (lambda () (clj-refactor-mode 1)))

(provide 'init-clojure-mode)
