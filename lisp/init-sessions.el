(use-package desktop
  :ensure nil ;; package is bundled with emacs

  :init
  ;; save list of open files in ~/.emacs.d/.emacs.desktop
  (setq desktop-path (list user-emacs-directory))

  :config
  ;; remember opened files
  (desktop-save-mode 1))

(provide 'init-sessions)
