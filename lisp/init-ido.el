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
        ido-max-prospects 10)

  :config
  (ido-mode 1))

;; flx-ido
(use-package flx-ido
  :init
  ;; disable ido faces to see flx highlights.
  (setq ido-use-faces nil)

  :config
  (flx-ido-mode 1))

;; ido-vertical-mode
(use-package ido-vertical-mode
  :init
  (setq ido-vertical-show-count t)

  :config
  (ido-vertical-mode 1))

;; ido-ubiquitous
(use-package ido-ubiquitous
  :config
  (ido-ubiquitous-mode 1))

;; smex
(use-package smex
  :bind (("M-x" . smex)
         ("M-X" . smex-major-mode-commands)
         ("C-c C-c M-x" . execute-extended-command)))

(provide 'init-ido)
