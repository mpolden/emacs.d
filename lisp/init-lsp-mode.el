(use-package lsp-mode
  :commands lsp
  :init
  ;; disable yasnippet support
  (setq lsp-enable-snippet nil)
  ;; prefer lsp-ui
  (setq lsp-prefer-flymake :none)
  :hook
  ;; enable lsp in go-mode
  (go-mode . lsp)
  :bind (:map lsp-mode-map
              ;; C-c r renames identifier
              ("C-c r" . lsp-rename)))

(provide 'init-lsp-mode)
