(use-package eglot
  :hook
  ;; enable eglot in go-mode
  ;; requires gopls: env GO111MODULE=on go get golang.org/x/tools/gopls@latest
  ((go-mode . eglot-ensure)
   ;; format on save
   (before-save . eglot-format))

  :bind (:map eglot-mode-map
              ;; C-c r renames identifier
              ("C-c r" . eglot-rename)
              ;; C-c f formats buffer
              ("C-c f" . eglot-format))

  :config
  ;; disable symbol highlighting and documentation on hover
  (setq eglot-ignored-server-capabilites '(:documentHighlightProvider
                                           :hoverProvider))

  ;; disable imenu integration as it's currently unsupported with gopls
  ;; https://github.com/joaotavora/eglot/pull/303
  (setq eglot-stay-out-of '("imenu")))

(provide 'init-eglot)
