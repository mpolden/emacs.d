(use-package imenu
  :ensure nil ;; package is bundled with emacs

  :init
  ;; make imenu automatically rescan buffers
  (setq imenu-auto-rescan t)

  ;; C-c i shows imenu
  :bind ("C-c i" . imenu))

(provide 'init-imenu)
