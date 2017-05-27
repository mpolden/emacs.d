;; ido
(use-package ido
  :ensure nil ;; package is bundled with emacs

  :init
  (setq ido-enable-prefix nil
        ido-enable-flex-matching t
        ido-case-fold nil
        ido-auto-merge-work-directories-length -1
        ido-create-new-buffer 'always
        ido-use-filename-at-point nil
        ido-max-prospects 10
        ido-save-directory-list-file (expand-file-name
                                      ".ido.last" user-emacs-directory))

  :config
  (ido-mode 1))

;; flx-ido
(use-package flx-ido
  :init
  ;; disable ido faces to see flx highlights.
  (setq ido-use-faces nil
        flx-ido-threshold 1000)

  :config
  (flx-ido-mode 1))

;; ido-grid-mode
(use-package ido-grid-mode
  :config
  (ido-grid-mode 1))

;; ido-ubiquitous
(use-package ido-ubiquitous
  :config
  (ido-ubiquitous-mode 1))

;; smex
(use-package smex
  :init
  ;; do not update cache automatically on every invocation
  (setq smex-auto-update nil)

  ;; save smex state inside emacs.d
  (setq smex-save-file (expand-file-name ".smex-items" user-emacs-directory))

  :bind ("M-x" . smex)

  :config
  ;; update cache when emacs has been idle for 60 seconds
  (smex-auto-update))

(provide 'init-ido)
