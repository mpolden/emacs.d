(use-package eglot
  :hook
  ;; enable eglot in go-mode
  ((go-mode . eglot-ensure)
   ;; format on save
   (before-save . eglot-format))
  :bind (:map eglot-mode-map
              ;; C-c r renames identifier
              ("C-c r" . eglot-rename)
              ;; C-c p formats buffer
              ("C-c p" . eglot-format))
  :config
  ;; disable imenu integration as it's currently unsupported
  ;; https://github.com/joaotavora/eglot/pull/303
  (setq eglot-stay-out-of '("imenu")))

(provide 'init-eglot)
