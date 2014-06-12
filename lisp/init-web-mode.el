;; install package
(require-package 'web-mode)

(require 'web-mode)

;; assume jinja2 template syntax in .html files
(setq web-mode-engines-alist '(("jinja2" . "\\.html\\'")))

;; use web-mode for .htm, .html and .css
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))

(provide 'init-web-mode)
