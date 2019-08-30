(use-package lsp-mode
  :commands (lsp lsp-format-buffer)
  :init
  ;; disable yasnippet support
  (setq lsp-enable-snippet nil)
  ;; prefer lsp-ui
  (setq lsp-prefer-flymake nil)
  :hook
  ;; enable lsp in go-mode
  ((go-mode . lsp)
   ;; reformat on save
   (before-save . lsp-format-buffer))
  :bind (:map lsp-mode-map
              ;; C-c r renames identifier
              ("C-c r" . lsp-rename)
              ;; C-c p reformats buffer
              ("C-c p" . lsp-format-buffer)))

(use-package lsp-ui
  :commands lsp-ui-mode
  :init
  ;; disable sideline
  (setq lsp-ui-sideline-enable nil)
  ;; do not show documentation
  (setq lsp-ui-doc-enable nil)
  :hook
  ;; enable lsp-ui-mode in lsp-mode
  (lsp . lsp-ui-mode))

(provide 'init-lsp-mode)
