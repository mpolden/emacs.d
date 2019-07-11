(use-package lsp-mode
  :commands lsp
  :init
  ;; disable yasnippet support
  (setq lsp-enable-snippet nil)
  ;; prefer lsp-ui
  (setq lsp-prefer-flymake nil)
  :hook
  ;; enable lsp in go-mode
  (go-mode . lsp)
  :bind (:map lsp-mode-map
              ;; C-c r renames identifier
              ("C-c r" . lsp-rename)))

(use-package lsp-ui
  :commands lsp-ui-mode
  :init
  ;; disable sideline
  (setq lsp-ui-sideline-enable nil)
  :hook
  ;; enable lsp-ui-mode in lsp-mode
  (lsp . lsp-ui-mode))

(provide 'init-lsp-mode)
