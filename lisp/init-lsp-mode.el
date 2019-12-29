(defun organize-imports-and-format ()
  (interactive)
  (lsp-organize-imports)
  (lsp-format-buffer))

(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :init
  ;; disable yasnippet support
  (setq lsp-enable-snippet nil)
  :hook
  ;; enable lsp in go-mode
  (go-mode . lsp-deferred)
  :bind (:map lsp-mode-map
              ;; C-c r renames identifier
              ("C-c r" . lsp-rename)
              ;; C-c p organizes imports and reformats buffer
              ("C-c p" . organize-imports-and-format)))

(provide 'init-lsp-mode)
