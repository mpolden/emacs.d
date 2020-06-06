(use-package eglot
  :hook
  ;; load eglot automatically for these modes
  ;; go requires gopls: env GO111MODULE=on go get golang.org/x/tools/gopls@latest
  ;; python requires pyls: python3 -m pip install --user python-language-server
  ((go-mode . eglot-ensure)
   (python-mode . eglot-ensure)
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
                                           :hoverProvider)))

(provide 'init-eglot)
