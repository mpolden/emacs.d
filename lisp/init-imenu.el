(use-package imenu
  :init
  ;; make imenu automatically rescan buffers
  (setq imenu-auto-rescan t)

  ;; C-c i shows imenu
  ;; imenu will use ido completion if ido-ubiquitous-mode is enabled
  :bind ("C-c i" . imenu))

(provide 'init-imenu)
