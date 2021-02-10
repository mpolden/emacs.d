(use-package eglot
  :ensure t
  :hook
  ;; load eglot automatically for these modes
  ;; - go with gopls: env GO111MODULE=on go get -u golang.org/x/tools/gopls@latest
  ;; - python with pyls: python3 -m pip install --user python-language-server
  ;; - rust with rls: rustup component add rls
  ((go-mode . eglot-ensure)
   (python-mode . eglot-ensure)
   (rust-mode . eglot-ensure)
   ;; format on save
   (before-save . eglot-format))

  :bind (:map eglot-mode-map
              ;; C-c r renames identifier
              ("C-c r" . eglot-rename)
              ;; C-c f formats buffer
              ("C-c f" . eglot-format)
              ;; C-c o organizes imports
              ("C-c o" . eglot-code-action-organize-imports))

  :config
  ;; disable symbol highlighting and documentation on hover
  (setq eglot-ignored-server-capabilites '(:documentHighlightProvider
                                           :hoverProvider)))

(provide 'init-eglot)
